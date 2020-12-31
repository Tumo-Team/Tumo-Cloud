package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.system.api.dto.RoleWithMenu;
import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysRoleService extends IService<SysRole> {

    /**
     * 根据用户ID查询用户的角色信息
     */
    List<SysRole> findRolesByUserId(Long id);

    /**
     * 分页、条件查询用户列表数据
     */
    IPage<SysRole> list(SysRole sysRole, Page page);

    /**
     * 条件查询用户列表数据
     */
    List<SysRole> list(SysRole role);

    /**
     * 根据用户名查询器角色和权限信息
     */
    RoleWithMenu findById(Long id);

    /**
     * 校验当前名称是否存在
     */
    boolean checkName(SysRole sysRole);

    /**
     * 添加角色，并添加该角色与权限的关联信息
     */
    void add(RoleWithMenu role);

    /**
     * 更新角色，并更新（修改）该角色对应的权限关联信息
     */
    void update(RoleWithMenu role);

    /**
     * 根据ID删除角色，并删除其关联的权限信息
     */
    void delete(Long id);
}
