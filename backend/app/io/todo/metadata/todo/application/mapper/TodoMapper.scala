package io.todo.metadata.todo.application.mapper

import io.scalaland.chimney.dsl.TransformerOps
import io.todo.metadata.application.controller.BaseMapper
import io.todo.metadata.definition.application
import io.todo.metadata.definition.application._
import io.todo.metadata.todo.domain.models.{Todo, TodoId}
import org.joda.time.DateTime

import scala.language.implicitConversions

trait TodoMapper extends BaseMapper {

  implicit def todosToTodosResponse(todos: Seq[Todo]): TodosResponse =
    TodosResponse(todos.map(todoToTodoResponse))

  implicit def todosWithEntitiesToTodosResponse(todos: Seq[Todo]): TodosResponse =
    TodosResponse(todos.map(todoToTodoResponse))

  implicit def todoToTodoResponse(todo: Todo): TodoResponse =
    todo
      .into[TodoResponse]
      .withFieldComputed(_.title, v => VariableTextString(v.title))
      .withFieldComputed(_.description, v => VariableTextString(v.description))
      .withFieldComputed(_.todoId, v => application.TodoId(v.id.value))
      .withFieldComputed(_.parentId, v => v.parentId.map(id => application.TodoId(id.value)))
      .withFieldComputed(_.tags, v => v.tags.map(tag => VariableTextString(tag)).toList)
      .transform

  implicit def todoCreationToTodo(todo: TodoCreation): Todo =
    todo
      .into[Todo]
      .withFieldComputed(_.title, _.title.value)
      .withFieldComputed(_.description, _.description.value)
      .withFieldConst(_.createdAt, DateTime.now())
      .withFieldConst(_.updatedAt, DateTime.now())
      .withFieldConst(_.deletedAt, None)
      .withFieldComputed(_.id, v => TodoId.generate)
      .withFieldComputed(_.parentId, v => v.parentId.map(id => TodoId(id.value)))
      .withFieldComputed(_.tags, v => v.tags.map(_.value).toSet)
      .transform

  implicit def todoUpdateToTodo(todo: TodoUpdate, id: TodoId): Todo =
    todo
      .into[Todo]
      .withFieldComputed(_.id, v => id)
      .withFieldComputed(_.description, _.description.value)
      .withFieldComputed(_.title, _.title.value)
      .withFieldConst(_.createdAt, DateTime.now())
      .withFieldConst(_.updatedAt, DateTime.now())
      .withFieldConst(_.deletedAt, None)
      .withFieldComputed(_.parentId, v => v.parentId.map(id => TodoId(id.value)))
      .withFieldComputed(_.tags, v => v.tags.map(_.value).toSet)
      .transform

  implicit def todosSyncTupleToResponse(todoTuple: (Seq[Todo], Seq[TodoId])): TodoSyncGetResponse =
    TodoSyncGetResponse(
      entities = todoTuple._1.map(todoToTodoResponse).toList,
      deleted = todoTuple._2.map(id => application.TodoId(id.value)).toList
    )

}
