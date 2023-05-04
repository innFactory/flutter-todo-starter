package io.todo.metadata.commons.implicits

trait Showable { this: Product =>

  override def toString: String = show

  def show: String = {
    val className = this.productPrefix
    val fieldNames = this.productElementNames.toList
    val fieldValues = this.productIterator.toList
    val fields = fieldNames.zip(fieldValues).map { case (name, value) => s"$name = $value" }
    fields.mkString(s"$className(", ", ", ")")
  }
}
