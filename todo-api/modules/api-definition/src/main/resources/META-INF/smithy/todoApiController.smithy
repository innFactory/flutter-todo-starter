$version: "2"

namespace io.todo.metadata.definition.application

use smithy4s.api#simpleRestJson

@simpleRestJson
service TodoApiController {
    version: "1.0.0",
    operations: [
        getTodoById,
        getTodos,
        createTodo,
        updateTodo,
        deleteTodoById,
        getTodosSync,
    ]
}


@http(method: "GET", uri: "/v1/sync/todos", code: 200)
@readonly
operation getTodosSync{
    input: TodoSyncGetRequest,
    output: TodoSyncGetResponse,
}


@http(method: "GET", uri: "/v1/todos/{todoId}", code: 200)
@readonly
operation getTodoById {
    input: TodoByIdRequest,
    output: TodoResponse,
}

apply getTodoById @examples([
    {
        title: "Invoke getTodoById"
        input: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
        },
        output: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
            title: "test",
            completed: false,
            description: "test",
            tags: ["test"]
            createdAt: "2023-04-27T16:20:30.488+02:00",
            updatedAt: "2023-04-27T16:20:30.479+02:00"
        }
    }
])


@http(method: "POST", uri: "/v1/todos", code: 200)
operation createTodo {
    input: TodoCreationRequest,
    output: TodoResponse,
}


apply createTodo @examples([
    {
        title: "Invoke createTodo"
        input: {
            body: {
                title: "test",
                completed: false,
                parentId: "dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9",
                description: "test",
                tags: ["test"]
            }
        },
        output: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
            title: "test",
            completed: false,
            description: "test",
            tags: ["test"]
            parentId: "dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9",
            createdAt: "2023-04-27T16:20:30.488+02:00",
            updatedAt: "2023-04-27T16:20:30.479+02:00"
        }
    }
])


@http(method: "PATCH", uri: "/v1/todos/{todoId}", code: 200)
operation updateTodo {
    input: TodoUpdateRequest,
    output: TodoResponse,
}


apply updateTodo @examples([
    {
        title: "Invoke updateTodo"
        input: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
            body: {
                title: "test",
                completed: false,
                parentId: "dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9",
                description: "test",
                tags: ["test"]
            }
        },
        output: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
            title: "test",
            completed: false,
            description: "test",
            tags: ["test"]
            parentId: "dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9",
            createdAt: "2023-04-27T16:20:30.488+02:00",
            updatedAt: "2023-04-27T16:20:30.479+02:00"
        }
    }
])



@http(method: "DELETE", uri: "/v1/todos/{todoId}", code: 204)
@idempotent
operation deleteTodoById {
    input: TodoByIdRequest
}

apply deleteTodoById @examples([
    {
        title: "Invoke deleteTodoById"
        input: {
            todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
        },
    }
])


@http(method: "GET", uri: "/v1/todos", code: 200)
@readonly
operation getTodos {
    output: TodosResponse,
}

apply getTodos @examples([
    {
        title: "Invoke getTodos"

        output: {
            body: [
                {
                    todoId: "9a65ceeb-f891-40a3-9814-266c306a54f6",
                    title: "test",
                    completed: false,
                    parentId: "dd155ffa-7ed7-4bd9-bbe2-d285f5fba5d9",
                    description: "test",
                    tags: ["test"]
                    createdAt: "2023-04-27T16:20:30.488+02:00",
                    updatedAt: "2023-04-27T16:20:30.479+02:00"
                }
            ]
        }
    }
])


structure TodoByIdRequest {
    @httpLabel
    @required
    todoId: TodoId,
}


list TodosList {
    member: TodoResponse
}


structure TodosResponse {
    @httpPayload
    @required
    body: TodosList
}


structure TodoCreationRequest {
    @httpPayload
    @required
    body: TodoCreation
}

structure TodoCreation {
    @required
    title: VariableTextString,
    @required
    completed: Boolean,
    parentId: TodoId,
    @required
    description: VariableTextString,
    @required
    tags: Tags,
}


structure TodoSyncGetRequest {
    @httpQuery("timestamp")
    dateTime: DateWithTime,
}


structure TodoSyncGetResponse {
    @required
    entities: TodosList
    @required
    deleted: TodosIdList
}

list TodosIdList {
    member: TodoId
}


structure TodoUpdateRequest {
    @httpLabel
    @required
    todoId: TodoId,
    @httpPayload
    @required
    body: TodoUpdate
}


structure TodoUpdate {
    @required
    title: VariableTextString,
    @required
    @required
    description: VariableTextString,
    @required
    tags: Tags,
    @required
    completed: Boolean,
    parentId: TodoId,
}


structure TodoResponse {
    @required
    todoId: TodoId,
    @required
    title: VariableTextString,
    @required
    description: VariableTextString,
    @required
    tags: Tags,
    @required
    completed: Boolean,
    @required
    createdAt: DateWithTime,
    @required
    updatedAt: DateWithTime,
    parentId: TodoId,
}


list Tags {
    member: VariableTextString
}


