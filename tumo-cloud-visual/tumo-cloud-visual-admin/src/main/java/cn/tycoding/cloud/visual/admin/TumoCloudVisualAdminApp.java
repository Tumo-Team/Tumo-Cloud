package cn.tycoding.cloud.visual.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * Spring Boot Admin服务端
 *
 * @author tycoding
 * @since 2021/3/3
 */
@EnableAdminServer
@SpringBootApplication
@EnableDiscoveryClient
public class TumoCloudVisualAdminApp {

    public static void main(String[] args) {
        SpringApplication.run(TumoCloudVisualAdminApp.class, args);
    }
}
