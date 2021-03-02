package cn.tycoding.cloud.visual.admin;

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
public class TumoCloudVisualAdminApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudVisualAdminApp.class, args);
    }
}
