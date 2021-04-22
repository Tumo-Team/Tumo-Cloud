package cn.tycoding.cloud.upms.api.feign;

import cn.tycoding.cloud.common.core.constants.ServiceNameConstant;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.api.feign.fallback.RemoteLogServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


/**
 * Feign系统日志远程调用接口
 *
 * @author tycoding
 * @date 2020/7/13
 */
@FeignClient(value = ServiceNameConstant.UPMS_SERVICE, fallback = RemoteLogServiceFallbackImpl.class)
public interface RemoteLogService {

    @PostMapping("/log")
    R saveLog(@RequestBody SysLog sysLog);
}
