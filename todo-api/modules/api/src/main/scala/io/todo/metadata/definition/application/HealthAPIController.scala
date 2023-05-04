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

trait HealthAPIControllerGen[F[_, _, _, _, _]] {
  self =>

  def ping(): F[Unit, Nothing, Unit, Nothing, Nothing]
  def liveness(): F[Unit, Nothing, Unit, Nothing, Nothing]
  def readiness(): F[Unit, Nothing, Unit, Nothing, Nothing]

  def transform[G[_, _, _, _, _]](transformation: Transformation[F, G]): HealthAPIControllerGen[G] = new Transformed(
    transformation
  )
  class Transformed[G[_, _, _, _, _]](transformation: Transformation[F, G]) extends HealthAPIControllerGen[G] {
    def ping() = transformation[Unit, Nothing, Unit, Nothing, Nothing](self.ping())
    def liveness() = transformation[Unit, Nothing, Unit, Nothing, Nothing](self.liveness())
    def readiness() = transformation[Unit, Nothing, Unit, Nothing, Nothing](self.readiness())
  }
}

object HealthAPIControllerGen extends Service[HealthAPIControllerGen, HealthAPIControllerOperation] {

  def apply[F[_]](implicit F: Monadic[HealthAPIControllerGen, F]): F.type = F

  val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "HealthAPIController")

  val hints: Hints = Hints(
    smithy4s.api.SimpleRestJson()
  )

  val endpoints: List[Endpoint[HealthAPIControllerOperation, _, _, _, _, _]] = List(
    Ping,
    Liveness,
    Readiness
  )

  val version: String = "1.0.0"

  def endpoint[I, E, O, SI, SO](op: HealthAPIControllerOperation[I, E, O, SI, SO]) = op match {
    case Ping()      => ((), Ping)
    case Liveness()  => ((), Liveness)
    case Readiness() => ((), Readiness)
  }

  object reified extends HealthAPIControllerGen[HealthAPIControllerOperation] {
    def ping() = Ping()
    def liveness() = Liveness()
    def readiness() = Readiness()
  }

  def transform[P[_, _, _, _, _]](
      transformation: Transformation[HealthAPIControllerOperation, P]
  ): HealthAPIControllerGen[P] = reified.transform(transformation)

  def transform[P[_, _, _, _, _], P1[_, _, _, _, _]](
      alg: HealthAPIControllerGen[P],
      transformation: Transformation[P, P1]
  ): HealthAPIControllerGen[P1] = alg.transform(transformation)

  def asTransformation[P[_, _, _, _, _]](
      impl: HealthAPIControllerGen[P]
  ): Transformation[HealthAPIControllerOperation, P] = new Transformation[HealthAPIControllerOperation, P] {
    def apply[I, E, O, SI, SO](op: HealthAPIControllerOperation[I, E, O, SI, SO]): P[I, E, O, SI, SO] = op match {
      case Ping()      => impl.ping()
      case Liveness()  => impl.liveness()
      case Readiness() => impl.readiness()
    }
  }
  case class Ping() extends HealthAPIControllerOperation[Unit, Nothing, Unit, Nothing, Nothing]
  object Ping extends Endpoint[HealthAPIControllerOperation, Unit, Nothing, Unit, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "ping")
    val input: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api.Http(method = smithy.api.NonEmptyString("GET"), uri = smithy.api.NonEmptyString("/"), code = 200),
      smithy.api.Readonly()
    )
    def wrap(input: Unit) = Ping()
  }
  case class Liveness() extends HealthAPIControllerOperation[Unit, Nothing, Unit, Nothing, Nothing]
  object Liveness extends Endpoint[HealthAPIControllerOperation, Unit, Nothing, Unit, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "liveness")
    val input: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api
        .Http(method = smithy.api.NonEmptyString("GET"), uri = smithy.api.NonEmptyString("/liveness"), code = 200),
      smithy.api.Readonly()
    )
    def wrap(input: Unit) = Liveness()
  }
  case class Readiness() extends HealthAPIControllerOperation[Unit, Nothing, Unit, Nothing, Nothing]
  object Readiness extends Endpoint[HealthAPIControllerOperation, Unit, Nothing, Unit, Nothing, Nothing] {
    val id: ShapeId = ShapeId("io.todo.metadata.definition.application", "readiness")
    val input: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Input.widen)
    val output: Schema[Unit] = unit.addHints(smithy4s.internals.InputOutput.Output.widen)
    val streamedInput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val streamedOutput: StreamingSchema[Nothing] = StreamingSchema.nothing
    val hints: Hints = Hints(
      smithy.api
        .Http(method = smithy.api.NonEmptyString("GET"), uri = smithy.api.NonEmptyString("/readiness"), code = 200),
      smithy.api.Readonly()
    )
    def wrap(input: Unit) = Readiness()
  }
}

sealed trait HealthAPIControllerOperation[Input, Err, Output, StreamedInput, StreamedOutput]
