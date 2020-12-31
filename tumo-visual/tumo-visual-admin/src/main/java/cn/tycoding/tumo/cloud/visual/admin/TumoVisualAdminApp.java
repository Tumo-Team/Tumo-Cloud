package cn.tycoding.tumo.cloud.visual.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * Spring Boot Admin 服务端
 *
 * @author tycoding
 * @date 2020/7/13
 */
@EnableAdminServer
@SpringCloudApplication
public class TumoVisualAdminApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoVisualAdminApp.class, args);
    }
}
