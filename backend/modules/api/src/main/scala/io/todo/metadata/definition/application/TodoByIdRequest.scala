package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoByIdRequest(todoId: TodoId)
object TodoByIdRequest extends ShapeTag.Companion[TodoByIdRequest] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoByIdRequest")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoByIdRequest] = struct(
    TodoId.schema.required[TodoByIdRequest]("todoId", _.todoId).addHints(smithy.api.HttpLabel(), smithy.api.Required())
  ) {
    TodoByIdRequest.apply
  }.withId(id).addHints(hints)
}
