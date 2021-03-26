package cn.tycoding.cloud.auth;

import cn.tycoding.cloud.common.feign.annotation.EnableTumoFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 鉴权模块
 *
 * @author tycoding
 * @since 2021/2/25
 */
@EnableTumoFeignClients
@SpringBootApplication
@EnableDiscoveryClient
public class TumoCloudAuthApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudAuthApp.class, args);
    }
}
