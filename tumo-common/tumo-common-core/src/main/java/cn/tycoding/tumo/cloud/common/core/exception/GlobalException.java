package cn.tycoding.tumo.cloud.common.core.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * 全局异常处理
 *
 * @author tycoding
 * @date 2020/7/13
 */
public class GlobalException extends RuntimeException {

    @Getter
    @Setter
    private String msg;

    public GlobalException(String message) {
        super(message);
        this.msg = message;
    }
}
