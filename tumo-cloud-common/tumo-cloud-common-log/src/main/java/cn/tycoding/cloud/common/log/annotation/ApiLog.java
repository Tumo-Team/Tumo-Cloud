package cn.tycoding.cloud.common.log.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义日志切面注解
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ApiLog {

    String value() default "";
}
