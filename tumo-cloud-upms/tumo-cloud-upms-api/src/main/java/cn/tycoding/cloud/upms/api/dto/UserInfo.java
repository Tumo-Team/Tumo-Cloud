package cn.tycoding.cloud.upms.api.dto;

import cn.tycoding.cloud.upms.api.entity.SysDept;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * 封装用户基本信息、角色信息、部门信息、权限信息
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@Accessors(chain = true)
public class UserInfo implements Serializable {
    private static final long serialVersionUID = 547891924677981054L;

    /**
     * 用户基本信息
     */
    private SysUser user;

    /**
     * 用户所属部门
     */
    private SysDept dept;

    /**
     * 用户角色列表
     */
    private List<SysRole> roles;

    /**
     * 用户权限标识
     */
    private Set<String> permissions;
}
