package io.todo.metadata.todo.domain.models

import io.scalaland.chimney.Transformer
import io.todo.metadata.definition.application

import java.util.UUID

case class TodoId(value: String)

object TodoId {
  def generate: TodoId = TodoId(UUID.randomUUID().toString)

  implicit val fromDomain = (todoId: TodoId) => application.TodoId(todoId.value)

  implicit val toDomain = (id: application.TodoId) => TodoId(id.value)

  implicit val fromDomainTransformer: Transformer[TodoId, application.TodoId] = fromDomain(_)
  implicit val toDomainTransformer: Transformer[application.TodoId, TodoId] = toDomain(_)

}
