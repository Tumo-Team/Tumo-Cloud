package cn.tycoding.cloud.auth.endpoint;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 匿名测试接口
 *
 * @author tycoding
 * @since 2021/3/2
 */
@RestController
public class AnonEndpoint {

    @GetMapping("/anon")
    public String anon() {
        return "Hello Tumo-Team ! （by anon）";
    }
}
