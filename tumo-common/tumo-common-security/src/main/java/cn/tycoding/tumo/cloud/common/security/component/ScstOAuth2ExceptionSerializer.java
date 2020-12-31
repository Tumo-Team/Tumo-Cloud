package cn.tycoding.tumo.cloud.common.security.component;

import cn.tycoding.tumo.cloud.common.security.exception.ScstOAuth2Exception;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

import java.io.IOException;

/**
 * 格式化异常类
 *
 * @author tycoding
 * @date 2020/7/16
 */
public class ScstOAuth2ExceptionSerializer extends StdSerializer<ScstOAuth2Exception> {

    protected ScstOAuth2ExceptionSerializer() {
        super(ScstOAuth2Exception.class);
    }

    @Override
    public void serialize(ScstOAuth2Exception e, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeStringField("msg", e.getMessage());
        jsonGenerator.writeStringField("data", null);
        jsonGenerator.writeStringField("code", String.valueOf(e.getCode()));
        jsonGenerator.writeEndObject();
    }
}
