package cn.tycoding.tumo.cloud.common.log.event;

import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import org.springframework.context.ApplicationEvent;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public class SysLogEvent extends ApplicationEvent {

    public SysLogEvent(SysLog source) {
        super(source);
    }
}
