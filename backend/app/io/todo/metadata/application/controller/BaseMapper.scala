package io.todo.metadata.application.controller

import de.innfactory.play.smithy4play.PlayJsonToDocumentMapper
import io.scalaland.chimney.Transformer
import io.todo.metadata.definition.application.{Date, DateWithTime, DurationString}
import org.joda.time.{DateTime, LocalDate, Period}
import play.api.libs.json.JsValue
import smithy4s.Document

trait BaseMapper {

  implicit val transformJsValueToDocument: Transformer[JsValue, Document] = PlayJsonToDocumentMapper.mapToDocument
  implicit val transformDocumentToJsValue: Transformer[Document, JsValue] = PlayJsonToDocumentMapper.documentToJsValue

  implicit def unitMapper[T](any: T): Unit = ()

  implicit def unitToUnitMapper(unit: Unit): Unit = ()

  implicit def dateWithTimeToDateTime(dateWithTime: DateWithTime): DateTime =
    DateTime.parse(dateWithTime.value)

  implicit def dateTimeToDateWithTime(dateTime: DateTime): DateWithTime =
    DateWithTime(dateTime.toString())

  implicit def durationToString(period: Period): DurationString =
    DurationString(period.toString)

  implicit def dateToLocalDate(date: Date): LocalDate =
    LocalDate.parse(date.value)

  implicit def localDateToDate(localDate: LocalDate): Date =
    Date.apply(localDate.toString())

  implicit def sequenceTransformer[T, R](seq: Seq[T])(implicit transform: T => R): List[R] =
    seq.map(transform).toList

  implicit val dateWithTimeOptionToDateTimeOptionTransformer: Transformer[Option[DateWithTime], Option[DateTime]] =
    (dateWithTime: Option[DateWithTime]) => dateWithTime.map(dateWithTimeToDateTime)

  implicit val dateWithTimeToDateTimeTransformer: Transformer[DateWithTime, DateTime] =
    (dateWithTime: DateWithTime) => dateWithTimeToDateTime(dateWithTime)

  implicit val periodToStringTransformer: Transformer[Period, DurationString] =
    (period: Period) => durationToString(period)

  implicit val dateTimeToDateWithTimeTransformer: Transformer[DateTime, DateWithTime] =
    (dateTime: DateTime) => dateTimeToDateWithTime(dateTime)

  implicit val dateTimeOptionToDateWithTimeOptionTransformer: Transformer[Option[DateTime], Option[DateWithTime]] =
    (dateTime: Option[DateTime]) => dateTime.map(dateTimeToDateWithTime)

  implicit val dateToLocalDateTransformer: Transformer[Date, LocalDate] =
    (date: Date) => dateToLocalDate(date)

  implicit val localDateToDateTransformer: Transformer[LocalDate, Date] =
    (localDate: LocalDate) => localDateToDate(localDate)

  implicit val transformFloatToDouble: Transformer[Float, Double] =
    (float: Float) => float.toDouble

}
