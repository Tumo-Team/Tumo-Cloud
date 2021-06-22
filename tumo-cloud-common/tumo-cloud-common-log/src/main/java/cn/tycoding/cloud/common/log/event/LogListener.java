package cn.tycoding.cloud.common.log.event;

import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.api.feign.RemoteLogService;
import lombok.AllArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * 监听自定义Log 事件
 *
 * @author tycoding
 * @since 2021/5/21
 */
@AllArgsConstructor
public class LogListener {

    private final RemoteLogService remoteLogService;

    @Async
    @Order
    @EventListener(LogEvent.class)
    public void saveSysLog(LogEvent event) {
        SysLog sysLog = (SysLog) event.getSource();
        remoteLogService.saveLog(sysLog);
    }

}
