package cn.tycoding.cloud.common.swagger;

import cn.tycoding.cloud.common.core.constants.ApiConstant;
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

    @Bean
    public Docket docket(SwaggerProperties swagger) {
        if (swagger.getBasePackages().size() == 0) {
            swagger.getBasePackages().add("cn.tycoding.cloud");
        }

        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo(swagger))
                .select()
                .apis(SwaggerUtil.basePackage(swagger.getBasePackages()))
                .paths(PathSelectors.any())
                .build()
                .securityContexts(securityContexts())
                .securitySchemes(securitySchemes())
                ;
    }

    private List<SecurityContext> securityContexts() {
        List<AuthorizationScope> scopes = new ArrayList<>();
        scopes.add(new AuthorizationScope("read", "read  resources"));
        scopes.add(new AuthorizationScope("write", "write resources"));
        scopes.add(new AuthorizationScope("reads", "read all resources"));
        scopes.add(new AuthorizationScope("writes", "write all resources"));

        SecurityReference securityReference = new SecurityReference("oauth2", scopes.toArray(new AuthorizationScope[]{}));
        SecurityContext securityContext = new SecurityContext(Lists.newArrayList(securityReference), PathSelectors.ant("/api/**"), null, null);
        return Lists.newArrayList(securityContext);
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
