package cn.tycoding.tumo.cloud.system.biz.service.impl;

import cn.tycoding.tumo.cloud.system.api.entity.SysUserRole;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysUserRoleMapper;
import cn.tycoding.tumo.cloud.system.biz.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

    @Override
    @Transactional
    public void deleteUserRolesByRoleId(Long roleId) {
        LambdaQueryWrapper<SysUserRole> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysUserRole::getRoleId, roleId);
        baseMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteUserRolesByUserId(Long userId) {
        LambdaQueryWrapper<SysUserRole> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysUserRole::getUserId, userId);
        baseMapper.delete(queryWrapper);
    }
}
