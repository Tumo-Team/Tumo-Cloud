package cn.tycoding.cloud.common.log;

import cn.tycoding.cloud.common.log.aspect.SysLogAspect;
import cn.tycoding.cloud.common.log.event.SysLogListener;
import cn.tycoding.cloud.upms.api.feign.RemoteLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 日志配置，自动注入
 *
 * @author tycoding
 * @since 2021/2/26
 */
@EnableAsync
@Configuration
@EnableFeignClients
@RequiredArgsConstructor
public class SysLogAutoConfiguration {

    private final RemoteLogService remoteLogService;

    @Bean
    public SysLogListener sysLogListener() {
        return new SysLogListener(remoteLogService);
    }

    @Bean
    public SysLogAspect sysLogAspect() {
        return new SysLogAspect();
    }

}
