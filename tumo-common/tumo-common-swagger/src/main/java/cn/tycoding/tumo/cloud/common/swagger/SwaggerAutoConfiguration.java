package cn.tycoding.tumo.cloud.common.swagger;

import cn.tycoding.tumo.cloud.common.swagger.properties.SwaggerProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
 * @author tycoding
 * @since 2020/12/25
 */
@Order
@Configuration
@EnableConfigurationProperties({SwaggerProperties.class})
public class SwaggerAutoConfiguration {

}
