package cn.tycoding.tumo.cloud.common.log.aspect;

import cn.tycoding.tumo.cloud.common.log.event.SysLogEvent;
import cn.tycoding.tumo.cloud.common.log.utils.*;
import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 日志切面
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Slf4j
@Aspect
@Component
public class SysLogAspect {

    @Autowired
    private ObjectMapper objectMapper;

    @Pointcut("@annotation(cn.tycoding.tumo.cloud.common.log.annotation.Log)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object round(ProceedingJoinPoint proceedingJoinPoint) throws JsonProcessingException {
        log.info("this is round()...");
        try {
            long beginTime = System.currentTimeMillis();
            Object result = proceedingJoinPoint.proceed();
            HttpServletRequest httpServletRequest = HttpContextUtil.getHttpServletRequest();
            String ip = IPUtil.getIpAddr(httpServletRequest);
            long time = System.currentTimeMillis() - beginTime;
            SysLog log = new SysLog();
            //TODO
            log.setUsername("tycoding");
            log.setIp(ip);
            log.setTime(time);
            SysLogUtil.builderParams(proceedingJoinPoint, log, objectMapper);
            log.setCreateTime(new Date());
            log.setLocation(AddressUtil.getAddress(log.getIp()));
            SpringContextHolder.publishEvent(new SysLogEvent(log));
            return result;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            return null;
        }
    }
}
