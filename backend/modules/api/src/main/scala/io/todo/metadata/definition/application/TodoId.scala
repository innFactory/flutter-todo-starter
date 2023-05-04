package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.string
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object TodoId extends Newtype[String] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoId")
  val hints: Hints = Hints()
  val underlyingSchema: Schema[String] =
    string.withId(id).addHints(hints).validated(smithy.api.Length(min = Some(1), max = Some(50)))
  implicit val schema: Schema[TodoId] = bijection(underlyingSchema, asBijection)
}
