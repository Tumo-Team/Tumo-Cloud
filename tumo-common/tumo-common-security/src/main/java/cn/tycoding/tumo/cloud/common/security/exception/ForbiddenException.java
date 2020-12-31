package cn.tycoding.tumo.cloud.common.security.exception;

import cn.tycoding.tumo.cloud.common.core.constant.enums.ScstHttpStatus;
import cn.tycoding.tumo.cloud.common.security.component.ScstOAuth2ExceptionSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * @author tycoding
 * @date 2020/7/16
 */
@JsonSerialize(using = ScstOAuth2ExceptionSerializer.class)
public class ForbiddenException extends ScstOAuth2Exception {

    public ForbiddenException(String msg, Throwable t) {
        super(msg);
    }

    @Override
    public String getOAuth2ErrorCode() {
        return ScstHttpStatus.FORBIDDEN.getMsg();
    }

    @Override
    public int getHttpErrorCode() {
        return ScstHttpStatus.FORBIDDEN.getCode();
    }
}
