package cn.tycoding.cloud.upms.api.dto;

import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 对User实体类的扩展
 *
 * @author tycoding
 * @since 2020/10/24
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysUserDTO extends SysUser {

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 角色信息
     */
    private List<SysRole> roles;
}
