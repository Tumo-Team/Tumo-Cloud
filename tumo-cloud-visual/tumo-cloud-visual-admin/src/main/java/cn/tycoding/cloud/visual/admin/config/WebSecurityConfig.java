package cn.tycoding.cloud.visual.admin.config;

import de.codecentric.boot.admin.server.config.AdminServerProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 * SpringBoot Admin权限控制
 * 参考：https://github.com/codecentric/spring-boot-admin/blob/master/spring-boot-admin-samples/spring-boot-admin-sample-servlet/src/main/java/de/codecentric/boot/admin/SecuritySecureConfig.java
 *
 * @author tycoding
 * @date 2020/7/20
 */
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final String contextPath;

    public WebSecurityConfig(AdminServerProperties adminServerProperties) {
        contextPath = adminServerProperties.getContextPath();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        SavedRequestAwareAuthenticationSuccessHandler successHandler = new SavedRequestAwareAuthenticationSuccessHandler();
        successHandler.setTargetUrlParameter("redirectTo");
        successHandler.setDefaultTargetUrl(contextPath + "/");

        http
                .headers().frameOptions().disable()
                .and()
                .authorizeRequests()
                .antMatchers(contextPath + "/assets/**", contextPath + "/login", contextPath + "/actuator/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage(contextPath + "/login")
                .successHandler(successHandler)
                .and()
                .logout().logoutUrl(contextPath + "/logout")
                .and()
                .httpBasic()
                .and()
                .csrf().disable();
    }
}
