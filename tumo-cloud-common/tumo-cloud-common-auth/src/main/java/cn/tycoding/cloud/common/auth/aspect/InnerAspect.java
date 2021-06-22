package cn.tycoding.cloud.common.auth.aspect;

import cn.tycoding.cloud.common.auth.annotation.Inner;
import cn.tycoding.cloud.common.feign.constants.FeignConstant;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.security.access.AccessDeniedException;

import javax.servlet.http.HttpServletRequest;

/**
 * Inner主键
 *
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
        // 如果@Inner注解在类上使用，则认为该类下所有方法都使用
        if (inner == null) {
            Class<?> clazz = point.getTarget().getClass();
            inner = AnnotationUtils.findAnnotation(clazz, Inner.class);
        }

        String header = request.getHeader(FeignConstant.INNER_KEY);
        if (!FeignConstant.INNER.equals(header)) {
            // 不是Feign发起的内部服务接口调用，拦截
            log.error("外部访问接口，没有权限，URL：{}", request.getRequestURI());
            throw new AccessDeniedException("没有权限");
        }
        log.info("Feign内部服务间接口调用，不鉴权，URL：{}", request.getRequestURI());
        return point.proceed();
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE + 1;
    }
}
