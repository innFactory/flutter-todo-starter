package io.todo.metadata.todo.application

import akka.stream.Materializer
import de.innfactory.smithy4play.{AutoRouting, ContextRoute}
import io.todo.metadata.application.controller.BaseController
import io.todo.metadata.definition.application._
import io.todo.metadata.todo.application.mapper.TodoMapper
import io.todo.metadata.todo.domain.interfaces.TodoService
import play.api.Application
import play.api.mvc.ControllerComponents

import javax.inject.Inject
import scala.concurrent.ExecutionContext
import scala.language.implicitConversions

@AutoRouting
class TodoController @Inject() (
    todoService: TodoService
)(implicit
    ec: ExecutionContext,
    cc: ControllerComponents,
    mat: Materializer,
    app: Application
) extends BaseController
    with TodoApiController[ContextRoute]
    with TodoMapper {

  override def getTodoById(todoId: TodoId): ContextRoute[TodoResponse] =
    Endpoint
      .execute(todoService.getTodoById(todoId)(_))
      .complete

  override def getTodos(): ContextRoute[TodosResponse] =
    Endpoint
      .execute(todoService.getTodos()(_))
      .complete(todosToTodosResponse)

  override def updateTodo(todoId: TodoId, body: TodoUpdate): ContextRoute[TodoResponse] =
    Endpoint
      .execute(todoService.updateTodo(todoUpdateToTodo(body, todoId))(_))
      .complete

  def getTodosSync(dateTime: Option[DateWithTime]): ContextRoute[TodoSyncGetResponse] =
    Endpoint
      .execute(todoService.getTodosSync(dateTime.map(_.toDateTime))(_))
      .complete

  override def deleteTodoById(todoId: TodoId): ContextRoute[Unit] =
    Endpoint
      .execute(todoService.deleteTodoById(todoId)(_))
      .complete

  override def createTodo(
      body: TodoCreation
  ): ContextRoute[TodoResponse] =
    Endpoint
      .execute(
        todoService
          .createTodo(body)(_)
      )
      .complete
}
