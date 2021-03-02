package cn.tycoding.cloud.common.log.event;

import cn.tycoding.cloud.upms.api.entity.SysLog;
import org.springframework.context.ApplicationEvent;

/**
 * 日志事件
 *
 * @author tycoding
 * @since 2021/2/26
 */
public class SysLogEvent extends ApplicationEvent {

    public SysLogEvent(SysLog source) {
        super(source);
    }
}
