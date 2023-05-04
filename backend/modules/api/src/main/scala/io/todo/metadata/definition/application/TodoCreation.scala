package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.boolean
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoCreation(
    title: VariableTextString,
    completed: Boolean,
    description: VariableTextString,
    tags: List[VariableTextString],
    parentId: Option[TodoId] = None
)
object TodoCreation extends ShapeTag.Companion[TodoCreation] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoCreation")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoCreation] = struct(
    VariableTextString.schema.required[TodoCreation]("title", _.title).addHints(smithy.api.Required()),
    boolean.required[TodoCreation]("completed", _.completed).addHints(smithy.api.Required()),
    VariableTextString.schema.required[TodoCreation]("description", _.description).addHints(smithy.api.Required()),
    Tags.underlyingSchema.required[TodoCreation]("tags", _.tags).addHints(smithy.api.Required()),
    TodoId.schema.optional[TodoCreation]("parentId", _.parentId)
  ) {
    TodoCreation.apply
  }.withId(id).addHints(hints)
}
