package cn.tycoding.cloud.upms.biz;

import cn.tycoding.cloud.common.auth.annotation.EnableTumoResourceServer;
import cn.tycoding.cloud.common.feign.annotation.EnableTumoFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * UPMS 用户、权限、角色体系模块
 *
 * @author tycoding
 * @since 2021/3/3
 */
@EnableTumoFeignClients
@SpringBootApplication
@EnableDiscoveryClient
@EnableTumoResourceServer
public class TumoCloudUpmsApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudUpmsApp.class, args);
    }
}
