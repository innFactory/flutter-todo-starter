package io.todo.metadata.commons.jackson

import com.fasterxml.jackson.core.Version
import com.fasterxml.jackson.databind.module.SimpleModule
import io.todo.metadata.commons.jackson.playjson.{JsValueDeserializer, JsValueSerializer}
import play.api.libs.json.JsValue

class JsValueDeSerializerModule() extends SimpleModule("JsValueDeSerializerModule", Version.unknownVersion()) {

  // first deserializers
  addDeserializer(classOf[JsValue], new JsValueDeserializer)
  addSerializer(classOf[JsValue], new JsValueSerializer)

}
