package cn.tycoding.cloud.upms.api.feign;

import cn.tycoding.cloud.common.feign.constants.ServiceNameConstant;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.dto.UserInfo;
import cn.tycoding.cloud.upms.api.feign.fallback.RemoteUserServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * Feign远程服务接口，对应UPMS模块接口
 *
 * @author tycoding
 * @since 2021/6/22
 */
@FeignClient(value = ServiceNameConstant.UPMS_SERVICE, fallback = RemoteUserServiceFallbackImpl.class)
public interface RemoteUserService {

    /**
     * 加载当前账户信息
     *
     * @param username 用户名
     * @return 用户、角色、部门、权限
     */
    @GetMapping("/user/info/{username}")
    R<UserInfo> info(@PathVariable("username") String username);
}
