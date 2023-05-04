package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.string
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object Date extends Newtype[String] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "Date")
  val hints: Hints = Hints(
    smithy.api.Documentation("ISO Date")
  )
  val underlyingSchema: Schema[String] =
    string.withId(id).addHints(hints).validated(smithy.api.Pattern("^\\d{4}-\\d{2}-\\d{2}$"))
  implicit val schema: Schema[Date] = bijection(underlyingSchema, asBijection)
}
