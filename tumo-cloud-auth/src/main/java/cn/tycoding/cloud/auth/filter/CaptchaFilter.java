package cn.tycoding.cloud.auth.filter;

import cn.tycoding.cloud.common.auth.utils.AuthUtil;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.common.core.constants.CacheConstant;
import cn.tycoding.cloud.common.core.utils.ServletUtil;
import cn.tycoding.cloud.common.redis.component.TumoRedisComponent;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 验证码过滤器
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Component
@RequiredArgsConstructor
public class CaptchaFilter extends OncePerRequestFilter {
    private static final String API_OAUTH_TOKEN = "/oauth/token";

    private final TumoRedisComponent tumoRedisComponent;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        if (API_OAUTH_TOKEN.equals(request.getRequestURI())) {
            String headerKey = request.getHeader(AuthUtil.CAPTCHA_HEADER_KEY);
            String code = ServletRequestUtils.getStringParameter(request, AuthUtil.CAPTCHA_FORM_KEY);
            String redisCode = (String) tumoRedisComponent.get(CacheConstant.CAPTCHA_REDIS_KEY + headerKey);
            if (code == null || !code.toLowerCase().equals(redisCode)) {
                ServletUtil.write(response, new R<>(400, AuthUtil.CAPTCHA_ERROR_INFO));
                return;
            }
        }
        chain.doFilter(request, response);
    }
}
