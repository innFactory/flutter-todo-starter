package io.todo.metadata.commons.infrastructure

import cats.data.EitherT
import cats.implicits._
import de.innfactory.implicits.OptionUtils.EnhancedOption
import de.innfactory.play.controller.ResultStatus
import de.innfactory.play.results.Results.Result
import de.innfactory.play.results.errors.Errors.{BadRequest, DatabaseResult, NotFound}
import de.innfactory.play.smithy4play.ImplicitLogContext
import de.innfactory.play.tracing.TraceContext
import io.todo.metadata.commons.implicits.EitherImplicits.EitherFuture
import play.api.inject.ApplicationLifecycle
import slick.dbio.{DBIOAction, Effect, NoStream}
import slick.jdbc.JdbcBackend.Database

import scala.concurrent.{ExecutionContext, Future}
import scala.language.implicitConversions
import scala.util.Try

class BaseSlickDAO(db: Database)(implicit ec: ExecutionContext, lifecycle: ApplicationLifecycle)
    extends ImplicitLogContext {

  def lookupGeneric[R, T](
      queryHeadOption: DBIOAction[Option[R], NoStream, Nothing]
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[T]] = {
    val queryResult: Future[Option[R]] = db.run(queryHeadOption)
    queryResult.map { res: Option[R] =>
      if (res.isDefined)
        Right(rowToObject(res.get))
      else
        Left(
          NotFound()
        )
    }
  }

  def lookupGenericOption[R, T](
      queryHeadOption: DBIOAction[Option[R], NoStream, Nothing]
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Option[T]] = {
    val queryResult: Future[Option[R]] = db.run(queryHeadOption)
    queryResult.map { res: Option[R] =>
      if (res.isDefined)
        Some(rowToObject(res.get))
      else
        None
    }
  }

  def countGeneric[R, T](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing]
  )(implicit rc: TraceContext): Future[Result[Int]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map(seq => Right(seq.length))
  }

  def lookupSequenceGeneric[R, T](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing]
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[Seq[T]]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      Right(res.map(rowToObject))
    }
  }

  def lookupSequenceGenericRawSequence[R, T](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing]
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Seq[T]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      res.map(rowToObject)
    }
  }

  def lookupSequenceGeneric[R, T](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing],
      count: Int
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[Seq[T]]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      Right(res.takeRight(count).map(rowToObject))
    }
  }

  def lookupSequenceGeneric[R, T](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing],
      from: Int,
      to: Int
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[Seq[T]]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      Right(res.slice(from, to + 1).map(rowToObject))
    }
  }

  def lookupSequenceGeneric[R, T, X, Z](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing],
      mapping: T => X,
      filter: X => Boolean,
      afterFilterMapping: X => Z
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[Seq[Z]]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      Right(res.map(rowToObject).map(mapping).filter(filter).map(afterFilterMapping))
    }
  }

  def lookupSequenceGeneric[R, T, Z](
      querySeq: DBIOAction[Seq[R], NoStream, Nothing],
      sequenceMapping: Seq[T] => Z
  )(implicit rowToObject: R => T, rc: TraceContext): Future[Result[Z]] = {
    val queryResult: Future[Seq[R]] = db.run(querySeq)
    queryResult.map { res: Seq[R] =>
      val sequence = res.map(rowToObject)
      Right(sequenceMapping(sequence))
    }
  }

  def updateGeneric[R, T](
      queryById: DBIOAction[Option[R], NoStream, Nothing],
      update: T => DBIOAction[Int, NoStream, Effect.Write],
      patch: T => T
  )(implicit rowToObject: R => T, tc: TraceContext): Future[Result[T]] = {
    val result = for {
      lookup <- EitherT(db.run(queryById).map(_.toEither(BadRequest())))
      patchedObject <- EitherT(Future(Option(patch(rowToObject(lookup))).toEither(BadRequest())))
      patchResult <-
        EitherT[Future, ResultStatus, T](
          db.run(update(patchedObject)).map { x =>
            if (x != 0) Right(patchedObject)
            else {
              // rc.log.error("Database Result Updating entity")
              Left(
                DatabaseResult("Could not update entity")
              )
            }
          }
        )
    } yield patchResult
    result.value
  }

  def createGeneric[R, T](
      entity: T,
      queryById: DBIOAction[Option[R], NoStream, Nothing],
      create: R => DBIOAction[R, NoStream, Effect.Write]
  )(implicit rowToObject: R => T, objectToRow: T => R, rc: TraceContext): Future[Result[T]] = {
    val entityToSave = objectToRow(entity)
    val result = for {
      _ <- EitherT(db.run(queryById).map(_.toInverseEither(BadRequest())))
      createdObject <- EitherT(
        Try(db.run(create(entityToSave))).toEither
          .leftMap(throwable => BadRequest(throwable.getMessage))
          .foldEitherOfFuture
      )
      res <- EitherT.right[ResultStatus](Future(rowToObject(createdObject)))
    } yield res
    result.value
  }

  def createGeneric[R, T](
      entity: T,
      create: R => DBIOAction[R, NoStream, Effect.Write]
  )(implicit rowToObject: R => T, objectToRow: T => R, tc: TraceContext): Future[Result[T]] = {
    val entityToSave = objectToRow(entity)
    val result = for {
      createdObject <- EitherT(
        Try(db.run(create(entityToSave))).toEither
          .leftMap(throwable => BadRequest(throwable.getMessage))
          .foldEitherOfFuture
      )
      res <- EitherT.right[ResultStatus](Future(rowToObject(createdObject)))
    } yield res
    result.value
  }

  def deleteGeneric[R, T](
      queryById: DBIOAction[Option[R], NoStream, Nothing],
      delete: DBIOAction[Int, NoStream, Effect.Write]
  )(implicit tc: TraceContext): Future[Result[Boolean]] = {

    val result = for {
      _ <- EitherT(
        db.run(queryById)
          .map(_.toEither(NotFound("entity not found")))
      )
      dbDeleteResult <- EitherT(
        Try(db.run(delete)).toEither
          .leftMap[ResultStatus](_ => DatabaseResult("Database constraint or foreign key"))
          .foldEitherOfFuture
          .map(t => t.map(_ => true))
      )
    } yield dbDeleteResult
    result.value
  }

  /**
   * Close dao
   * @return
   */
  def close(): Future[Unit] =
    Future.successful(db.close())

  lifecycle.addStopHook(() =>
    Future.successful {
      close()
    }
  )

}
