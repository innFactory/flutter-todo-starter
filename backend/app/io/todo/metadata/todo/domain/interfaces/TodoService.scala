package io.todo.metadata.todo.domain.interfaces

import cats.data.EitherT
import com.google.inject.ImplementedBy
import de.innfactory.play.controller.ResultStatus
import io.todo.metadata.commons.RequestContext
import io.todo.metadata.todo.domain.models.{Todo, TodoId}
import io.todo.metadata.todo.domain.services.DomainTodoService

import scala.concurrent.Future

@ImplementedBy(classOf[DomainTodoService])
trait TodoService {

  def getTodoById(todoId: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo]

  def updateTodo(todo: Todo)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo]

  def deleteTodoById(todoId: TodoId)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Unit]

  def createTodo(todo: Todo)(implicit rc: RequestContext): EitherT[Future, ResultStatus, Todo]

  def getTodos()(implicit rc: RequestContext): EitherT[Future, ResultStatus, Seq[Todo]]

  def getTodosSync(dateTime: Option[org.joda.time.DateTime])(implicit
      rc: RequestContext
  ): EitherT[Future, ResultStatus, (Seq[Todo], Seq[TodoId])]

}
