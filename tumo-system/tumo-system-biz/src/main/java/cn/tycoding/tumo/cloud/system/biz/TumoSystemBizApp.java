package cn.tycoding.tumo.cloud.system.biz;

import cn.tycoding.tumo.cloud.common.security.annotation.EnableScstResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 系统权限管理模块
 *
 * @author tycoding
 * @date 2020/7/13
 */
@EnableScstResourceServer
@EnableFeignClients
@SpringCloudApplication
public class TumoSystemBizApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoSystemBizApp.class, args);
    }
}
