package io.todo.metadata.commons.implicits

import org.joda.time.{DateTime, LocalDate}

object JodaImplicits {

  implicit class JodaEnhanced(localDate: LocalDate) {
    def <=(other: LocalDate): Boolean = localDate.isBefore(other) || localDate == other
    def >=(other: LocalDate): Boolean = localDate.isAfter(other) || localDate == other
  }

  implicit class DateTimeEnhanced(dateTime: DateTime) {
    def <=(other: DateTime): Boolean = dateTime.isBefore(other) || dateTime == other

    def >=(other: DateTime): Boolean = dateTime.isAfter(other) || dateTime == other
  }

}
