package cn.tycoding.cloud.demo.feign;

import cn.tycoding.cloud.common.core.constants.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 测试Feign 远程调用
 *
 * @author tycoding
 * @since 2021/4/21
 */
@FeignClient(value = ServiceNameConstants.UPMS_SERVICE)
public interface RemoteUserService {

    /**
     * 调用`tumo-cloud-upms`服务的UserController
     */
    @GetMapping("/user/info/{username}")
    Object info(@PathVariable String username);
}
