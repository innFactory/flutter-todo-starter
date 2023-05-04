package io.todo.metadata.todo.domain.services

import cats.data.EitherT
import de.innfactory.play.controller.ResultStatus
import de.innfactory.play.smithy4play.ImplicitLogContext
import io.todo.metadata.commons.RequestContext
import io.todo.metadata.todo.domain.interfaces.{TodoRepository, TodoService}
import io.todo.metadata.todo.domain.models.{Todo, TodoId}

import javax.inject.Inject
import scala.concurrent.{ExecutionContext, Future}

private[todo] class DomainTodoService @Inject() (
    todoRepository: TodoRepository
)(implicit
    ec: ExecutionContext
) extends TodoService
    with ImplicitLogContext {

  override def getTodoById(
      todoId: TodoId
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo] =
    for {
      todo <- todoRepository.getById(todoId)
    } yield todo

  override def getTodos(
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, Seq[Todo]] =
    for {
      todos <- todoRepository.getTodos()
    } yield todos

  override def updateTodo(
      todo: Todo
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo] =
    for {
      updatedProject <- todoRepository.update(todo)
    } yield updatedProject

  override def deleteTodoById(todoId: TodoId)(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, Unit] =
    for {
      _ <- todoRepository.deleteTodoById(todoId)
    } yield ()

  override def createTodo(todo: Todo)(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, Todo] =
    for {
      created <- todoRepository.create(todo)
    } yield created

  override def getTodosSync(dateTime: Option[org.joda.time.DateTime])(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, (Seq[Todo], Seq[TodoId])] =
    for {
      todos <- todoRepository.getTodosSync(dateTime)
    } yield todos

}
