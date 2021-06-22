package cn.tycoding.cloud.upms.api.dto;

import cn.tycoding.cloud.upms.api.entity.SysDept;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * 自定义Oauth2 授权成功后存储的用户数据
 *
 * @author tycoding
 * @since 2021/5/21
 */
@Data
@Accessors(chain = true)
public class UserInfo implements Serializable {
    private static final long serialVersionUID = 547891924677981054L;

    /**
     * 用户基本信息
     */
    @ApiModelProperty(value = "用户基本信息")
    private SysUser user;

    /**
     * 用户所属部门
     */
    @ApiModelProperty(value = "用户所属部门")
    private SysDept dept;

    /**
     * 用户角色列表
     */
    @ApiModelProperty(value = "用户角色列表")
    private List<SysRole> roles;

    /**
     * 用户权限标识
     */
    @ApiModelProperty(value = "用户权限标识")
    private Set<String> perms;
}
