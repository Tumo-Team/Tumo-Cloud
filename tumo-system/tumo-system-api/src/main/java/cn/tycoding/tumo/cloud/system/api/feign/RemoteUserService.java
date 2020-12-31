package cn.tycoding.tumo.cloud.system.api.feign;

import cn.tycoding.tumo.cloud.common.core.constant.ServiceNameConstants;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.system.api.dto.UserInfo;
import cn.tycoding.tumo.cloud.system.api.feign.fallback.RemoteUserServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@FeignClient(value = ServiceNameConstants.SYSTEM_SERVICE, fallback = RemoteUserServiceFallbackImpl.class)
public interface RemoteUserService {

    @GetMapping("/user/info/{username}")
    R<UserInfo> info(@PathVariable("username") String username);
}
