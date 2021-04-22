package cn.tycoding.cloud.common.auth.annotation;

import java.lang.annotation.*;

/**
 * 服务间Feign调用不鉴权实现
 *
 * @author tycoding
 * @since 2021/4/21
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Inner {

}
