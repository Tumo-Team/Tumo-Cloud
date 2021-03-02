package cn.tycoding.cloud.common.log.event;

import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.api.feign.RemoteLogService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * 日志事件监听器
 *
 * @author tycoding
 * @since 2021/2/26
 */
@Slf4j
@AllArgsConstructor
public class SysLogListener {

    private final RemoteLogService remoteLogService;

    @Async
    @Order
    @EventListener(SysLogEvent.class)
    public void saveSysLog(SysLogEvent event) {
        SysLog sysLog = (SysLog) event.getSource();
        remoteLogService.saveLog(sysLog);
    }

}
