package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodosResponse(body: List[TodoResponse])
object TodosResponse extends ShapeTag.Companion[TodosResponse] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodosResponse")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodosResponse] = struct(
    TodosList.underlyingSchema
      .required[TodosResponse]("body", _.body)
      .addHints(smithy.api.HttpPayload(), smithy.api.Required())
  ) {
    TodosResponse.apply
  }.withId(id).addHints(hints)
}
