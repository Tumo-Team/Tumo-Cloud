package cn.tycoding.cloud.common.auth.config;

import cn.tycoding.cloud.common.auth.props.AuthProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

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
//    private final ResourceAuthExceptionEntryPoint resourceAuthExceptionEntryPoint;
//
//    @Override
//    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
//        resources.authenticationEntryPoint(resourceAuthExceptionEntryPoint);
//    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .httpBasic()

                .and()
                .authorizeRequests()
                .antMatchers(swagger_ignores)
                .permitAll()

                .antMatchers("/actuator/**")
                .permitAll();

        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http.authorizeRequests();
        authProperties.getSkipUrl().forEach(url -> registry.antMatchers(url).permitAll());
        registry.anyRequest().authenticated().and().csrf().disable();
    }
}
