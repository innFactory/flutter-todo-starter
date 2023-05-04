package io.todo.metadata.definition.application

import smithy4s.Schema
import smithy4s.schema.Schema.unit
import smithy4s.Hints
import smithy4s.StreamingSchema
import smithy4s.Transformation
import smithy4s.Monadic
import smithy4s.ShapeId
import smithy4s.Endpoint
import smithy4s.Service

trait TodoApiControllerGen[F[_, _, _, _, _]] {
  self =>

  def getTodoById(todoId: TodoId): F[TodoByIdRequest, Nothing, TodoResponse, Nothing, Nothing]
  def getTodos(): F[Unit, Nothing, TodosResponse, Nothing, Nothing]
  def createTodo(body: TodoCreation): F[TodoCreationRequest, Nothing, TodoResponse, Nothing, Nothing]
  def updateTodo(todoId: TodoId, body: TodoUpdate): F[TodoUpdateRequest, Nothing, TodoResponse, Nothing, Nothing]
  def deleteTodoById(todoId: TodoId): F[TodoByIdRequest, Nothing, Unit, Nothing, Nothing]
  def getTodosSync(
      dateTime: Option[DateWithTime] = None
  ): F[TodoSyncGetRequest, Nothing, TodoSyncGetResponse, Nothing, Nothing]

  def transform[G[_, _, _, _, _]](transformation: Transformation[F, G]): TodoApiControllerGen[G] = new Transformed(
    transformation
  )
  class Transformed[G[_, _, _, _, _]](transformation: Transformation[F, G]) extends TodoApiControllerGen[G] {
    def getTodoById(todoId: TodoId) =
      transformation[TodoByIdRequest, Nothing, TodoResponse, Nothing, Nothing](self.getTodoById(todoId))
    def getTodos() = transformation[Unit, Nothing, TodosResponse, Nothing, Nothing](self.getTodos())
    def createTodo(body: TodoCreation) =
      transformation[TodoCreationRequest, Nothing, TodoResponse, Nothing, Nothing](self.createTodo(body))
    def updateTodo(todoId: TodoId, body: TodoUpdate) =
      transformation[TodoUpdateRequest, Nothing, TodoResponse, Nothing, Nothing](self.updateTodo(todoId, body))
    def deleteTodoById(todoId: TodoId) =
      transformation[TodoByIdRequest, Nothing, Unit, Nothing, Nothing](self.deleteTodoById(todoId))
    def getTodosSync(dateTime: Option[DateWithTime] = None) =
      transformation[TodoSyncGetRequest, Nothing, TodoSyncGetResponse, Nothing, Nothing](self.getTodosSync(dateTime))
  }
}

object TodoApiControllerGen extends Service[TodoApiControllerGen, TodoApiControllerOperation] {

  def apply[F[_]](implicit F: Monadic[TodoApiControllerGen, F]): F.type = F

  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "TodoApiController")

  val hints: Hints = Hints(
    smithy4s.api.SimpleRestJson()
  )

  val endpoints: List[Endpoint[TodoApiControllerOperation, _, _, _, _, _]] = List(
    GetTodoById,
    GetTodos,
    CreateTodo,
    UpdateTodo,
    DeleteTodoById,
    GetTodosSync
  )

  val version: String = "1.0.0"

  def endpoint[I, E, O, SI, SO](op: TodoApiControllerOperation[I, E, O, SI, SO]) = op match {
    case GetTodoById(input)    => (input, GetTodoById)
    case GetTodos()            => ((), GetTodos)
    case CreateTodo(input)     => (input, CreateTodo)
    case UpdateTodo(input)     => (input, UpdateTodo)
    case DeleteTodoById(input) => (input, DeleteTodoById)
    case GetTodosSync(input)   => (input, GetTodosSync)
  }

  object reified extends TodoApiControllerGen[TodoApiControllerOperation] {
    def getTodoById(todoId: TodoId) = GetTodoById(TodoByIdRequest(todoId))
    def getTodos() = GetTodos()
    def createTodo(body: TodoCreation) = CreateTodo(TodoCreationRequest(body))
    def updateTodo(todoId: TodoId, body: TodoUpdate) = UpdateTodo(TodoUpdateRequest(todoId, body))
    def deleteTodoById(todoId: TodoId) = DeleteTodoById(TodoByIdRequest(todoId))
    def getTodosSync(dateTime: Option[DateWithTime] = None) = GetTodosSync(TodoSyncGetRequest(dateTime))
  }

  def transform[P[_, _, _, _, _]](
      transformation: Transformation[TodoApiControllerOperation, P]
  ): TodoApiControllerGen[P] = reified.transform(transformation)

  def transform[P[_, _, _, _, _], P1[_, _, _, _, _]](
      alg: TodoApiControllerGen[P],
      transformation: Transformation[P, P1]
  ): TodoApiControllerGen[P1] = alg.transform(transformation)

  def asTransformation[P[_, _, _, _, _]](impl: TodoApiControllerGen[P]): Transformation[TodoApiControllerOperation, P] =
    new Transformation[TodoApiControllerOperation, P] {
      def apply[I, E, O, SI, SO](op: TodoApiControllerOperation[I, E, O, SI, SO]): P[I, E, O, SI, SO] = op match {
        case GetTodoById(TodoByIdRequest(todoId))        => impl.getTodoById(todoId)
        case GetTodos()                                  => impl.getTodos()
        case CreateTodo(TodoCreationRequest(body))       => impl.createTodo(body)
        case UpdateTodo(TodoUpdateRequest(todoId, body)) => impl.updateTodo(todoId, body)
        case DeleteTodoById(TodoByIdRequest(todoId))     => impl.deleteTodoById(todoId)
        case GetTodosSync(TodoSyncGetRequest(dateTime))  => impl.getTodosSync(dateTime)
      }
    }
  case class GetTodoById(input: TodoByIdRequest)
      extends TodoApiControllerOperation[TodoByIdRequest, Nothing, TodoResponse, Nothing, Nothing]
  object GetTodoById
      extends Endpoint[TodoApiControllerOperation, TodoByIdRequest, Nothing, TodoResponse, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "getTodoById")
    val input: Schema[TodoByIdRequest] = TodoByIdRequest.schema.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[TodoResponse] = TodoResponse.schema.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Examples(
        List(
          smithy.api.Example(
            title = "Invoke getTodoById",
            documentation = None,
            input = Some(
              smithy4s.Document.obj("todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"))
            ),
            output = Some(
              smithy4s.Document.obj(
                "todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"),
                "title" -> smithy4s.Document.fromString("test"),
                "completed" -> smithy4s.Document.fromBoolean(false),
                "description" -> smithy4s.Document.fromString("test"),
                "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test")),
                "createdAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.488+02:00"),
                "updatedAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.479+02:00")
              )
            ),
            error = None
          )
        )
      ),
      smithy.api.Http(
        method = smithy.api.NonEmptyString("GET"),
        uri = smithy.api.NonEmptyString("/v1/todos/{todoId}"),
        code = 200
      ),
      smithy.api.Readonly()
    )
    def wrap(input: TodoByIdRequest) = GetTodoById(input)
  }
  case class GetTodos() extends TodoApiControllerOperation[Unit, Nothing, TodosResponse, Nothing, Nothing]
  object GetTodos extends Endpoint[TodoApiControllerOperation, Unit, Nothing, TodosResponse, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "getTodos")
    val input: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[TodosResponse] = TodosResponse.schema.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Examples(
        List(
          smithy.api.Example(
            title = "Invoke getTodos",
            documentation = None,
            input = None,
            output = Some(
              smithy4s.Document.obj(
                "body" -> smithy4s.Document.array(
                  smithy4s.Document.obj(
                    "todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"),
                    "title" -> smithy4s.Document.fromString("test"),
                    "completed" -> smithy4s.Document.fromBoolean(false),
                    "parentId" -> smithy4s.Document.fromString("dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9"),
                    "description" -> smithy4s.Document.fromString("test"),
                    "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test")),
                    "createdAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.488+02:00"),
                    "updatedAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.479+02:00")
                  )
                )
              )
            ),
            error = None
          )
        )
      ),
      smithy.api
        .Http(method = smithy.api.NonEmptyString("GET"), uri = smithy.api.NonEmptyString("/v1/todos"), code = 200),
      smithy.api.Readonly()
    )
    def wrap(input: Unit) = GetTodos()
  }
  case class CreateTodo(input: TodoCreationRequest)
      extends TodoApiControllerOperation[TodoCreationRequest, Nothing, TodoResponse, Nothing, Nothing]
  object CreateTodo
      extends Endpoint[TodoApiControllerOperation, TodoCreationRequest, Nothing, TodoResponse, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "createTodo")
    val input: Schema[TodoCreationRequest] =
      TodoCreationRequest.schema.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[TodoResponse] = TodoResponse.schema.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Examples(
        List(
          smithy.api.Example(
            title = "Invoke createTodo",
            documentation = None,
            input = Some(
              smithy4s.Document.obj(
                "body" -> smithy4s.Document.obj(
                  "title" -> smithy4s.Document.fromString("test"),
                  "completed" -> smithy4s.Document.fromBoolean(false),
                  "parentId" -> smithy4s.Document.fromString("dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9"),
                  "description" -> smithy4s.Document.fromString("test"),
                  "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test"))
                )
              )
            ),
            output = Some(
              smithy4s.Document.obj(
                "todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"),
                "title" -> smithy4s.Document.fromString("test"),
                "completed" -> smithy4s.Document.fromBoolean(false),
                "description" -> smithy4s.Document.fromString("test"),
                "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test")),
                "parentId" -> smithy4s.Document.fromString("dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9"),
                "createdAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.488+02:00"),
                "updatedAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.479+02:00")
              )
            ),
            error = None
          )
        )
      ),
      smithy.api
        .Http(method = smithy.api.NonEmptyString("POST"), uri = smithy.api.NonEmptyString("/v1/todos"), code = 200)
    )
    def wrap(input: TodoCreationRequest) = CreateTodo(input)
  }
  case class UpdateTodo(input: TodoUpdateRequest)
      extends TodoApiControllerOperation[TodoUpdateRequest, Nothing, TodoResponse, Nothing, Nothing]
  object UpdateTodo
      extends Endpoint[TodoApiControllerOperation, TodoUpdateRequest, Nothing, TodoResponse, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "updateTodo")
    val input: Schema[TodoUpdateRequest] = TodoUpdateRequest.schema.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[TodoResponse] = TodoResponse.schema.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Examples(
        List(
          smithy.api.Example(
            title = "Invoke updateTodo",
            documentation = None,
            input = Some(
              smithy4s.Document.obj(
                "todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"),
                "body" -> smithy4s.Document.obj(
                  "title" -> smithy4s.Document.fromString("test"),
                  "completed" -> smithy4s.Document.fromBoolean(false),
                  "parentId" -> smithy4s.Document.fromString("dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9"),
                  "description" -> smithy4s.Document.fromString("test"),
                  "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test"))
                )
              )
            ),
            output = Some(
              smithy4s.Document.obj(
                "todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"),
                "title" -> smithy4s.Document.fromString("test"),
                "completed" -> smithy4s.Document.fromBoolean(false),
                "description" -> smithy4s.Document.fromString("test"),
                "tags" -> smithy4s.Document.array(smithy4s.Document.fromString("test")),
                "parentId" -> smithy4s.Document.fromString("dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9"),
                "createdAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.488+02:00"),
                "updatedAt" -> smithy4s.Document.fromString("2023-04-27T16:20:30.479+02:00")
              )
            ),
            error = None
          )
        )
      ),
      smithy.api.Http(
        method = smithy.api.NonEmptyString("PATCH"),
        uri = smithy.api.NonEmptyString("/v1/todos/{todoId}"),
        code = 200
      )
    )
    def wrap(input: TodoUpdateRequest) = UpdateTodo(input)
  }
  case class DeleteTodoById(input: TodoByIdRequest)
      extends TodoApiControllerOperation[TodoByIdRequest, Nothing, Unit, Nothing, Nothing]
  object DeleteTodoById extends Endpoint[TodoApiControllerOperation, TodoByIdRequest, Nothing, Unit, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "deleteTodoById")
    val input: Schema[TodoByIdRequest] = TodoByIdRequest.schema.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Examples(
        List(
          smithy.api.Example(
            title = "Invoke deleteTodoById",
            documentation = None,
            input = Some(
              smithy4s.Document.obj("todoId" -> smithy4s.Document.fromString("9a65ceeb-f891-40a3-9814-266c306a54f6"))
            ),
            output = None,
            error = None
          )
        )
      ),
      smithy.api.Idempotent(),
      smithy.api.Http(
        method = smithy.api.NonEmptyString("DELETE"),
        uri = smithy.api.NonEmptyString("/v1/todos/{todoId}"),
        code = 204
      )
    )
    def wrap(input: TodoByIdRequest) = DeleteTodoById(input)
  }
  case class GetTodosSync(input: TodoSyncGetRequest)
      extends TodoApiControllerOperation[TodoSyncGetRequest, Nothing, TodoSyncGetResponse, Nothing, Nothing]
  object GetTodosSync
      extends Endpoint[TodoApiControllerOperation, TodoSyncGetRequest, Nothing, TodoSyncGetResponse, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "getTodosSync")
    val input: Schema[TodoSyncGetRequest] =
      TodoSyncGetRequest.schema.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[TodoSyncGetResponse] =
      TodoSyncGetResponse.schema.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api
        .Http(method = smithy.api.NonEmptyString("GET"), uri = smithy.api.NonEmptyString("/v1/sync/todos"), code = 200),
      smithy.api.Readonly()
    )
    def wrap(input: TodoSyncGetRequest) = GetTodosSync(input)
  }
}

sealed trait TodoApiControllerOperation[Input, Err, Output, StreamedInput, StreamedOutput]
