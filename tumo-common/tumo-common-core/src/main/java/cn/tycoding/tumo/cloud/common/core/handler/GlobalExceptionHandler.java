package cn.tycoding.tumo.cloud.common.core.handler;

import cn.tycoding.tumo.cloud.common.core.exception.GlobalException;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

/**
 * 全局异常处理器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Slf4j
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public R exception(Exception e) {
        log.error("全局异常：>> {}", e.getMessage(), e);
        return new R(e);
    }

    @ExceptionHandler(value = GlobalException.class)
    public R globalException(GlobalException e, HttpServletResponse response) {
        log.error("运行时异常：>> {}", e.getMsg(), e);
        return new R<>(response.getStatus(), e.getMsg());
    }
}
