package cn.tycoding.tumo.cloud.common.core.constant.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author tycoding
 * @date 2020/7/16
 */
@Getter
@AllArgsConstructor
public enum ScstHttpStatus {

    UNAUTHORIZED(401, "unauthorized"),
    FORBIDDEN(403, "access_denied"),
    INVALID(426, "invalid_exception"),
    METHOD_NOT_ALLOWED(405, "method_not_allowed"),
    INTERNAL_SERVER_ERROR(500, "Internal Server Error"),
    TOKEN_INVALID(403, "Token无效");

    private final int code;
    private final String msg;
}
