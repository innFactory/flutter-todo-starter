package io.todo.metadata.todo.infrastructure

import cats.data.EitherT
import com.github.tototoshi.slick.PostgresJodaSupport._
import dbdata.Tables
import de.innfactory.play.controller.ResultStatus
import de.innfactory.play.db.codegen.XPostgresProfile.api._
import io.todo.metadata.commons.RequestContext
import io.todo.metadata.commons.infrastructure.BaseSlickDAO
import io.todo.metadata.todo.domain.interfaces.TodoRepository
import io.todo.metadata.todo.domain.models.Todo.patch
import io.todo.metadata.todo.domain.models.{Todo, TodoId}
import io.todo.metadata.todo.infrastructure.mapper.TodoMapper._
import org.joda.time.DateTime
import play.api.inject.ApplicationLifecycle
import slick.jdbc.JdbcBackend.Database

import javax.inject.Inject
import scala.concurrent.{ExecutionContext, Future}

private[todo] class SlickTodoRepository @Inject() (db: Database)(implicit
    ec: ExecutionContext,
    lifecycle: ApplicationLifecycle
) extends BaseSlickDAO(db)
    with TodoRepository {

  private val queryById = (id: TodoId) =>
    Compiled(
      Tables.Todo
        .filter(_.deletedAt.isEmpty)
        .filter(_.id === id.value)
    )

  override def getById(id: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo] =
    EitherT(lookupGeneric(queryById(id).result.headOption))

  override def getTodos()(implicit rc: RequestContext): EitherT[Future, ResultStatus, Seq[Todo]] =
    EitherT(
      lookupSequenceGeneric(
        Tables.Todo
          .filter(_.deletedAt.isEmpty)
          .result
      )
    )

  override def update(todo: Todo)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo] =
    for {
      updated <- EitherT(
        updateGeneric(
          queryById(todo.id).result.headOption,
          (c: Todo) => Tables.Todo.filter(_.id === todo.id.value).update(todoToTodoRow(c)),
          oldTodo => patch(todo, oldTodo)
        )
      )
    } yield updated

//  override def deleteTodoById(id: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Boolean] =
//    EitherT
//      .right(
//        db.run(
//          Tables.Todo
//            .filter(_.id === id.value)
//            .map(_.deletedAt)
//            .update(Some(DateTime.now()))
//        )
//      )
//      .map(_ => true)

  override def deleteTodoById(id: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Boolean] = {
    def getChildren(todoId: TodoId): EitherT[Future, ResultStatus, Seq[Todo]] =
      EitherT(
        lookupSequenceGeneric(
          Tables.Todo
            .filter(_.deletedAt.isEmpty)
            .filter(_.parentId === todoId.value)
            .result
        )
      )
    def getAllChildren(todoId: TodoId): EitherT[Future, ResultStatus, Seq[Todo]] =
      for {
        children <- getChildren(todoId)
        allChildren <- children
          .map(child => getAllChildren(child.id))
          .foldLeft(EitherT.rightT[Future, ResultStatus](Seq.empty[Todo]))((acc, child) =>
            for {
              acc <- acc
              child <- child
            } yield acc ++ child
          )
      } yield children ++ allChildren

    for {
      todo <- EitherT(lookupGeneric(queryById(id).result.headOption))
      updateTodo <- EitherT
        .right(
          db.run(
            Tables.Todo
              .filter(_.id === todo.id.value)
              .map(_.deletedAt)
              .update(Some(DateTime.now()))
          )
        )
        .map(_ => true)
      update <- getAllChildren(id).map(
        _.map(todo =>
          EitherT
            .right(
              db.run(
                Tables.Todo
                  .filter(_.id === todo.id.value)
                  .map(_.deletedAt)
                  .update(Some(DateTime.now()))
              )
            )
        )
      )

    } yield updateTodo
  }

  override def create(todo: Todo)(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, Todo] =
    EitherT(
      createGeneric(
        todo,
        row => (Tables.Todo returning Tables.Todo) += row
      )
    )

  override def getTodosSync(
      dateTime: Option[DateTime]
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, (Seq[Todo], Seq[TodoId])] =
    if (dateTime.isEmpty) {
      for {
        todos <- EitherT
          .right(
            db.run(
              Tables.Todo
                .filter(_.deletedAt.isEmpty)
                .result
            )
          )
          .map(_.map(todoRowToTodo))
      } yield (todos, Seq.empty[TodoId])

    } else
      for {
        createOrUpdatedTodos <- EitherT
          .right(
            db.run(
              Tables.Todo
                .filter(_.deletedAt.isEmpty)
                .filter(todo => todo.createdAt > dateTime || todo.updatedAt > dateTime)
                .result
            )
          )
          .map(_.map(todoRowToTodo))

        deletedTodoIds <- EitherT
          .right(
            db.run(
              Tables.Todo
                .filter(_.deletedAt > dateTime)
                .filter(_.createdAt < dateTime)
                .result
            )
          )
          .map(_.map(todoRowToTodo).map(_.id))

      } yield (createOrUpdatedTodos, deletedTodoIds)

}
