package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.string
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object DurationString extends Newtype[String] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "DurationString")
  val hints: Hints = Hints(
    smithy.api.Documentation("Duration String in Period Format")
  )
  val underlyingSchema: Schema[String] = string.withId(id).addHints(hints)
  implicit val schema: Schema[DurationString] = bijection(underlyingSchema, asBijection)
}
