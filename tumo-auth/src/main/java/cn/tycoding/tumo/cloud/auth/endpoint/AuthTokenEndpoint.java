package cn.tycoding.tumo.cloud.auth.endpoint;

import cn.tycoding.tumo.cloud.common.core.constant.CommonConstants;
import cn.tycoding.tumo.cloud.common.core.constant.enums.ScstHttpStatus;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tycoding
 * @date 2020/7/12
 */
@Slf4j
@RestController
@RequestMapping("/token")
public class AuthTokenEndpoint {

    @Autowired
    private TokenStore tokenStore;

    @DeleteMapping("/logout")
    public R logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
        log.info("Logout >>>>>>>>>>>>>>>>>>>>>>>>>>>");
        if (StringUtils.isBlank(authHeader)) {
            return new R<>(ScstHttpStatus.TOKEN_INVALID);
        }
        String tokenValue =
                authHeader.replace(OAuth2AccessToken.BEARER_TYPE + CommonConstants.BLANK_STR, "").trim();
        OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(tokenValue);
        if (oAuth2AccessToken == null || StringUtils.isBlank(oAuth2AccessToken.getValue())) {
            return new R<>(ScstHttpStatus.TOKEN_INVALID);
        }
        tokenStore.removeAccessToken(oAuth2AccessToken);
        return new R<>();
    }
}
