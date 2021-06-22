package cn.tycoding.cloud.upms.biz.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.tycoding.cloud.common.auth.utils.AuthUtil;
import cn.tycoding.cloud.common.core.utils.BeanUtil;
import cn.tycoding.cloud.common.log.exception.ServiceException;
import cn.tycoding.cloud.upms.api.dto.SysRoleDTO;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysRoleMenu;
import cn.tycoding.cloud.upms.biz.mapper.SysRoleMapper;
import cn.tycoding.cloud.upms.biz.mapper.SysRoleMenuMapper;
import cn.tycoding.cloud.upms.biz.mapper.SysUserRoleMapper;
import cn.tycoding.cloud.upms.biz.service.SysRoleMenuService;
import cn.tycoding.cloud.upms.biz.service.SysRoleService;
import cn.tycoding.cloud.upms.biz.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色表(Role)表服务实现类
 *
 * @author tycoding
 * @since 2021/5/21
 */
@Service
@RequiredArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

    private final SysRoleMenuService sysRoleMenuService;
    private final SysUserRoleService sysUserRoleService;
    private final SysUserRoleMapper sysUserRoleMapper;
    private final SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public List<SysRole> findRolesByUserId(Long id) {
        return sysUserRoleMapper.getRoleListByUserId(id);
    }

    @Override
    public List<Tree<Object>> tree(SysRole sysRole) {
        List<SysRole> list = this.list(new LambdaQueryWrapper<SysRole>()
                .like(StringUtils.isNotEmpty(sysRole.getName()), SysRole::getName, sysRole.getName())
        );
        // 构建树形结构
        List<TreeNode<Object>> nodeList = CollUtil.newArrayList();
        list.forEach(t -> {
            TreeNode<Object> node = new TreeNode<>(
                    t.getId(),
                    t.getParentId(),
                    t.getName(),
                    0
            );
            node.setExtra(Dict.create().set("alias", t.getAlias()).set("des", t.getDes()).set("status", t.getStatus()));
            nodeList.add(node);
        });
        return TreeUtil.build(nodeList, 0L);
    }

    private List<Long> getMenuIdsByRoleId(Long roleId) {
        List<SysRoleMenu> list = sysRoleMenuMapper.selectList(new LambdaQueryWrapper<SysRoleMenu>().eq(SysRoleMenu::getRoleId, roleId));
        return list.stream().map(SysRoleMenu::getMenuId).collect(Collectors.toList());
    }

    @Override
    public SysRoleDTO findById(Long roleId) {
        SysRole role = this.getById(roleId);
        SysRoleDTO sysRole = BeanUtil.copy(role, SysRoleDTO.class);
        sysRole.setMenuIds(getMenuIdsByRoleId(roleId));
        return sysRole;
    }

    @Override
    public void add(SysRoleDTO sysRole) {
        sysRole.setParentId(sysRole.getParentId() == null ? 0L : sysRole.getParentId());
        this.save(sysRole);
        addMenus(sysRole);
    }

    @Override
    public void update(SysRoleDTO sysRole) {
        sysRole.setParentId(sysRole.getParentId() == null ? 0L : sysRole.getParentId());
        baseMapper.updateById(sysRole);
        addMenus(sysRole);
    }

    private void addMenus(SysRoleDTO sysRole) {
        List<Long> menuIds = sysRole.getMenuIds();
        Long id = sysRole.getId();
        if (menuIds != null) {
            // 先删除原有的关联
            sysRoleMenuService.deleteRoleMenusByRoleId(id);

            // 再新增关联
            List<SysRoleMenu> sysRoleMenuList = new ArrayList<>();
            menuIds.forEach(menuId -> sysRoleMenuList.add(new SysRoleMenu()
                    .setMenuId(menuId)
                    .setRoleId(id)));
            sysRoleMenuService.saveBatch(sysRoleMenuList);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        SysRole sysRole = this.getById(id);
        if (AuthUtil.ADMINISTRATOR.equals(sysRole.getAlias())) {
            throw new ServiceException("[超级管理员]角色不可删除");
        }
        baseMapper.deleteById(id);
        sysRoleMenuService.deleteRoleMenusByRoleId(id);
        sysUserRoleService.deleteUserRolesByRoleId(id);
    }
}
