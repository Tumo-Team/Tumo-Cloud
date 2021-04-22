package cn.tycoding.cloud.demo.controller;

import cn.tycoding.cloud.demo.feign.RemoteUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试接口
 *
 * @author tycoding
 * @since 2021/3/2
 */
@RestController
@RequiredArgsConstructor
@Api(value = "测试接口", tags = "测试接口")
@RequestMapping("/demo")
public class DemoController {

    private final RemoteUserService remoteUserService;

    @GetMapping("/anon")
    @ApiOperation(value = "测试匿名接口")
    public String anon() {
        return "Hello, This is an anon interface! （by tumo-cloud-demo）";
    }

    @GetMapping("/auth")
    @ApiOperation(value = "测试授权接口")
    public String auth() {
        return "Hello, This is an interface that requires authorization to access！（by tumo-cloud-demo）";
    }

    @GetMapping("/feign")
    @ApiOperation(value = "测试Feign服务调用接口（授权）")
    public Object feign() {
        return remoteUserService.info("Tumo-Cloud");
    }
}
