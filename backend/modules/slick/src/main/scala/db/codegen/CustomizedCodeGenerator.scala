package db.codegen
import de.innfactory.play.db.codegen.{
  Config,
  CustomizedCodeGeneratorBase,
  CustomizedCodeGeneratorConfig,
  XPostgresProfile
}

class CodeGenConfig() extends Config[XPostgresProfile] {
  override lazy val slickProfile: XPostgresProfile = XPostgresProfile
}

object CustomizedCodeGenerator
    extends CustomizedCodeGeneratorBase(
      CustomizedCodeGeneratorConfig(
        folder = "/target/scala-2.13/src_managed/main"
      ),
      new CodeGenConfig()
    ) {

  // Update here if new Tables are added
  // Each Database Table, which should be included in CodeGen
  // has to be added here in UPPER-CASE
  override def included: Seq[String] =
    Seq(
      "todo"
    ).map(_.toUpperCase)
}
