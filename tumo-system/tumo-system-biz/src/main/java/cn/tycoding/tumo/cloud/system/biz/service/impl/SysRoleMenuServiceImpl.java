package cn.tycoding.tumo.cloud.system.biz.service.impl;

import cn.tycoding.tumo.cloud.system.api.entity.SysRoleMenu;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysRoleMenuMapper;
import cn.tycoding.tumo.cloud.system.biz.service.SysRoleMenuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {

    @Override
    @Transactional
    public void deleteRoleMenusByRoleId(Long roleId) {
        LambdaQueryWrapper<SysRoleMenu> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysRoleMenu::getRoleId, roleId);
        baseMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteRoleMenusByMenuId(Long menuId) {
        LambdaQueryWrapper<SysRoleMenu> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysRoleMenu::getMenuId, menuId);
        baseMapper.delete(queryWrapper);
    }
}
