package cn.tycoding.cloud.upms.biz.service;

import cn.tycoding.cloud.upms.api.dto.MenuTree;
import cn.tycoding.cloud.upms.api.entity.SysMenu;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 菜单表(Menu)表服务接口
 *
 * @author tycoding
 * @since 2021/5/21
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     * 构建菜单Tree树
     */
    List<MenuTree<SysMenu>> tree(SysMenu sysMenu);

    /**
     * 构建左侧权限菜单
     */
    List<MenuTree<SysMenu>> build(Long userId);

    /**
     * 根据用户ID查询权限信息
     */
    List<SysMenu> getUserMenuList(List<SysRole> sysRoleList);

    /**
     * 条件查询
     */
    List<SysMenu> list(SysMenu sysMenu);

    /**
     * 新增
     */
    void add(SysMenu sysMenu);

    /**
     * 修改
     */
    void update(SysMenu sysMenu);

    /**
     * 删除
     */
    void delete(Long id);

}
