package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoSyncGetResponse(entities: List[TodoResponse], deleted: List[TodoId])
object TodoSyncGetResponse extends ShapeTag.Companion[TodoSyncGetResponse] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoSyncGetResponse")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoSyncGetResponse] = struct(
    TodosList.underlyingSchema.required[TodoSyncGetResponse]("entities", _.entities).addHints(smithy.api.Required()),
    TodosIdList.underlyingSchema.required[TodoSyncGetResponse]("deleted", _.deleted).addHints(smithy.api.Required())
  ) {
    TodoSyncGetResponse.apply
  }.withId(id).addHints(hints)
}
