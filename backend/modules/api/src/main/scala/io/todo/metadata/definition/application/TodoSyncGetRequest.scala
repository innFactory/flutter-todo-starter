package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoSyncGetRequest(dateTime: Option[DateWithTime] = None)
object TodoSyncGetRequest extends ShapeTag.Companion[TodoSyncGetRequest] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoSyncGetRequest")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoSyncGetRequest] = struct(
    DateWithTime.schema.optional[TodoSyncGetRequest]("dateTime", _.dateTime).addHints(smithy.api.HttpQuery("timestamp"))
  ) {
    TodoSyncGetRequest.apply
  }.withId(id).addHints(hints)
}
