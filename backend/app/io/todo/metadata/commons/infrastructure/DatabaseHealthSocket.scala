package io.todo.metadata.commons.infrastructure

import play.api.inject.ApplicationLifecycle
import slick.jdbc.JdbcBackend.Database

import java.sql.Connection
import javax.inject.{Inject, Singleton}
import scala.concurrent.{ExecutionContext, Future}

@Singleton
class DatabaseHealthSocket @Inject() (
    db: Database,
    lifecycle: ApplicationLifecycle
)(implicit ec: ExecutionContext) {
  private val connection: Connection = db.source.createConnection()

  lifecycle.addStopHook { () =>
    Future.successful(connection.close())
  }
}
