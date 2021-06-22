package cn.tycoding.cloud.common.feign.config;

import cn.hutool.core.collection.CollUtil;
import cn.tycoding.cloud.common.feign.constants.FeignConstant;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Feign 请求过滤
 *
 * @author tycoding
 * @since 2021/4/22
 */
@Slf4j
@Configuration
public class FeignRequestInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate template) {
        HttpServletRequest httpServletRequest = getHttpServletRequest();
        if (httpServletRequest != null) {
            Map<String, String> headers = getHeaderMap(httpServletRequest);

            Collection<String> innerHeaders = template.headers().get(FeignConstant.INNER_KEY);
            if (CollUtil.isNotEmpty(innerHeaders) && innerHeaders.contains(FeignConstant.INNER)) {
                // Feign发起的服务间内部请求，内部无需授权
                headers.remove(HttpHeaders.AUTHORIZATION.toLowerCase());
                return;
            }
            headers.forEach(template::header);
        }
    }

    /**
     * 从当前线程中获取Request对象
     */
    private HttpServletRequest getHttpServletRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 自定义Feign远程接口传递的Header将写入到
     * 从RequestTemplate对象中获取自定义的Feign Header
     */
    private Map<String, String> getInnerHeaderMap(RequestTemplate template) {
        final Map<String, String> headerMap = new HashMap<>();
        Map<String, Collection<String>> headers = template.headers();
        headers.forEach((k, v) -> {
            if (v.iterator().hasNext()) {
                headerMap.put(k, v.iterator().next());
            }
        });
        return headerMap;
    }

    /**
     * 获取请求头Header所有参数
     */
    public Map<String, String> getHeaderMap(HttpServletRequest request) {
        final Map<String, String> headerMap = new HashMap<>();
        final Enumeration<String> names = request.getHeaderNames();
        String name;
        while (names.hasMoreElements()) {
            name = names.nextElement();
            headerMap.put(name, request.getHeader(name));
        }
        return headerMap;
    }
}
