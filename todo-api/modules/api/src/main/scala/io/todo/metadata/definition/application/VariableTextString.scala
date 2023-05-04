package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.string
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object VariableTextString extends Newtype[String] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "VariableTextString")
  val hints: Hints = Hints()
  val underlyingSchema: Schema[String] =
    string.withId(id).addHints(hints).validated(smithy.api.Length(min = Some(0), max = Some(1000)))
  implicit val schema: Schema[VariableTextString] = bijection(underlyingSchema, asBijection)
}
