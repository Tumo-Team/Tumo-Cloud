package cn.tycoding.tumo.cloud.common.security.service;

import cn.tycoding.tumo.cloud.common.core.constant.AuthConstants;
import cn.tycoding.tumo.cloud.common.core.constant.CommonConstants;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.system.api.dto.UserInfo;
import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import cn.tycoding.tumo.cloud.system.api.feign.RemoteUserService;
import lombok.extern.slf4j.Slf4j;
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
 * @author tycoding
 * @date 2020/7/13
 */
@Slf4j
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private RemoteUserService remoteUserService;

    /**
     * 加载用户信息，在这里可做登录用户的权限、角色判断
     *
     * @param username
     * @return UserDetails对象
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("loadUserByUsername >>>>>>>>>>>>> username: {}", username);
        R<UserInfo> info = remoteUserService.info(username);
        log.info("loadUserByUsername success >>>>>>>>>>>>>> info: {}", info);
        return getUserDetails(info);
    }

    private UserDetails getUserDetails(R<UserInfo> info) {
        if (info == null || info.getData() == null || info.getData().getUser() == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

        UserInfo userInfo = info.getData();
        Set<String> authSet = new HashSet<>();

        List<SysRole> roles = userInfo.getRoles();
        if (roles != null && roles.size() > 0) {
            roles.forEach(role -> authSet.add(AuthConstants.ROLE_PREFIX + role));
        }
//        Set<String> permissions = userInfo.getPermissions();
//        if (permissions != null && permissions.size() > 0) {
//            authSet.addAll(permissions);
//        }
//        String perms = permissions.stream().map(String::trim).collect(Collectors.joining(","));

        List<GrantedAuthority> authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(authSet.toString());

        return new ScstUser(userInfo.getUser().getId(),
                userInfo.getUser().getUsername(),
                userInfo.getUser().getPassword(),
                true,
                true,
                true,
                true,
                authorities);
    }
}
