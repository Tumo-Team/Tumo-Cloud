package cn.tycoding.cloud.common.auth.annotation;

import cn.tycoding.cloud.common.auth.config.ResourceServerConfig;
import org.springframework.context.annotation.Import;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

import java.lang.annotation.*;

/**
 * 资源服务器注解
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Documented
@Inherited
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@EnableResourceServer
@Import({ResourceServerConfig.class})
public @interface EnableTumoResourceServer {
}
