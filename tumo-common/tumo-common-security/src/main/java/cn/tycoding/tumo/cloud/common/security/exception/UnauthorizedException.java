package cn.tycoding.tumo.cloud.common.security.exception;

import cn.tycoding.tumo.cloud.common.core.constant.enums.ScstHttpStatus;
import cn.tycoding.tumo.cloud.common.security.component.ScstOAuth2ExceptionSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 身份认证异常
 *
 * @author tycoding
 * @date 2020/7/16
 * @see org.springframework.security.oauth2.provider.error.DefaultWebResponseExceptionTranslator
 */
@JsonSerialize(using = ScstOAuth2ExceptionSerializer.class)
public class UnauthorizedException extends ScstOAuth2Exception {

    public UnauthorizedException(String msg, Throwable t) {
        super(msg);
    }

    @Override
    public String getOAuth2ErrorCode() {
        return ScstHttpStatus.UNAUTHORIZED.getMsg();
    }

    @Override
    public int getHttpErrorCode() {
        return ScstHttpStatus.UNAUTHORIZED.getCode();
    }
}
