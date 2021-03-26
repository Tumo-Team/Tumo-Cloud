package cn.tycoding.cloud.common.auth.feign;

import feign.RequestTemplate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.commons.security.AccessTokenContextRelay;
import org.springframework.cloud.openfeign.security.OAuth2FeignRequestInterceptor;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;

/**
 * @author tycoding
 * @since 2021/3/23
 */
@Slf4j
public class TumoFeignClientsInterceptor extends OAuth2FeignRequestInterceptor {

    private final OAuth2ClientContext oAuth2ClientContext;
    private final AccessTokenContextRelay accessTokenContextRelay;

    public TumoFeignClientsInterceptor(OAuth2ClientContext oAuth2ClientContext, OAuth2ProtectedResourceDetails resource,
                                       AccessTokenContextRelay accessTokenContextRelay) {
        super(oAuth2ClientContext, resource);
        this.oAuth2ClientContext = oAuth2ClientContext;
        this.accessTokenContextRelay = accessTokenContextRelay;
    }

    @Override
    public void apply(RequestTemplate template) {

        accessTokenContextRelay.copyToken();

        super.apply(template);
    }
}
