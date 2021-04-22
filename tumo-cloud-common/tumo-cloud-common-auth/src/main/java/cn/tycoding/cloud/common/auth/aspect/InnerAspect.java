package cn.tycoding.cloud.common.auth.aspect;

import cn.tycoding.cloud.common.auth.annotation.Inner;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.Ordered;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * @author tycoding
 * @since 2021/4/21
 */
@Slf4j
@Aspect
@RequiredArgsConstructor
public class InnerAspect implements Ordered {

    private final HttpServletRequest request;

    @SneakyThrows
    @Around("@within(inner) || @annotation(inner)")
    public Object around(ProceedingJoinPoint point, Inner inner) {
        Enumeration<String> headerNames = request.getHeaderNames();
        log.info("headers:{}", headerNames);
        return point.proceed();
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 1;
    }
}
