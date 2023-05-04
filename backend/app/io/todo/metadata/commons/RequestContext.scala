package io.todo.metadata.commons

import de.innfactory.play.smithy4play.HttpHeaders
import de.innfactory.play.tracing.TraceContext
import io.opentelemetry.api.trace.Span

trait ApplicationTraceContext extends TraceContext {}

class RequestContext(
    rhttpHeaders: HttpHeaders
) extends ApplicationTraceContext {

  override def httpHeaders: HttpHeaders = rhttpHeaders
  override def span: Option[Span] = None
}

object RequestContext {

  def empty = new RequestContext(HttpHeaders(Map.empty))
  def debug = new RequestContext(HttpHeaders(Map("x-app-debug" -> Seq("true"))))
}
