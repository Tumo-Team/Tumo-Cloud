package cn.tycoding.tumo.cloud.system.biz.service.impl;

import cn.tycoding.tumo.cloud.system.api.dto.MenuTree;
import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;
import cn.tycoding.tumo.cloud.system.api.utils.MenuTreeUtils;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysMenuMapper;
import cn.tycoding.tumo.cloud.system.biz.service.SysMenuService;
import cn.tycoding.tumo.cloud.system.biz.service.SysRoleMenuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Service
@AllArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {

    private final SysRoleMenuService sysRoleMenuService;

    @Override
    public List<SysMenu> findPermissionsByUserId(Long id) {
        return baseMapper.findPermissionsByUserId(id);
    }

    @Override
    public List<MenuTree<SysMenu>> tree() {
        return MenuTreeUtils.build(baseMapper.selectList(new LambdaQueryWrapper<>()));
    }

    @Override
    public List<MenuTree<SysMenu>> build() {
        List<SysMenu> menuList = baseMapper.selectList(
                new LambdaQueryWrapper<SysMenu>()
                        .eq(SysMenu::getType, SysMenu.TYPE_MENU));
        return MenuTreeUtils.build(menuList);
    }

    @Override
    @Transactional
    public void add(SysMenu sysMenu) {
        if (sysMenu.getParentId() == null) {
            sysMenu.setParentId(0L);
        }
        // TODO
        if (SysMenu.TYPE_BUTTON.equals(sysMenu.getType())) {
            sysMenu.setPath(null);
            sysMenu.setIcon(null);
        }
        this.save(sysMenu);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        baseMapper.deleteById(id);
        sysRoleMenuService.deleteRoleMenusByMenuId(id);
        baseMapper.changeTopNode(id);
    }

    @Override
    @Transactional
    public void update(SysMenu sysMenu) {
        if (sysMenu.getParentId() == null) {
            sysMenu.setParentId(0L);
        }
        // TODO
        if (SysMenu.TYPE_BUTTON.equals(sysMenu.getType())) {
            sysMenu.setIcon(null);
        }
        this.updateById(sysMenu);
    }

    @Override
    public boolean checkName(SysMenu sysMenu) {
        if (StringUtils.isBlank(sysMenu.getName())) {
            return false;
        }
        LambdaQueryWrapper<SysMenu> queryWrapper = new LambdaQueryWrapper<>();
        if (sysMenu.getId() != null && sysMenu.getId() != 0) {
            queryWrapper.eq(SysMenu::getName, sysMenu.getName());
            queryWrapper.ne(SysMenu::getId, sysMenu.getId());
        } else {
            queryWrapper.eq(SysMenu::getName, sysMenu.getName());
        }
        return baseMapper.selectList(queryWrapper).size() <= 0;
    }
}
