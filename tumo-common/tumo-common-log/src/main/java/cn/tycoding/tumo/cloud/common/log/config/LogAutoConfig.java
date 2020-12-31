package cn.tycoding.tumo.cloud.common.log.config;

import cn.tycoding.tumo.cloud.common.log.event.SysLogListener;
import cn.tycoding.tumo.cloud.common.log.aspect.SysLogAspect;
import cn.tycoding.tumo.cloud.system.api.feign.RemoteLogService;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@EnableAsync
@Configuration
@AllArgsConstructor
@ConditionalOnWebApplication
//@EnableFeignClients({"cn.tycoding.tumo.cloud.system.api.feign"})
@EnableFeignClients
public class LogAutoConfig {

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
