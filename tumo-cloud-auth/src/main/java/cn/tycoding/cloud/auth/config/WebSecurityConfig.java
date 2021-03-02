package cn.tycoding.cloud.auth.config;

import cn.tycoding.cloud.auth.handler.FormFailureHandler;
import cn.tycoding.cloud.common.auth.service.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

/**
 * SpringSecurity配置
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Order(90)
@Primary
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    @Bean
    @Override
    protected UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService());
    }

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new FormFailureHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin()
                .loginPage("/token/login")
                .loginProcessingUrl("/token/form")
                .failureHandler(authenticationFailureHandler())

                .and()
                .logout()
                .deleteCookies("JSESSIONID")

                .and()
                .authorizeRequests()

                .antMatchers("/anon")
                .permitAll()

                .antMatchers("/token/**")
                .permitAll()

                .anyRequest()
                .authenticated()

                .and()
                .csrf().disable();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**");
    }
}
