package io.todo.metadata.commons.errors

import de.innfactory.implicits.Showable
import de.innfactory.play.controller.ErrorResult

object AdditionalErrors {

  case class InvalidPassword(
      message: String =
        "Password does not match specified format | min 8 characters in length, min 1 uppercase character",
      additionalInfoToLog: Option[String] = None,
      additionalInfoErrorCode: Option[String] = Some("INVALID_PASSWORD"),
      statusCode: Int = 400
  ) extends ErrorResult()
      with Showable

  case class InvalidLicense(
      message: String = "Invalid or missing license for requested resource",
      additionalInfoToLog: Option[String] = None,
      additionalInfoErrorCode: Option[String] = Some("INVALID_LICENSE"),
      statusCode: Int = 402
  ) extends ErrorResult()
      with Showable

  case class EmailNotVerified(
      message: String = "Email not verified",
      additionalInfoToLog: Option[String] = None,
      additionalInfoErrorCode: Option[String] = Some("EMAIL_VERIFICATION_MISSING"),
      statusCode: Int = 400
  ) extends ErrorResult()
      with Showable

  case class AlreadyReported(
      message: String = "Already Reported",
      additionalInfoToLog: Option[String] = None,
      additionalInfoErrorCode: Option[String] = Some("ALREADY_REPORTED"),
      statusCode: Int = 208
  ) extends ErrorResult()
      with Showable

}
