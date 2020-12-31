package cn.tycoding.tumo.cloud.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 鉴权模块
 *
 * @author tycoding
 * @date 2020/7/12
 */
@EnableFeignClients
@SpringCloudApplication
public class TumoAuthApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoAuthApp.class, args);
    }
}
