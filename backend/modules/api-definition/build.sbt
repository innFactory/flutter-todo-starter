lazy val apiDefinition = (project in file("."))
  .enablePlugins(Smithy4sCodegenPlugin)
  .settings(
    name := "api-definition",
    scalaVersion := Dependencies.scalaVersion,
    version := releaseVersion,
    githubSettings,
    libraryDependencies += "com.disneystreaming.smithy4s" % "smithy4s-protocol" % "0.16.2"
  )
val releaseVersion = "0.0.1"
val githubSettings = Seq(
  githubOwner := "innFactory",
  githubRepository := "todo-api-definition",
  credentials :=
    Seq(
      Credentials(
        "GitHub Package Registry",
        "maven.pkg.github.com",
        "innfactory",
        sys.env.getOrElse("GITHUB_TOKEN", "")
      )
    )
)
