package cn.tycoding.tumo.cloud.system.api.dto;

import cn.tycoding.tumo.cloud.system.api.entity.SysDept;
import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import cn.tycoding.tumo.cloud.system.api.entity.SysUser;
import lombok.Data;
import lombok.experimental.Accessors;

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
public class UserInfo {

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
