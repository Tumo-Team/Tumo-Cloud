package cn.tycoding.cloud.common.core.constants;

/**
 * 缓存常量
 *
 * @author tycoding
 * @since 2021/2/25
 */
public interface CacheConstant {

    /**
     * 系统所有Redis缓存Key前缀 prefix
     */
    String REDIS_KEY_PREFIX = "tumo-cloud:";

    /**
     * OAuth Redis Key
     */
    String OAUTH_REDIS_KEY = REDIS_KEY_PREFIX + "oauth:";

    /**
     * Captcha Redis Key
     */
    String CAPTCHA_REDIS_KEY = REDIS_KEY_PREFIX + "auth:captcha:";
}
