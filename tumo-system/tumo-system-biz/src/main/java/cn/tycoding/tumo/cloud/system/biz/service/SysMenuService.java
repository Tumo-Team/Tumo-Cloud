package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.system.api.dto.MenuTree;
import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     * 根据用户ID获取用户的权限信息
     */
    List<SysMenu> findPermissionsByUserId(Long id);

    /**
     * 获取菜单Tree树
     */
    List<MenuTree<SysMenu>> tree();

    /**
     * 构建左侧权限菜单
     */
    List<MenuTree<SysMenu>> build();

    /**
     * 校验当前名称是否存在
     */
    boolean checkName(SysMenu sysMenu);

    /**
     * 添加菜单
     */
    void add(SysMenu menu);

    /**
     * 删除菜单
     */
    void delete(Long id);

    /**
     * 更新菜单
     */
    void update(SysMenu menu);
}
