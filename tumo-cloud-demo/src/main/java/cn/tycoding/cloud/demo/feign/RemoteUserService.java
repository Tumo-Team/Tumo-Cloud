package cn.tycoding.cloud.demo.feign;

import cn.tycoding.cloud.common.core.constants.FeignConstant;
import cn.tycoding.cloud.common.core.constants.ServiceNameConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * 测试Feign 远程调用
 *
 * @author tycoding
 * @since 2021/4/21
 */
@FeignClient(value = ServiceNameConstant.UPMS_SERVICE)
public interface RemoteUserService {

    /**
     * 调用`tumo-cloud-upms`服务的UserController
     * header:
     */
    @GetMapping("/user/info/{username}")
    Object info(@RequestHeader(FeignConstant.INNER_KEY) String innerKey, @PathVariable String username);
}
