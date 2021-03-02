package cn.tycoding.cloud.upms.api.feign.fallback;

import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.api.feign.RemoteLogService;
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
