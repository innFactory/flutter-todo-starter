package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoCreationRequest(body: TodoCreation)
object TodoCreationRequest extends ShapeTag.Companion[TodoCreationRequest] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoCreationRequest")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoCreationRequest] = struct(
    TodoCreation.schema
      .required[TodoCreationRequest]("body", _.body)
      .addHints(smithy.api.HttpPayload(), smithy.api.Required())
  ) {
    TodoCreationRequest.apply
  }.withId(id).addHints(hints)
}
