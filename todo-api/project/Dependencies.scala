import play.sbt.PlayImport.*
import sbt.*

object Dependencies {

  lazy val list = Seq(
    endpointBuilder,
    nimbusOIDC,
    mailersendSDK,
    scalaUtil,
    akkaManagementClusterHttp,
    akkaManagementClusterBootstrap,
    akkaDiscovery,
    akkaDiscoveryKubernetes,
    sl4j,
    akkaPersistenceJdbc,
    akkaProjectionsEventSourced,
    akkaPersistenceTyped,
    akkaPersistenceQuery,
    akkaProjectionsJdbc,
    akkaClusterShardingTyped,
    ws,
    googleCredentials,
    akkaSpray,
    googleCommon,
    googlePubSub,
    akkaStream,
    pubSub,
    chimney,
    logback,
    logstashLogbackEncoder,
    akkaHttp,
    akka,
    akkaTyped,
    akkaJackson,
    guice,
    slickPg,
    slickPgPlayJson,
    slickJodaMapper,
    playJson,
    playJsonJoda,
    slick,
    slickCodegen,
    akkaProjectionsSlick,
    slickHikaricp,
    hikariCP,
    joda,
    jodaJackson,
    postgresql,
    scalatestPlus,
    akkaTestkit,
    playAhcWS,
    slickPgJts,
    akkaStreams,
    cats,
    nimbusJwt,
    gcpCloudStorage
  )
  val scalaVersion = "2.13.8"
  val akkaVersion = "2.6.20"
  val akkaManagementVersion = "1.1.3"
  val akkaTyped = "com.typesafe.akka" %% "akka-actor-typed" % akkaVersion
  val akkaHttp = "com.typesafe.akka" %% "akka-http" % "10.2.9"
  val akka = "com.typesafe.akka" %% "akka-actor" % akkaVersion
  val akkaPersistenceTyped = "com.typesafe.akka" %% "akka-persistence-typed" % akkaVersion
  val akkaPersistenceJdbc = "com.lightbend.akka" %% "akka-persistence-jdbc" % "5.0.4"
  val akkaProjectionsEventSourced = "com.lightbend.akka" %% "akka-projection-eventsourced" % "1.2.3"
  val akkaProjectionsJdbc = "com.lightbend.akka" %% "akka-projection-jdbc" % "1.2.3"
  val akkaPersistenceQuery = "com.typesafe.akka" %% "akka-persistence-query" % akkaVersion
  val akkaProjectionsSlick = "com.lightbend.akka" %% "akka-projection-slick" % "1.2.3"
  val akkaDiscovery = "com.typesafe.akka" %% "akka-discovery" % akkaVersion
  val akkaManagementClusterHttp =
    "com.lightbend.akka.management" %% "akka-management-cluster-http" % akkaManagementVersion
  val akkaManagementClusterBootstrap =
    "com.lightbend.akka.management" %% "akka-management-cluster-bootstrap" % akkaManagementVersion
  val akkaDiscoveryKubernetes =
    "com.lightbend.akka.discovery" %% "akka-discovery-kubernetes-api" % akkaManagementVersion
  // PubSub
  val pubSub = "com.lightbend.akka" %% "akka-stream-alpakka-google-cloud-pub-sub" % "3.0.4"
  val googlePubSub = "com.google.cloud" % "google-cloud-pubsub" % "1.116.4"
  val akkaStream = "com.typesafe.akka" %% "akka-stream" % akkaVersion
  val akkaSpray = "com.typesafe.akka" %% "akka-http-spray-json" % "10.2.9"
  val googleCredentials = "com.google.auth" % "google-auth-library-oauth2-http" % "1.6.0"
  val googleCommon = "com.lightbend.akka" %% "akka-stream-alpakka-google-common" % "3.0.4"
  val akkaClusterShardingTyped = "com.typesafe.akka" %% "akka-cluster-sharding-typed" % akkaVersion
  // Mailersend
  val mailersendSDK = "com.mailersend" % "java-sdk" % "1.0.0"
  // https://github.com/akka/akka/issues/29351
  val akkaJackson = "com.typesafe.akka" %% "akka-serialization-jackson" % akkaVersion

  // innFactory Utils
  val akkaStreams = "com.typesafe.akka" %% "akka-stream" % akkaVersion
  val scalaUtil = "de.innfactory.scala-utils" %% "scala-utils" % "2.0.4"
  // Prod
  val slickPg = "com.github.tminglei" %% "slick-pg" % "0.20.3"
  val slickPgPlayJson = "com.github.tminglei" %% "slick-pg_play-json" % "0.20.3"
  val slickPgJts = "com.github.tminglei" %% "slick-pg_jts" % "0.20.3"
  val slickJodaMapper = "com.github.tototoshi" %% "slick-joda-mapper" % "2.4.2"
  val playJson = "com.typesafe.play" %% "play-json" % "2.9.2"
  val playJsonJoda = "com.typesafe.play" %% "play-json-joda" % "2.9.2"
  val slick = "com.typesafe.slick" %% "slick" % "3.3.3"
  val slickCodegen = "com.typesafe.slick" %% "slick-codegen" % "3.3.3"
  val slickHikaricp = "com.typesafe.slick" %% "slick-hikaricp" % "3.3.3"
  val hikariCP = "com.zaxxer" % "HikariCP" % "5.0.1"
  val joda = "joda-time" % "joda-time" % "2.10.14"
  val jodaJackson = "com.fasterxml.jackson.datatype" % "jackson-datatype-joda" % "2.11.4"
  val postgresql = "org.postgresql" % "postgresql" % "42.3.5"
  val cats = "org.typelevel" %% "cats-core" % "2.7.0"
  val chimney = "io.scalaland" %% "chimney" % "0.6.1"
  val gcpCloudStorage = "com.google.cloud" % "google-cloud-storage" % "2.13.0"
  // Test
  val playAhcWS = "com.typesafe.play" %% "play-ahc-ws" % "2.8.15" % Test
  val scalatestPlus = "org.scalatestplus.play" %% "scalatestplus-play" % "5.1.0" % Test
  val akkaTestkit = "com.typesafe.akka" %% "akka-actor-testkit-typed" % akkaVersion % Test
  val sl4j = "org.slf4j" % "slf4j-api" % "1.7.35"
  val logstashLogbackEncoder = "net.logstash.logback" % "logstash-logback-encoder" % "6.5"
  val endpointBuilder = "de.innfactory" %% "smithy4play" % "0.3.2"
  val nimbusJwt = "com.nimbusds" % "nimbus-jose-jwt" % "9.15.2"
  val nimbusOIDC = "com.nimbusds" % "oauth2-oidc-sdk" % "9.43.1"

}
