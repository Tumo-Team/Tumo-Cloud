package cn.tycoding.tumo.cloud.common.security.service;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * 封装UserDetails扩展的User信息
 *
 * @author tycoding
 * @date 2020/7/13
 */
public class ScstUser extends User {

    @Getter
    private Long id;

    public ScstUser(Long id, String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.id = id;
    }
}
