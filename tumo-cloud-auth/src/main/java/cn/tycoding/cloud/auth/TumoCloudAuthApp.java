package cn.tycoding.cloud.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 鉴权模块
 *
 * @author tycoding
 * @since 2021/2/25
 */
@EnableFeignClients
@SpringBootApplication
@EnableDiscoveryClient
public class TumoCloudAuthApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudAuthApp.class, args);
    }
}
