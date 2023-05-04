package io.todo.metadata.definition

package object application {
  type TodoApiController[F[_]] = smithy4s.Monadic[TodoApiControllerGen, F]
  object TodoApiController extends smithy4s.Service.Provider[TodoApiControllerGen, TodoApiControllerOperation] {
    def apply[F[_]](implicit F: TodoApiController[F]): F.type = F
    def service: smithy4s.Service[TodoApiControllerGen, TodoApiControllerOperation] = TodoApiControllerGen
    val id: smithy4s.ShapeId = service.id
  }
  type HealthAPIController[F[_]] = smithy4s.Monadic[HealthAPIControllerGen, F]
  object HealthAPIController extends smithy4s.Service.Provider[HealthAPIControllerGen, HealthAPIControllerOperation] {
    def apply[F[_]](implicit F: HealthAPIController[F]): F.type = F
    def service: smithy4s.Service[HealthAPIControllerGen, HealthAPIControllerOperation] = HealthAPIControllerGen
    val id: smithy4s.ShapeId = service.id
  }

  type DateWithTime = io.todo.metadata.definition.application.DateWithTime.Type
  type Tags = io.todo.metadata.definition.application.Tags.Type
  type TodoId = io.todo.metadata.definition.application.TodoId.Type
  type TodosList = io.todo.metadata.definition.application.TodosList.Type
  type Date = io.todo.metadata.definition.application.Date.Type
  type DurationString = io.todo.metadata.definition.application.DurationString.Type
  type TodosIdList = io.todo.metadata.definition.application.TodosIdList.Type
  type VariableTextString = io.todo.metadata.definition.application.VariableTextString.Type

}
