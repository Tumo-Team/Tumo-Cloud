package cn.tycoding.cloud.common.swagger.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author tycoding
 * @since 2020/12/25
 */
@Data
@ConfigurationProperties("tumo-cloud.swagger")
public class SwaggerProperties {

    /**
     * 扫描的接口package地址
     */
    private String basePackage;

    /**
     * 文档标题
     */
    private String title;

    /**
     * 文档描述
     */
    private String description;

    /**
     * 作者
     */
    private String author;

    /**
     * URL
     */
    private String url;

    /**
     * Email
     */
    private String email;

    /**
     * 文档版本
     */
    private String version;
}
