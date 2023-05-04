package io.todo.metadata.commons.implicits

object SequenceImplicits {

  implicit class EnhancedSequence[A, B](seq: Seq[Either[A, B]]) {
    def unfoldEither: Either[A, Seq[B]] =
      seq.foldRight(Right(Nil): Either[A, List[B]]) { (e, acc) =>
        for {
          xs <- acc
          x <- e
        } yield x :: xs
      }
  }

}
