package cn.tycoding.tumo.cloud.common.security.exception;

import cn.tycoding.tumo.cloud.common.security.component.ScstOAuth2ExceptionSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;

/**
 * 重写OAuth2异常类
 *
 * @author tycoding
 * @date 2020/7/16
 */
@JsonSerialize(using = ScstOAuth2ExceptionSerializer.class)
public class ScstOAuth2Exception extends OAuth2Exception {

    @Getter
    private int code;

    public ScstOAuth2Exception(String msg, String code) {
        super(msg);
        this.code = super.getHttpErrorCode();
    }

    public ScstOAuth2Exception(String msg) {
        super(msg);
    }
}
