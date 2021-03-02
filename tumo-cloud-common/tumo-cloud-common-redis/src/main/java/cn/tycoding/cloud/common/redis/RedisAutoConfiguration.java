package cn.tycoding.cloud.common.redis;

import cn.tycoding.cloud.common.redis.component.TumoRedisComponent;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * Redis配置
 *
 * @author tycoding
 * @since 2021/1/25
 */
@Configuration
@EnableCaching
@RequiredArgsConstructor
public class RedisAutoConfiguration {

    private final RedisConnectionFactory connectionFactory;

    @Bean(name = {"redisTemplate"})
    public RedisTemplate<String, Object> redisTemplate() {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
        redisTemplate.setConnectionFactory(connectionFactory);
        return redisTemplate;
    }

    @Bean
    public TumoRedisComponent tumoRedis(RedisTemplate<String, Object> redisTemplate) {
        return new TumoRedisComponent(redisTemplate);
    }
}
