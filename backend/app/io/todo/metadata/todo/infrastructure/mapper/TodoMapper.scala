package io.todo.metadata.todo.infrastructure.mapper

import dbdata.Tables
import io.scalaland.chimney.dsl.TransformerOps
import io.todo.metadata.todo.domain.models.{Todo, TodoId}

import scala.language.implicitConversions

private[infrastructure] object TodoMapper {

  implicit def todoRowToTodo(row: Tables.TodoRow): Todo =
    row
      .into[Todo]
      .withFieldComputed(_.id, r => TodoId(r.id))
      .withFieldComputed(_.parentId, r => r.parentId.map(TodoId(_)))
      .withFieldComputed(_.tags, r => r.tags.toSet)
      .transform

  implicit def todoToTodoRow(todo: Todo): Tables.TodoRow =
    todo
      .into[Tables.TodoRow]
      .withFieldComputed(_.id, r => r.id.value)
      .withFieldComputed(_.parentId, r => r.parentId.map(_.value))
      .withFieldComputed(_.tags, r => r.tags.toList)
      .transform

}
