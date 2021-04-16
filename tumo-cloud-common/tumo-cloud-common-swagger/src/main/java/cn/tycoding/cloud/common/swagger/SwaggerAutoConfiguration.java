package cn.tycoding.cloud.common.swagger;

import cn.tycoding.cloud.common.core.constants.ApiConstant;
import cn.tycoding.cloud.common.core.constants.ApiPrefixConstant;
import cn.tycoding.cloud.common.swagger.properties.SwaggerProperties;
import cn.tycoding.cloud.common.swagger.utils.SwaggerUtil;
import com.google.common.collect.Lists;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.OAuthBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @since 2020/12/25
 */
@Order
@Configuration
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
                .securityContexts(securityContexts(swagger))
                .securitySchemes(securitySchemes());
    }

    private List<SecurityContext> securityContexts(SwaggerProperties swagger) {
        List<AuthorizationScope> scopes = new ArrayList<>();
        swagger.getAuthorizationScopeList().forEach(s -> {
            scopes.add(new AuthorizationScope(s.getScope(), s.getDescription()));
        });

        SecurityReference securityReference = new SecurityReference("oauth2", scopes.toArray(new AuthorizationScope[]{}));
        return Lists.newArrayList(SecurityContext
                .builder()
                .securityReferences(Lists.newArrayList(securityReference))
                .build());
    }

    private ArrayList<SecurityScheme> securitySchemes() {
        List<GrantType> grantTypes = new ArrayList<>();
        ResourceOwnerPasswordCredentialsGrant resourceOwnerPasswordCredentialsGrant = new ResourceOwnerPasswordCredentialsGrant(ApiConstant.API_OAUTH_TOKEN);
        grantTypes.add(resourceOwnerPasswordCredentialsGrant);
        OAuth oAuth = new OAuthBuilder().name("oauth2").grantTypes(grantTypes).build();
        return Lists.newArrayList(oAuth);
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
