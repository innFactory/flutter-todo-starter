package io.todo.metadata.commons.implicits

import cats.data.EitherT
import de.innfactory.play.controller.ResultStatus

import scala.concurrent.{ExecutionContext, Future}

object EitherToOptionImplicit {

  implicit class EitherTToOption[O](eitherT: EitherT[Future, ResultStatus, O]) {
    def optional(implicit ec: ExecutionContext) = EitherT.right[ResultStatus](eitherT.value.map(_.toOption))
  }

}
