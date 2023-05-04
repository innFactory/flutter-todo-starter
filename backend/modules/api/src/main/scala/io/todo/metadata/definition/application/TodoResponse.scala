package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.Hints
import smithy4s.schema.Schema.boolean
import smithy4s.ShapeId
import smithy4s.schema.Schema.struct
import smithy4s.ShapeTag

case class TodoResponse(
    todoId: TodoId,
    title: VariableTextString,
    description: VariableTextString,
    tags: List[VariableTextString],
    completed: Boolean,
    createdAt: DateWithTime,
    updatedAt: DateWithTime,
    parentId: Option[TodoId] = None
)
object TodoResponse extends ShapeTag.Companion[TodoResponse] {
  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoResponse")

  val hints: Hints = Hints.empty

  implicit val schema: Schema[TodoResponse] = struct(
    TodoId.schema.required[TodoResponse]("todoId", _.todoId).addHints(smithy.api.Required()),
    VariableTextString.schema.required[TodoResponse]("title", _.title).addHints(smithy.api.Required()),
    VariableTextString.schema.required[TodoResponse]("description", _.description).addHints(smithy.api.Required()),
    Tags.underlyingSchema.required[TodoResponse]("tags", _.tags).addHints(smithy.api.Required()),
    boolean.required[TodoResponse]("completed", _.completed).addHints(smithy.api.Required()),
    DateWithTime.schema.required[TodoResponse]("createdAt", _.createdAt).addHints(smithy.api.Required()),
    DateWithTime.schema.required[TodoResponse]("updatedAt", _.updatedAt).addHints(smithy.api.Required()),
    TodoId.schema.optional[TodoResponse]("parentId", _.parentId)
  ) {
    TodoResponse.apply
  }.withId(id).addHints(hints)
}
