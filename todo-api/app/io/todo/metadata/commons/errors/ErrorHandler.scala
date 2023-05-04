package io.todo.metadata.commons.errors

import de.innfactory.play.controller.ErrorResponse
import de.innfactory.play.results.errors.ErrorResponseWithAdditionalBody
import play.api.http.HttpErrorHandler
import play.api.mvc._
import play.api.mvc.Results._

import scala.concurrent._
import javax.inject.Singleton
import play.api.Logger

@Singleton
class ErrorHandler extends HttpErrorHandler {

  /**
   * Custom error handler for custom client error handling
   * @param request
   * @param statusCode
   * @param message
   * @return
   */
  def onClientError(request: RequestHeader, statusCode: Int, message: String) = {
    val log = Logger("play")
    log.warn("ClientError " + message)
    Future.successful(
      Status(statusCode)(
        statusCode match {
          case 404 => ErrorResponse("client error: likely wrong path").toJson
          case 400 => ErrorResponse("client error: request or query malformed").toJson
          case _   => ErrorResponse("client error: unknown error").toJson
        }
      )
    )
  }

  case class JsonError(jsonPath: String, errorDetails: String)

  import play.api.libs.json.Json
  object JsonError {
    implicit val format = Json.format[JsonError]
  }

  /**
   * Custom error handler for custom server error handling
   * @param request
   * @param exception
   * @return
   */
  def onServerError(request: RequestHeader, exception: Throwable) = {
    val log = Logger("play")
    Future.successful(exception match {
      case e: java.net.ConnectException =>
        log.logger.error(e.toString)
        InternalServerError(ErrorResponse("internal server error", Some("I-001")).toJson)
      case e: play.api.libs.json.JsResultException =>
        e.printStackTrace()
        log.logger.error(e.toString)
        BadRequest(
          ErrorResponseWithAdditionalBody(
            "Invalid Json",
            Json.toJson(
              e.errors.map(error =>
                JsonError(
                  error._1.path.mkString(", "),
                  error._2.flatMap(_.messages).mkString(", ")
                )
              )
            )
          ).toJson
        )
      case pg: org.postgresql.util.PSQLException =>
        log.error(request.toString(), exception)
        BadRequest(ErrorResponse("internal server error", Some("I-002")).toJson)
      case _ =>
        log.error(request.toString(), exception)
        InternalServerError(ErrorResponse("internal server error", Some("I-000")).toJson)
    })

  }
}
