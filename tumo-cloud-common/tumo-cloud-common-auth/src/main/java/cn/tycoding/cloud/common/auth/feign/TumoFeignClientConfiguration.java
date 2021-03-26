package cn.tycoding.cloud.common.auth.feign;

import feign.RequestInterceptor;
import org.springframework.cloud.commons.security.AccessTokenContextRelay;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;

/**
 * @author tycoding
 * @since 2021/3/24
 */
@Configuration
public class TumoFeignClientConfiguration {

    @Bean
    public RequestInterceptor requestInterceptor(OAuth2ClientContext oAuth2ClientContext, OAuth2ProtectedResourceDetails resource,
                                                 AccessTokenContextRelay accessTokenContextRelay) {
        return new TumoFeignClientsInterceptor(oAuth2ClientContext, resource, accessTokenContextRelay);
    }
}
