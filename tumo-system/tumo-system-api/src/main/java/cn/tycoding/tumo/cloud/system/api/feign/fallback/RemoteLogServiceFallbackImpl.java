package cn.tycoding.tumo.cloud.system.api.feign.fallback;

import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import cn.tycoding.tumo.cloud.system.api.feign.RemoteLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Slf4j
@Component
public class RemoteLogServiceFallbackImpl implements RemoteLogService {

    @Override
    public R saveLog(SysLog sysLog) {
        log.error("feign 日志插入失败...");
        return null;
    }
}
