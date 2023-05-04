package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.schema.Schema.list
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object Tags extends Newtype[List[VariableTextString]] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "Tags")
  val hints: Hints = Hints.empty
  val underlyingSchema: Schema[List[VariableTextString]] = list(VariableTextString.schema).withId(id).addHints(hints)
  implicit val schema: Schema[Tags] = bijection(underlyingSchema, asBijection)
}
