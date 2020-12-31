package cn.tycoding.tumo.cloud.common.log.utils;

import cn.tycoding.tumo.cloud.common.log.annotation.Log;
import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public class SysLogUtil {

    /**
     * 记录AOP监听到执行方法的方法名和参数列表信息
     *
     * @param proceedingJoinPoint
     * @param log
     * @param objectMapper
     * @return
     * @throws JsonProcessingException
     */
    public static SysLog builderParams(ProceedingJoinPoint proceedingJoinPoint, SysLog log, ObjectMapper objectMapper) throws JsonProcessingException {
        MethodSignature signature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = signature.getMethod();
        Log annotation = method.getAnnotation(Log.class);
        if (annotation != null) {
            //注解上的描述
            log.setOperation(annotation.value());
        }
        //请求的类名
        String className = proceedingJoinPoint.getTarget().getClass().getName();
        //请求方法名
        String methodName = signature.getName();
        log.setMethod(className + "." + methodName + "()");
        //请求的方法参数
        Object[] args = proceedingJoinPoint.getArgs();
        //请求的方法参数名称
        LocalVariableTableParameterNameDiscoverer d = new LocalVariableTableParameterNameDiscoverer();
        String[] parameterNames = d.getParameterNames(method);
        if (args != null && parameterNames != null) {
            StringBuilder params = new StringBuilder();
            params = handleParams(params, args, Arrays.asList(parameterNames), objectMapper);
            log.setParams(params.toString());
        }
        return log;
    }

    private static StringBuilder handleParams(StringBuilder params, Object[] args, List<String> paramNames, ObjectMapper objectMapper) throws JsonProcessingException {
        for (int i = 0; i < args.length; i++) {
            if (args[i] instanceof Map) {
                Set set = ((Map) args[i]).keySet();
                List list = new ArrayList();
                List paramList = new ArrayList();
                for (Object key : set) {
                    list.add(((Map) args[i]).get(key));
                    paramList.add(key);
                }
                return handleParams(params, list.toArray(), paramList, objectMapper);
            } else {
                if (args[i] instanceof Serializable) {
                    Class<?> clazz = args[i].getClass();
                    try {
                        clazz.getDeclaredMethod("toString", new Class[]{null});
                        //如果不抛出NoSuchMethodException异常，则存在ToString方法
                        params.append(" ").append(paramNames.get(i)).append(objectMapper.writeValueAsString(args[i]));
                    } catch (NoSuchMethodException e) {
                        params.append(" ").append(paramNames.get(i)).append(objectMapper.writeValueAsString(args[i].toString()));
                    }
                } else if (args[i] instanceof MultipartFile) {
                    MultipartFile file = (MultipartFile) args[i];
                    params.append(" ").append(paramNames.get(i)).append(": ").append(file.getName());
                } else {
                    params.append(" ").append(paramNames.get(i)).append(": ").append(args[i]);
                }
            }
        }
        return params;
    }
}
