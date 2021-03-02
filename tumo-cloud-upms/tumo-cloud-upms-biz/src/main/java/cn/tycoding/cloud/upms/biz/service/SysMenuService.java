package cn.tycoding.cloud.upms.biz.service;

import cn.hutool.core.lang.Dict;
import cn.tycoding.cloud.upms.api.dto.MenuTree;
import cn.tycoding.cloud.upms.api.entity.SysMenu;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 菜单表(Menu)表服务接口
 *
 * @author tycoding
 * @since 2020-10-14 14:45:51
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     * 构建菜单Tree树
     */
    List<MenuTree<SysMenu>> tree();

    /**
     * 获取菜单表基础数据
     */
    Dict baseTree();

    /**
     * 构建左侧权限菜单
     */
    List<MenuTree<SysMenu>> build();

    /**
     * 根据用户ID查询权限信息
     */
    List<SysMenu> getUserMenuList(List<SysRole> sysRoleList);

    /**
     * 校验名称是否存在
     */
    boolean checkName(SysMenu sysMenu);

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
