package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoUpdateRequest(todoId: TodoId, body: TodoUpdate)
object TodoUpdateRequest extends ShapeTag.Companion[TodoUpdateRequest] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoUpdateRequest")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoUpdateRequest] = struct(
    TodoId.schema
      .required[TodoUpdateRequest]("todoId", _.todoId)
      .addHints(smithy.api.HttpLabel(), smithy.api.Required()),
    TodoUpdate.schema
      .required[TodoUpdateRequest]("body", _.body)
      .addHints(smithy.api.HttpPayload(), smithy.api.Required())
  ) {
    TodoUpdateRequest.apply
  }.withId(id).addHints(hints)
}
