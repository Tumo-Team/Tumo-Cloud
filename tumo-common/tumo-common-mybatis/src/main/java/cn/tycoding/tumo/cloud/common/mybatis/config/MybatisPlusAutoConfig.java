package cn.tycoding.tumo.cloud.common.mybatis.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis Plus 配置
 *
 * @author tycoding
 * @since 2020/12/26
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
