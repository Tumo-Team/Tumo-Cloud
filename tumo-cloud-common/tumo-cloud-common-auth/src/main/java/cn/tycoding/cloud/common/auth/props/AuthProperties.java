package cn.tycoding.cloud.common.auth.props;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * Auth相关Yml配置
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Data
@ConfigurationProperties("tumo-cloud.auth")
public class AuthProperties {

    private List<String> skipUrl = new ArrayList();
}
