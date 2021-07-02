package cn.tycoding.cloud.common.swagger;

import cn.tycoding.cloud.common.core.constants.ApiConstant;
import cn.tycoding.cloud.common.swagger.properties.SwaggerProperties;
import cn.tycoding.cloud.common.swagger.utils.SwaggerUtil;
import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.OAuthBuilder;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Swagger 配置注入
 *
 * @author tycoding
 * @since 2021/6/22
 */
@Configuration
@EnableKnife4j
@EnableConfigurationProperties({SwaggerProperties.class})
public class SwaggerAutoConfiguration {
    private final static String BASE_PACKAGE = "cn.tycoding.cloud";

    @Bean
    public Docket docket(SwaggerProperties swagger) {
        if (swagger.getBasePackages().size() == 0) {
            swagger.getBasePackages().add(BASE_PACKAGE);
        }

        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo(swagger))
                .select()
                .apis(SwaggerUtil.basePackage(swagger.getBasePackages()))
                .build()
                .securityContexts(Collections.singletonList(securityContexts(swagger)))
                .securitySchemes(Collections.singletonList(securitySchemes()));
    }

    private SecurityContext securityContexts(SwaggerProperties swagger) {
        List<AuthorizationScope> scopes = new ArrayList<>();
        swagger.getAuthorizationScopeList().forEach(s -> {
            scopes.add(new AuthorizationScope(s.getScope(), s.getDescription()));
        });

        SecurityReference securityReference = new SecurityReference("oauth2", scopes.toArray(new AuthorizationScope[]{}));
        return SecurityContext.builder().securityReferences(Collections.singletonList(securityReference)).build();
    }

    private OAuth securitySchemes() {
        List<GrantType> grantTypes = new ArrayList<>();
        ResourceOwnerPasswordCredentialsGrant resourceOwnerPasswordCredentialsGrant = new ResourceOwnerPasswordCredentialsGrant(ApiConstant.API_OAUTH_TOKEN);
        grantTypes.add(resourceOwnerPasswordCredentialsGrant);
        return new OAuthBuilder().name("oauth2").grantTypes(grantTypes).build();
    }

    private ApiInfo apiInfo(SwaggerProperties swagger) {
        return new ApiInfoBuilder()
                .title(swagger.getTitle())
                .description(swagger.getDescription())
                .termsOfServiceUrl(swagger.getUrl())
                .contact(new Contact(swagger.getAuthor(), swagger.getUrl(), swagger.getEmail()))
                .version(swagger.getVersion())
                .build();
    }
}
