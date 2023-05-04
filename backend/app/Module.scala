import akka.Done
import akka.actor.ActorSystem
import akka.management.cluster.bootstrap.ClusterBootstrap
import akka.management.scaladsl.AkkaManagement
import akka.persistence.jdbc.testkit.scaladsl.SchemaUtils
import com.google.inject.AbstractModule
import com.typesafe.config.Config
import de.innfactory.play.flyway.FlywayMigrator
import de.innfactory.play.tracing.OpentelemetryProvider
import play.api.inject.ApplicationLifecycle
import play.api.libs.concurrent.AkkaGuiceSupport
import play.api.{Configuration, Environment, Logger}
import slick.jdbc.JdbcBackend.Database

import javax.inject.{Inject, Provider, Singleton}
import scala.concurrent.{ExecutionContext, Future}
import scala.util.Try

/**
 * This module handles the bindings for the API to the Slick implementation.
 *
 * https://www.playframework.com/documentation/latest/ScalaDependencyInjection#Programmatic-bindings
 */
class Module(environment: Environment, configuration: Configuration) extends AbstractModule with AkkaGuiceSupport {

  val logger = Logger("application")

  override def configure(): Unit = {
    logger.info(s"Configuring ${environment.mode}")

    bind(classOf[Database]).toProvider(classOf[DatabaseProvider])
    bind(classOf[FlywayMigratorImpl]).asEagerSingleton()
    bind(classOf[TracingConfigurator]).asEagerSingleton()
    bind(classOf[SchemaMigrator]).asEagerSingleton()
    bind(classOf[AkkaCluster]).asEagerSingleton()

    /**
     * Inject Modules depended on environment (Test, Prod, Dev)
     */

  }
}

@Singleton
class TracingConfigurator @Inject() (implicit ec: ExecutionContext, config: Config, lifecycle: ApplicationLifecycle) {
  Try(
    OpentelemetryProvider.configureMock()
  )
}
@Singleton
class AkkaCluster @Inject() (system: ActorSystem) {
  AkkaManagement(system).start()
  ClusterBootstrap(system).start()
}

@Singleton
class SchemaMigrator @Inject() (implicit ec: ExecutionContext, system: ActorSystem) {
  val done: Future[Done] = SchemaUtils.createIfNotExists()
}

/** Migrate Flyway on application start */
class FlywayMigratorImpl @Inject() (env: Environment, configuration: Configuration)
    extends FlywayMigrator(configuration, env, configIdentifier = "todo-api.database")

@Singleton
class DatabaseProvider @Inject() (config: Config) extends Provider[Database] {
  lazy val get = Database.forConfig("todo-api.database", config)
}
