package cn.tycoding.cloud.upms.biz;

import cn.tycoding.cloud.common.auth.annotation.EnableTumoResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * UPMS 用户、权限、角色体系模块
 *
 * @author tycoding
 * @since 2021/3/3
 */
@EnableFeignClients
@SpringBootApplication
@EnableDiscoveryClient
@EnableTumoResourceServer
public class TumoCloudUpmsApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudUpmsApp.class, args);
    }
}
