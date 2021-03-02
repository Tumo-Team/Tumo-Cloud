package cn.tycoding.cloud.upms.api.feign.fallback;

import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.dto.UserInfo;
import cn.tycoding.cloud.upms.api.feign.RemoteUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Slf4j
@Service
public class RemoteUserServiceFallbackImpl implements RemoteUserService {

    @Override
    public R<UserInfo> info(String username) {
        log.error("查询用户信息失败 >>>>>>>>>>> username = {}", username);
        return null;
    }
}
