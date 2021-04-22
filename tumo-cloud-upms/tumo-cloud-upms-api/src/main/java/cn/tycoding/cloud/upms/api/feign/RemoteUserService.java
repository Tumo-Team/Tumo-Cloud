package cn.tycoding.cloud.upms.api.feign;

import cn.tycoding.cloud.common.core.constants.ServiceNameConstant;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.dto.UserInfo;
import cn.tycoding.cloud.upms.api.feign.fallback.RemoteUserServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@FeignClient(value = ServiceNameConstant.UPMS_SERVICE, fallback = RemoteUserServiceFallbackImpl.class)
public interface RemoteUserService {

    @GetMapping("/user/info/{username}")
    R<UserInfo> info(@PathVariable("username") String username);
}
