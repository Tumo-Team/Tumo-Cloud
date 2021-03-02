package cn.tycoding.cloud.common.redis.component;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

/**
 * @author tycoding
 * @since 2021/1/25
 */
public class TumoRedisComponent {

    private final RedisTemplate<String, Object> redisTemplate;
    private final ValueOperations<String, Object> valueOps;

    public TumoRedisComponent(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
        this.valueOps = redisTemplate.opsForValue();
    }

    public void set(String key, Object value) {
        this.valueOps.set(key, value);
    }

    public void set(String key, Object value, Duration timeout) {
        this.valueOps.set(key, value, timeout);
    }

    public void set(String key, Object value, Long seconds) {
        this.valueOps.set(key, value, seconds, TimeUnit.SECONDS);
    }

    public Object get(String key) {
        return this.valueOps.get(key);
    }

}
