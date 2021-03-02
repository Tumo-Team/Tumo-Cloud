package cn.tycoding.cloud.common.auth.service;

import cn.tycoding.cloud.common.auth.constant.AuthConstant;
import cn.tycoding.cloud.common.auth.dto.TumoUser;
import cn.tycoding.cloud.common.auth.exception.TumoOAuth2Exception;
import cn.tycoding.cloud.common.auth.utils.AuthUtil;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.upms.api.dto.UserInfo;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.feign.RemoteUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 构建用户认证信息
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private RemoteUserService userService;

    /**
     * 加载用户信息，在这里可做登录用户的权限、角色判断
     *
     * @param username 用户名
     * @return UserDetails对象
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        R<UserInfo> userInfo = userService.info(username);
        if (userInfo == null) {
            throw new RuntimeException("服务连接异常");
        }
        UserInfo data = userInfo.getData();
        return getUserDetails(data);
    }

    private UserDetails getUserDetails(UserInfo userInfo) {
        if (userInfo == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

        Set<String> authSet = new HashSet<>();

        List<SysRole> sysRoles = userInfo.getRoles();
        if (sysRoles == null || sysRoles.size() == 0) {
            throw new TumoOAuth2Exception(AuthUtil.NOT_ROLE_ERROR);
        }
        sysRoles.forEach(role -> authSet.add(AuthConstant.ROLE_PREFIX + role.getId() + AuthConstant.ROLE_SUFFIX + role.getAlias()));

        Set<String> permissions = userInfo.getPermissions();
        if (permissions != null && permissions.size() > 0) {
            authSet.addAll(permissions);
        }

        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(authSet.toArray(new String[0]));

        return new TumoUser(userInfo.getUser().getId(),
                userInfo.getDept() == null ? null : userInfo.getDept().getId(),
                userInfo.getUser().getUsername(),
                userInfo.getUser().getPassword(),
                true,
                true,
                true,
                true,
                authorities);
    }
}
