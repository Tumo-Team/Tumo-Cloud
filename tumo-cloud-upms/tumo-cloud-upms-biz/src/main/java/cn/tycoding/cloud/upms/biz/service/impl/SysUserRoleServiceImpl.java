package cn.tycoding.cloud.upms.biz.service.impl;

import cn.tycoding.cloud.upms.api.entity.SysUserRole;
import cn.tycoding.cloud.upms.biz.mapper.SysUserRoleMapper;
import cn.tycoding.cloud.upms.biz.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户角色关联表(UserRole)表服务实现类
 *
 * @author tycoding
 * @since 2020-10-15 12:33:51
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUserRolesByUserId(Long userId) {
        baseMapper.delete(new LambdaQueryWrapper<SysUserRole>().eq(SysUserRole::getUserId, userId));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUserRolesByRoleId(Long roleId) {
        baseMapper.delete(new LambdaQueryWrapper<SysUserRole>().eq(SysUserRole::getRoleId, roleId));
    }
}
