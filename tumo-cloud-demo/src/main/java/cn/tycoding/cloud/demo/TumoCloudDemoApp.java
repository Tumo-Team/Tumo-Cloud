package cn.tycoding.cloud.demo;

import cn.tycoding.cloud.common.auth.annotation.EnableTumoResourceServer;
import cn.tycoding.cloud.common.feign.annotation.EnableTumoFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * Demo 测试模块
 *
 * @author tycoding
 * @since 2021/2/25
 */
@EnableTumoFeignClients
@SpringBootApplication
@EnableDiscoveryClient
@EnableTumoResourceServer
public class TumoCloudDemoApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudDemoApp.class, args);
    }
}
