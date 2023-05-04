package io.todo.metadata.application.controller

import cats.data.EitherT
import de.innfactory.play.controller.ResultStatus
import de.innfactory.smithy4play.{AutoRouting, ContextRoute}
import io.todo.metadata.commons.RequestContext
import io.todo.metadata.commons.infrastructure.DatabaseHealthSocket
import io.todo.metadata.definition.application.HealthAPIController
import play.api.Application
import play.api.mvc.ControllerComponents

import javax.inject.Inject
import scala.concurrent.{ExecutionContext, Future}

@AutoRouting
class HealthController @Inject() (
    databaseHealthSocket: DatabaseHealthSocket
)(implicit ec: ExecutionContext, cc: ControllerComponents, app: Application)
    extends BaseController
    with HealthAPIController[ContextRoute] {

  override def ping(): ContextRoute[Unit] =
    Endpoint.execute(checkHealthState(_)).complete

  override def liveness(): ContextRoute[Unit] =
    Endpoint.execute(checkHealthState(_)).complete

  private def checkHealthState(implicit requestContext: RequestContext): EitherT[Future, ResultStatus, String] =
    for {
      result <- EitherT.rightT[Future, ResultStatus]("Ok")
    } yield result

  override def readiness(): ContextRoute[Unit] =
    Endpoint.execute(checkHealthState(_)).complete
}
