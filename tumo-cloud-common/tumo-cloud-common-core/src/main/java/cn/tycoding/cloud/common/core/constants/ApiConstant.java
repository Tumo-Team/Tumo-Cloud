package cn.tycoding.cloud.common.core.constants;

/**
 * API接口常量值
 *
 * @author tycoding
 * @since 2021/5/21
 */
public interface ApiConstant {

    /**
     * API接口前缀
     */
    String API_PREFIX = "/tumo-cloud";

    /**
     * API接口前缀 - Auth模块
     */
    String API_AUTH_PREFIX = API_PREFIX + "/auth";

    /**
     * 自定义OAuth Token端点地址
     */
    String API_OAUTH_TOKEN = API_AUTH_PREFIX + "/oauth/token";

    /**
     * API接口前缀 - Upms模块
     */
    String API_UPMS_PREFIX = API_PREFIX + "/upms";

    /**
     * API接口前缀 - Resource模块
     */
    String API_RESOURCE_PREFIX = API_PREFIX + "/resource";
}
