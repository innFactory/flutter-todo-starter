package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.schema.Schema.list
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object TodosList extends Newtype[List[TodoResponse]] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodosList")
  val hints: Hints = Hints.empty
  val underlyingSchema: Schema[List[TodoResponse]] = list(TodoResponse.schema).withId(id).addHints(hints)
  implicit val schema: Schema[TodosList] = bijection(underlyingSchema, asBijection)
}
