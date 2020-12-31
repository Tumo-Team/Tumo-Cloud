package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.system.api.entity.SysRoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysRoleMenuService extends IService<SysRoleMenu> {

    /**
     * 根据角色ID删除该角色的权限关联信息
     */
    void deleteRoleMenusByRoleId(Long roleId);

    /**
     * 根据权限ID删除角色权限关联信息
     */
    void deleteRoleMenusByMenuId(Long menuId);
}
