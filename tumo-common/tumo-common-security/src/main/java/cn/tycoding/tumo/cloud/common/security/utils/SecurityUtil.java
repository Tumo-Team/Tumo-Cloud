package cn.tycoding.tumo.cloud.common.security.utils;

import cn.tycoding.tumo.cloud.common.security.service.ScstUser;
import lombok.experimental.UtilityClass;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@UtilityClass
public class SecurityUtil {

    /**
     * 获取Authentication对象
     *
     * @return
     */
    public Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * 获取用户名
     *
     * @return
     */
    public String getUsername() {
        Authentication authentication = getAuthentication();
        Object principal = authentication.getPrincipal();
        if (!(principal instanceof ScstUser)) {
            return (String) principal;
        }
        return null;
    }
}
