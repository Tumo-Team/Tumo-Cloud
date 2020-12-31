package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.system.api.entity.SysUserRole;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
     * 根据角色ID删除该用户的角色关联信息
     */
    void deleteUserRolesByRoleId(Long roleId);

    /**
     * 根据用户ID删除该用户的角色关联信息
     */
    void deleteUserRolesByUserId(Long userId);
}
