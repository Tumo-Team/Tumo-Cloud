package cn.tycoding.cloud.gateway.filter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @author tycoding
 * @since 2021/4/16
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class AuthFilter implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("path：{}", exchange.getRequest().getURI().getPath());
        log.info("token：{}", exchange.getRequest().getHeaders().getFirst("Authorization"));
        // 校验Token
        // 查询Redis 验证Token是否失效
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
