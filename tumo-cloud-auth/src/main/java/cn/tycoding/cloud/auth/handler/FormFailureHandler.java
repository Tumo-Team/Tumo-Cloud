package cn.tycoding.cloud.auth.handler;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpUtil;
import cn.tycoding.cloud.common.auth.utils.AuthUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义认证失败处理器
 *
 * @author tycoding
 * @since 2021/3/2
 */
@Slf4j
public class FormFailureHandler implements AuthenticationFailureHandler {

    /**
     * 登录认证失败时需要手动重新跳转到登录页面
     */
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        log.error("登录认证失败：{}", e.getMessage());
        String url = HttpUtil.encodeParams("/token/login?error=" + e.getMessage(), CharsetUtil.CHARSET_UTF_8);
        AuthUtil.getResponse().sendRedirect(url);
    }
}
