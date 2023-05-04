package io.todo.metadata.todo.domain.models

import org.joda.time.DateTime

case class Todo(
    id: TodoId,
    title: String,
    description: String,
    tags: Set[String],
    completed: Boolean,
    parentId: Option[TodoId],
    deletedAt: Option[org.joda.time.DateTime],
    createdAt: org.joda.time.DateTime,
    updatedAt: org.joda.time.DateTime
)

object Todo {
  def patch(newObject: Todo, oldObject: Todo): Todo =
    newObject.copy(
      id = oldObject.id,
      createdAt = oldObject.createdAt,
      updatedAt = DateTime.now
    )
}
