package cn.tycoding.cloud.upms.api.feign;

import cn.tycoding.cloud.common.feign.constants.ServiceNameConstant;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.api.feign.fallback.RemoteLogServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


/**
 * Feign远程服务接口，对应UPMS模块接口
 *
 * @author tycoding
 * @since 2021/6/22
 */
@FeignClient(value = ServiceNameConstant.UPMS_SERVICE, fallback = RemoteLogServiceFallbackImpl.class)
public interface RemoteLogService {

    /**
     * 保存日志接口
     *
     * @param sysLog 日志信息
     * @return 操作结果
     */
    @PostMapping("/log")
    R saveLog(@RequestBody SysLog sysLog);
}
