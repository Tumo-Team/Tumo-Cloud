package cn.tycoding.cloud.common.mybatis.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis Plus配置
 *
 * @author tycoding
 * @since 2021/2/26
 */
@Configuration(proxyBeanMethods = false)
public class MybatisPlusAutoConfig {

    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
