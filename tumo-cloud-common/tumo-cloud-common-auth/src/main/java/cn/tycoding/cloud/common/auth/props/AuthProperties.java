package cn.tycoding.cloud.common.auth.props;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 白名单配置
 *
 * @author tycoding
 * @since 2021/4/21
 */
@Slf4j
@RefreshScope
@Configuration(proxyBeanMethods = false)
@ConfigurationProperties("tumo-cloud.auth")
public class AuthProperties implements InitializingBean, ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Getter
    @Setter
    private List<String> skipUrl = new ArrayList();

    /**
     * 动态设置鉴权白名单
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        log.info("经过AuthProperties...");
        skipUrl.add("/user/info/**");
        log.info("skipUrl: {}", skipUrl);
    }

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        this.applicationContext = context;
    }
}
