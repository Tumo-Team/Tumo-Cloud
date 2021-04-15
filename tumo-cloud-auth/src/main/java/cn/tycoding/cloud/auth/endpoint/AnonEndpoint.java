package cn.tycoding.cloud.auth.endpoint;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 匿名测试接口
 *
 * @author tycoding
 * @since 2021/3/2
 */
@RestController
@Api(value = "匿名测试接口", tags = "匿名测试接口")
public class AnonEndpoint {

    @GetMapping("/anon")
    @ApiOperation(value = "测试接口")
    public String anon() {
        return "Hello Tumo-Team ! （by anon）";
    }
}
