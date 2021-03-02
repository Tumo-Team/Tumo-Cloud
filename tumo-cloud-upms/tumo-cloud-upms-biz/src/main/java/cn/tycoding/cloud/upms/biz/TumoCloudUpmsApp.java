package cn.tycoding.cloud.upms.biz;

import cn.tycoding.cloud.common.auth.annotation.EnableTumoResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 系统权限管理模块
 *
 * @author tycoding
 * @date 2020/7/13
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
