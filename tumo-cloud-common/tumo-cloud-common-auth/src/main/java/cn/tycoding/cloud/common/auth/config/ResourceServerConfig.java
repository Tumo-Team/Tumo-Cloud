package cn.tycoding.cloud.common.auth.config;

import cn.tycoding.cloud.common.auth.component.ResourceAuthExceptionEntryPoint;
import cn.tycoding.cloud.common.auth.props.AuthProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;

/**
 * 资源服务器配置
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Slf4j
@RequiredArgsConstructor
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {
    private final String[] swagger_ignores = new String[]{"/swagger-ui.html", "/doc.html/**", "/swagger-ui/**", "/swagger-resources/**", "/v2/api-docs", "/v3/api-docs", "/webjars/**"};

    private final AuthProperties authProperties;
    private final ResourceAuthExceptionEntryPoint resourceAuthExceptionEntryPoint;

//    /**
//     * 同授权服务器 {@link cn.tycoding.cloud.auth.config.AuthorizationServerConfig.tokenStore()} 配置相同
//     * 资源服务器也需要手动注入TokenStore，否则会从InMemoryTokenStore中获取Token
//     * <p>
//     * 查看：
//     * {@link org.springframework.security.oauth2.provider.token.DefaultTokenServices#loadAuthentication(String)}
//     * 若从默认InMemoryTokenStore中获取Token，造成accessToken为null
//     */
//    @Bean
//    public TokenStore tokenStore() {
//        RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
//        tokenStore.setPrefix(CacheConstant.OAUTH_PREFIX);
//        return tokenStore;
//    }

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources.authenticationEntryPoint(resourceAuthExceptionEntryPoint);
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers(HttpMethod.GET, swagger_ignores)
                .permitAll()

                .antMatchers(authProperties.getSkipUrl().toArray(new String[0]))
                .permitAll()

                .anyRequest()
                .authenticated()

                .and()
                .csrf().disable();
    }
}
