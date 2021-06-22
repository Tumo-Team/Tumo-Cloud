package cn.tycoding.cloud.upms.biz.service;

import cn.hutool.core.lang.tree.Tree;
import cn.tycoding.cloud.upms.api.dto.SysRoleDTO;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 角色表(Role)表服务接口
 *
 * @author tycoding
 * @since 2021/5/21
 */
public interface SysRoleService extends IService<SysRole> {

    /**
     * 根据用户ID查询其关联的所有角色
     */
    List<SysRole> findRolesByUserId(Long id);

    /**
     * 获取角色Tree集合
     */
    List<Tree<Object>> tree(SysRole sysRole);

    /**
     * 根据ID查询
     */
    SysRoleDTO findById(Long roleId);

    /**
     * 新增角色
     */
    void add(SysRoleDTO sysRole);

    /**
     * 修改角色
     */
    void update(SysRoleDTO sysRole);

    /**
     * 删除
     */
    void delete(Long id);
}
