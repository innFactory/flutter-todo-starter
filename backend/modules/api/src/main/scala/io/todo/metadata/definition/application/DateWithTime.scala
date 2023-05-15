package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.string
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object DateWithTime extends Newtype[String] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "DateWithTime")
  val hints : Hints = Hints(
    smithy.api.Documentation("ISO Date With Time"),
  )
  val underlyingSchema : Schema[String] = string.withId(id).addHints(hints).validated(smithy.api.Pattern("^\\d{4}-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\d(\\.\\d+)?(([+-]\\d\\d:\\d\\d)|Z)?$"))
  implicit val schema : Schema[DateWithTime] = bijection(underlyingSchema, asBijection)
}