package cn.tycoding.tumo.cloud.common.security.annotation;

import cn.tycoding.tumo.cloud.common.security.config.ResourceServerConfig;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

import java.lang.annotation.*;

/**
 * 扩展资源服务器注解
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Documented
@Inherited
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
@Import({ResourceServerConfig.class})
public @interface EnableScstResourceServer {
}
