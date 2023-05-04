package io.todo.metadata.todo.domain.interfaces

import cats.data.EitherT
import com.google.inject.ImplementedBy
import de.innfactory.play.controller.ResultStatus
import io.todo.metadata.commons.RequestContext
import io.todo.metadata.todo.domain.models.{Todo, TodoId}
import io.todo.metadata.todo.infrastructure.SlickTodoRepository

import scala.concurrent.Future

@ImplementedBy(classOf[SlickTodoRepository])
trait TodoRepository {

  def getById(
      id: TodoId
  )(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, Todo]

  def create(
      item: Todo
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo]

  def update(
      item: Todo
  )(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo]

  def deleteTodoById(todoId: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Boolean]

  def getTodos()(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, Seq[Todo]]

  def getTodosSync(dateTime: Option[org.joda.time.DateTime])(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, (Seq[Todo], Seq[TodoId])]

}
