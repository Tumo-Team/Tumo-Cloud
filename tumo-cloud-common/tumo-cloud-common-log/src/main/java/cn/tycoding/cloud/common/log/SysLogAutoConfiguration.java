package cn.tycoding.cloud.common.log;

import cn.tycoding.cloud.common.log.aspect.ApiLogAspect;
import cn.tycoding.cloud.common.log.event.LogListener;
import cn.tycoding.cloud.common.log.props.LogProperties;
import cn.tycoding.cloud.upms.api.feign.RemoteLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 日志配置，自动注入
 *
 * @author tycoding
 * @since 2021/2/26
 */
@Configuration
@EnableFeignClients
@RequiredArgsConstructor
@EnableConfigurationProperties({LogProperties.class})
public class SysLogAutoConfiguration {

    private final RemoteLogService remoteLogService;

    @Bean
    public LogListener sysLogListener() {
        return new LogListener(remoteLogService);
    }

    @Bean
    public ApiLogAspect sysLogAspect() {
        return new ApiLogAspect();
    }

}
