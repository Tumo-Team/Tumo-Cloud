package cn.tycoding.cloud.auth.endpoint;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.core.lang.Dict;
import cn.tycoding.cloud.common.auth.constant.CaptchaConstant;
import cn.tycoding.cloud.common.core.constants.CacheConstant;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.common.redis.component.TumoRedisComponent;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.Duration;
import java.util.UUID;

/**
 * 自定义Token端点
 *
 * @author tycoding
 * @since 2021/2/25
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/token")
public class AuthTokenEndpoint {

    private final TokenStore tokenStore;
    private final TumoRedisComponent tumoRedisComponent;

    /**
     * 自定义授权登录页面
     * SpringSecurity默认formLogin：
     * @see org.springframework.security.web.authentication.ui.DefaultLoginPageGeneratingFilter
     */
    @GetMapping("/login")
    public ModelAndView login(ModelAndView modelAndView, String error) {
        modelAndView.setViewName("login");
        modelAndView.addObject("error", error);
        return modelAndView;
    }

    /**
     * 获取验证码
     */
    @GetMapping("/captcha")
    @ApiOperation(value = "获取验证码")
    public R<Dict> getCaptcha() {
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(CaptchaConstant.CAPTCHA_WIDTH, CaptchaConstant.CAPTCHA_HEIGHT, CaptchaConstant.CAPTCHA_COUNT, CaptchaConstant.CAPTCHA_CIRCLE_COUNT);
        String code = captcha.getCode().toLowerCase();
        String key = UUID.randomUUID().toString();
        tumoRedisComponent.set(CacheConstant.CAPTCHA_REDIS_KEY + key, code, Duration.ofMinutes(CaptchaConstant.CAPTCHA_TIMEOUT));
        return R.data(Dict.create().set("key", key).set("image", captcha.getImageBase64()));
    }

    /**
     * 注销登录并清除Token
     */
    @DeleteMapping("/logout")
    @ApiOperation(value = "注销接口")
    public R<Boolean> logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
        if (StringUtils.isEmpty(authHeader)) {
            return R.ok();
        }
        OAuth2AccessToken accessToken = tokenStore.readAccessToken(authHeader);
        if (accessToken == null || StringUtils.isEmpty(accessToken.getValue())) {
            return R.ok();
        }
        // 清空access_token
        tokenStore.removeAccessToken(accessToken);
        // 清空refresh_token
        OAuth2RefreshToken refreshToken = accessToken.getRefreshToken();
        tokenStore.removeRefreshToken(refreshToken);
        return R.ok();
    }
}
