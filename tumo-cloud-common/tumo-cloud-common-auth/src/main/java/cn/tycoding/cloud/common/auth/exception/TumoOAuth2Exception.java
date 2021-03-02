package cn.tycoding.cloud.common.auth.exception;

import cn.tycoding.cloud.common.auth.component.TumoOAuth2ExceptionSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;

/**
 * 自定义OAuth2异常类
 *
 * @author tycoding
 * @since 2021/2/25
 */
@JsonSerialize(using = TumoOAuth2ExceptionSerializer.class)
public class TumoOAuth2Exception extends OAuth2Exception {

    @Getter
    private int code;

    public TumoOAuth2Exception(String msg, int code) {
        super(msg);
        this.code = code;
    }

    public TumoOAuth2Exception(String msg) {
        super(msg);
    }
}
