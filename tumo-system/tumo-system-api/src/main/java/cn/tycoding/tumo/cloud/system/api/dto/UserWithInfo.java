package cn.tycoding.tumo.cloud.system.api.dto;

import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import cn.tycoding.tumo.cloud.system.api.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 作为SysUser类的增强类，继承SysUser，扩展存储用户角色、部门信息
 *
 * @author tycoding
 * @date 2020/7/18
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserWithInfo extends SysUser {

    /**
     * 用户所属部门名称
     */
    private String deptName;

    /**
     * 用户角色列表
     */
    private List<SysRole> roles;
}
