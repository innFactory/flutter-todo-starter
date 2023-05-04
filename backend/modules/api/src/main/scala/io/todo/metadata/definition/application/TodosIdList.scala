package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.schema.Schema.list
import smithy4s.Hints
import smithy4s.ShapeId
import smithy4s.schema.Schema.bijection
import smithy4s.Newtype

object TodosIdList extends Newtype[List[TodoId]] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodosIdList")
  val hints: Hints = Hints.empty
  val underlyingSchema: Schema[List[TodoId]] = list(TodoId.schema).withId(id).addHints(hints)
  implicit val schema: Schema[TodosIdList] = bijection(underlyingSchema, asBijection)
}
