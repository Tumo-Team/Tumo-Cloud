package cn.tycoding.cloud.common.auth.dto;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * 扩展Security User对象
 *
 * @author tycoding
 * @since 2021/2/25
 */
public class TumoUser extends User {
    private static final long serialVersionUID = -1462618142392426177L;

    @Getter
    private final Long id;

    @Getter
    private final Long deptId;

    public TumoUser(Long id, Long deptId, String username, String password, boolean enabled,
                    boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked,
                    Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.id = id;
        this.deptId = deptId;
    }
}
