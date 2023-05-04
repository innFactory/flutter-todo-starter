package io.todo.metadata.commons.errors

import de.innfactory.play.results.errors.Errors.{BadRequest, TokenExpiredError}

object ErrorsWithErrorCodes {

  val InvitationAlreadyAccepted: BadRequest =
    BadRequest("Invitation was already accepted", additionalInfoErrorCode = Some("INV-0001"))
  val InvitationEmailInvalid: BadRequest =
    BadRequest("Invitation is invalid", additionalInfoErrorCode = Some("INV-0002"))
  val InvitationTokenInvalid: BadRequest =
    BadRequest("Invitation is invalid", additionalInfoErrorCode = Some("INV-0003"))
  val InvitationAlreadyInvalidated: BadRequest =
    BadRequest("Invitation is invalid", additionalInfoErrorCode = Some("INV-0004"))

  // USER
  val UserAlreadyExists: BadRequest =
    BadRequest("User Already Exists", additionalInfoErrorCode = Some("USER-0001"))
  val PrivacyPolicyNotAccepted: BadRequest =
    BadRequest("Privacy policy must be accepted", additionalInfoErrorCode = Some("USER-0002"))
  val TermsOfServiceNotAccepted: BadRequest =
    BadRequest("Terms of service not accepted", additionalInfoErrorCode = Some("USER-0003"))
  val PasswordResetInvalidToken: TokenExpiredError =
    TokenExpiredError("Invalid Token", additionalInfoErrorCode = Some("USER-0004"))
  val PasswordResetInvalidTokenRateLimit: TokenExpiredError =
    TokenExpiredError("Invalid Token", additionalInfoErrorCode = Some("USER-0005"))
  val PasswordResetInvalidTokenExpired: TokenExpiredError =
    TokenExpiredError("Invalid Token", additionalInfoErrorCode = Some("USER-0006"))
  val InvalidUser: TokenExpiredError =
    TokenExpiredError("Invalid User", additionalInfoErrorCode = Some("USER-0007"))

}
