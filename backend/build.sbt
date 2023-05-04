import com.typesafe.config.ConfigFactory
import com.typesafe.sbt.packager.docker.DockerPlugin.autoImport.dockerEntrypoint
import sbt.{Def, Resolver, _}

name :=
  """todo-api""".stripMargin
scalaVersion := Dependencies.scalaVersion

resolvers += Resolver.githubPackages("innFactory")

/* TaskKeys */
lazy val slickGen = taskKey[Seq[File]]("slickGen")
lazy val root = (project in file("."))
  .enablePlugins(PlayScala, DockerPlugin, AshScriptPlugin)
  .dependsOn(slick, api)
  .settings(
    scalaVersion := Dependencies.scalaVersion,
    dbConfSettings,
    libraryDependencies ++= Dependencies.list,
    // Adding Cache
    libraryDependencies ++= Seq(ehcache),
    dependencyOverrides += Dependencies.sl4j, // Override to avoid problems with HikariCP 4.x
    githubSettings
  )
  .settings(
    Seq(
      maintainer := "innFactory",
      version := buildVersion,
      Docker / packageName := "todo-api",
      dockerUpdateLatest := latest,
      dockerRepository := dockerRegistry,
      dockerExposedPorts := Seq(8080, 25520, 8558),
      dockerEntrypoint := Seq(""),
      dockerBaseImage := "amazoncorretto:11.0.18",
      dockerEntrypoint := Seq("/opt/docker/bin/todo-api", "-Dplay.server.pidfile.path=/dev/null"),
      Docker / daemonUserUid := None,
      Docker / daemonUser := "daemon"
    )
  )
lazy val flyway = (project in file("modules/flyway"))
  .enablePlugins(FlywayPlugin)
  .settings(
    scalaVersion := Dependencies.scalaVersion,
    libraryDependencies ++= Dependencies.list,
    flywaySettings,
    githubSettings
  )
lazy val slick = (project in file("modules/slick"))
  .settings(
    scalaVersion := Dependencies.scalaVersion,
    libraryDependencies ++= Dependencies.list,
    githubSettings
  )
lazy val api = (project in file("modules/api"))
  .enablePlugins(Smithy4sCodegenPlugin)
  .settings(
    scalaVersion := Dependencies.scalaVersion,
    libraryDependencies ++= Dependencies.list,
    githubSettings,
    Compile / smithy4sInputDir := (ThisBuild / baseDirectory).value / "modules" / "api-definition" / "src" / "main" / "resources" / "META-INF" / "smithy",
    Compile / smithy4sOutputDir := (ThisBuild / baseDirectory).value / "modules" / "api" / "src" / "main" / "scala"
  )
lazy val apiDefinition = project in file("modules/api-definition")
lazy val globalResources = file("conf")
val token = sys.env.getOrElse("GITHUB_TOKEN", "")
val githubSettings = Seq(
  githubOwner := "innFactory",
  githubRepository := "todo-api",
  credentials :=
    Seq(
      Credentials(
        "GitHub Package Registry",
        "maven.pkg.github.com",
        "innFactory",
        token
      )
    )
)

// Testing

coverageExcludedPackages += "<empty>;Reverse.*;router.*;models\\\\.data\\\\..*;dbdata.Tables*;io.todo.metadata.common.jwt.*;io.todo.metadata.common.errorHandling.*;io.todo.metadata.common.jwt.JwtFilter;db.codegen.*;io.todo.metadata.common.pubSub.*;"
Test / fork := true

// Commands

addCommandAlias("ciTests", "; clean; coverage; flyway/flywayMigrate; test; coverageReport")
addCommandAlias("localTests", "; clean; flyway/flywayMigrate; test")
val latest = sys.env.get("BRANCH") match {
  case Some(str) => if (str.equals("master")) true else false
  case None      => false
}
val buildVersion = sys.env.get("VERSION") match {
  case Some(str) => str
  case None      => version.key.toString()
}
val dockerRegistry = sys.env.get("DOCKER_REGISTRY") match {
  case Some(repo) => Some(repo)
  case None       => Some("localhost")
}
val generatedFilePath: String = "/dbdata/Tables.scala"
val flywayDbName: String = "todo-api"

slickGen := Def.taskDyn(generateTablesTask((Global / dbConf).value)).value

/*project definitions*/
val dbConf = settingKey[DbConf]("Typesafe config file with slick settings")
val generateTables = taskKey[Seq[File]]("Generate slick code")

def dbConfSettings =
  Seq(
    Global / dbConf := createDbConf((Compile / resourceDirectory).value / "application.conf")
  )

/* Create db config for flyway */
def createDbConf(dbConfFile: File): DbConf = {
  val configFactory = ConfigFactory.parseFile(dbConfFile)
  val configPath = s"$flywayDbName"
  val config = configFactory.getConfig(configPath).resolve
  val url = s"${config.getString("database.urlPrefix")}${config
      .getString("database.host")}:${config.getString("database.port")}/${config.getString("database.db")}"
  DbConf(
    config.getString("profile"),
    config.getString("database.driver"),
    config.getString("database.user"),
    config.getString("database.password"),
    url
  )
}

def flywaySettings =
  Seq(
    flywayUrl := (Global / dbConf).value.url,
    flywayUser := (Global / dbConf).value.user,
    flywayPassword := (Global / dbConf).value.password,
    flywaySchemas := (Seq("postgis"))
  )

def generateTablesTask(conf: DbConf) =
  Def.task {
    val dir = sourceManaged.value
    val outputDir = (dir / "main").getPath
    val fname = outputDir + generatedFilePath
    val generator = "db.codegen.CustomizedCodeGenerator"
    val url = conf.url
    val slickProfile = conf.profile.dropRight(1)
    val jdbcDriver = conf.driver
    val pkg = "db.Tables"
    val cp = (Compile / dependencyClasspath).value
    val username = conf.user
    val password = conf.password
    val s = streams.value
    val r = (Compile / runner).value
    r.run(
      generator,
      cp.files,
      Array(outputDir, slickProfile, jdbcDriver, url, pkg, username, password),
      s.log
    )
    Seq(file(fname))
  }

/* Scala format */
ThisBuild / scalafmtOnCompile := true // all projects

scalacOptions += "-Ymacro-annotations"

/* Change compiling */
Compile / sourceGenerators += Def.taskDyn(generateTablesTask((Global / dbConf).value)).taskValue
