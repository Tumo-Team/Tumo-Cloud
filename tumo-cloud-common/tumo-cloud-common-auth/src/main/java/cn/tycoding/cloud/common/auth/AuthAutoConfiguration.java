package cn.tycoding.cloud.common.auth;

import cn.tycoding.cloud.common.auth.props.AuthProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
 * Auth相关Yml配置
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Order
@Configuration
@EnableConfigurationProperties({AuthProperties.class})
public class AuthAutoConfiguration {

}
