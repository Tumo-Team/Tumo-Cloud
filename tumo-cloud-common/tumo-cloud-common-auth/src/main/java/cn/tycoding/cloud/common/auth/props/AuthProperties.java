package cn.tycoding.cloud.common.auth.props;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * 白名单配置
 *
 * @author tycoding
 * @since 2021/4/21
 */
@Data
@ConfigurationProperties("tumo-cloud.auth")
public class AuthProperties {

    /**
     * 接口白名单
     */
    private List<String> skipUrl = new ArrayList();

    /**
     * 是否开启演示环境
     */
    private Boolean isDemoEnv;
}
