package cn.tycoding.cloud.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 网关路由
 *
 * @author tycoding
 * @since 2021/2/27
 */
@SpringBootApplication
@EnableDiscoveryClient
public class TumoCloudGatewayApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudGatewayApp.class, args);
    }
}
