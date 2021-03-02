package cn.tycoding.cloud.common.auth.component;

import cn.tycoding.cloud.common.auth.exception.TumoOAuth2Exception;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

import java.io.IOException;

/**
 * 格式化OAuth2异常类
 *
 * @author tycoding
 * @see org.springframework.security.oauth2.common.exceptions.OAuth2ExceptionJackson2Serializer
 * @since 2021/2/25
 */
public class TumoOAuth2ExceptionSerializer extends StdSerializer<TumoOAuth2Exception> {

    protected TumoOAuth2ExceptionSerializer() {
        super(TumoOAuth2Exception.class);
    }

    @Override
    public void serialize(TumoOAuth2Exception e, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeNumberField("code", e.getCode());
        jsonGenerator.writeStringField("msg", e.getMessage());
        jsonGenerator.writeStringField("data", null);
        jsonGenerator.writeEndObject();
    }
}
