package io.todo.metadata.application.controller

import cats.data.{EitherT, Kleisli}
import de.innfactory.play.controller.{ErrorResult, ResultStatus}
import de.innfactory.play.smithy4play.{AbstractBaseController, HttpHeaders, ImplicitLogContext}
import de.innfactory.smithy4play.{ContextRouteError, RoutingContext}
import io.opentelemetry.api.trace.Span
import io.todo.metadata.commons.RequestContext
import play.api.Application

import scala.concurrent.ExecutionContext

class BaseController(implicit ec: ExecutionContext, app: Application)
    extends AbstractBaseController[ResultStatus, RequestContext, RequestContext]
    with ImplicitLogContext
    with BaseMapper {

  override def AuthAction: Kleisli[ApplicationRouteResult, RequestContext, RequestContext] = Kleisli { _ =>
    EitherT.rightT(RequestContext.empty)
  }

  override def errorHandler(e: ResultStatus): ContextRouteError =
    e match {
      case result: ErrorResult =>
        new ContextRouteError {
          override def message: String = result.message
          override def additionalInfoToLog: Option[String] = result.additionalInfoToLog
          override def additionalInfoErrorCode: Option[String] = result.additionalInfoErrorCode
          override def statusCode: Int = result.statusCode
          override def additionalInformation: Option[String] = None
        }
    }

  override def createRequestContextFromRoutingContext(r: RoutingContext): RequestContext =
    new RequestContext(HttpHeaders(r.map))

  override def contextWithSpan(rc: RequestContext, span: Span): RequestContext =
    new RequestContext(rhttpHeaders = rc.httpHeaders)
}
