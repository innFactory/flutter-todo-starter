package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.boolean
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoUpdate(
    title: VariableTextString,
    description: VariableTextString,
    tags: List[VariableTextString],
    completed: Boolean,
    parentId: Option[TodoId] = None
)
object TodoUpdate extends ShapeTag.Companion[TodoUpdate] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoUpdate")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoUpdate] = struct(
    VariableTextString.schema.required[TodoUpdate]("title", _.title).addHints(smithy.api.Required()),
    VariableTextString.schema.required[TodoUpdate]("description", _.description).addHints(smithy.api.Required()),
    Tags.underlyingSchema.required[TodoUpdate]("tags", _.tags).addHints(smithy.api.Required()),
    boolean.required[TodoUpdate]("completed", _.completed).addHints(smithy.api.Required()),
    TodoId.schema.optional[TodoUpdate]("parentId", _.parentId)
  ) {
    TodoUpdate.apply
  }.withId(id).addHints(hints)
}
