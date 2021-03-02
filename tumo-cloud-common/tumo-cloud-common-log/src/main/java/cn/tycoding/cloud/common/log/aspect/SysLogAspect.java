package cn.tycoding.cloud.common.log.aspect;

import cn.tycoding.cloud.common.log.event.SysLogEvent;
import cn.tycoding.cloud.common.log.utils.SpringContextHolder;
import cn.tycoding.cloud.common.log.utils.SysLogUtil;
import cn.tycoding.cloud.upms.api.entity.SysLog;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * 日志切面
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Slf4j
@Aspect
@Component
public class SysLogAspect {

    @Around("@annotation(apiLog)")
    public Object around(ProceedingJoinPoint point, cn.tycoding.cloud.common.log.annotation.ApiLog apiLog) throws JsonProcessingException {
        try {
            String className = point.getTarget().getClass().getName();
            String methodName = point.getSignature().getName();

            long beginTime = System.currentTimeMillis();
            Object result = point.proceed();
            long time = System.currentTimeMillis() - beginTime;

            String method = className + "." + methodName + "()";
            SysLog sysLog = SysLogUtil.build(1, apiLog.value(), method, time);

            SpringContextHolder.publishEvent(new SysLogEvent(sysLog));
            return result;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            return null;
        }
    }

}
