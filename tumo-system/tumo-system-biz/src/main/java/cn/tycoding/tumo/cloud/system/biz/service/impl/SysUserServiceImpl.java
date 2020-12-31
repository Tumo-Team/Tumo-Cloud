package cn.tycoding.tumo.cloud.system.biz.service.impl;

import cn.tycoding.tumo.cloud.common.core.constant.CacheConstants;
import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.system.api.dto.MenuTree;
import cn.tycoding.tumo.cloud.system.api.dto.UserInfo;
import cn.tycoding.tumo.cloud.system.api.dto.UserWithInfo;
import cn.tycoding.tumo.cloud.system.api.entity.*;
import cn.tycoding.tumo.cloud.system.api.utils.MenuTreeUtils;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysMenuMapper;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysUserMapper;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysUserRoleMapper;
import cn.tycoding.tumo.cloud.system.biz.service.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Service
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private final SysMenuMapper sysMenuMapper;

    private final SysUserRoleMapper sysUserRoleMapper;

    private final SysUserRoleService sysUserRoleService;

    private final SysRoleService sysRoleService;

    private final SysMenuService sysMenuService;

    private final SysDeptService sysDeptService;

    private static final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public UserInfo getUserInfo(SysUser sysUser) {
        UserInfo userInfo = new UserInfo().setUser(sysUser);
        return this.build(userInfo);
    }

    /**
     * 构建用户信息、角色信息、权限标识信息、部门信息
     */
    private UserInfo build(UserInfo userInfo) {
        //获取用户角色列表
        List<SysRole> roleList = sysRoleService.findRolesByUserId(userInfo.getUser().getId());
        userInfo.setRoles(roleList);

        //获取用户权限列表
        List<SysMenu> menuList = sysMenuService.findPermissionsByUserId(userInfo.getUser().getId());
        Set<String> menuSet = menuList
                .stream()
                .filter(perm -> (perm.getPerms() != null && !perm.getPerms().equals("")))
                .map(SysMenu::getPerms)
                .collect(Collectors.toSet());

        //获取用户部门信息
        SysDept sysDept = sysDeptService.findById(userInfo.getUser().getDeptId());

        userInfo.setRoles(roleList);
        userInfo.setPermissions(menuSet);
        userInfo.setDept(sysDept);
        return userInfo;
    }

    @Override
    public SysUser findByName(String username) {
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StringUtils.isNoneBlank(username), SysUser::getUsername, username);
        List<SysUser> list = baseMapper.selectList(queryWrapper);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public UserInfo findById(Long id) {
        UserInfo userInfo = new UserInfo().setUser(baseMapper.selectById(id));
        return this.build(userInfo);
    }

    @Override
    public List<MenuTree<SysMenu>> getMenuByUserId(Long id) {
        return MenuTreeUtils.build(sysMenuMapper.findPermissionsByUserId(id));
    }

    @Override
    @CacheEvict(value = CacheConstants.USER_CACHE)
    public IPage<UserWithInfo> list(SysUser sysUser, Page queryPage) {
        com.baomidou.mybatisplus.extension.plugins.pagination.Page page = new com.baomidou.mybatisplus.extension.plugins.pagination.Page(queryPage.getPage(), queryPage.getLimit());
        IPage<UserWithInfo> iPage = baseMapper.list(page, sysUser);
        iPage.getRecords().forEach(user -> {
            if (user != null) {
                user.setRoles(sysRoleService.findRolesByUserId(user.getId()));
            }
        });
        return iPage;
    }

    @Override
    public boolean checkName(SysUser sysUser) {
        if (StringUtils.isBlank(sysUser.getUsername())) {
            return false;
        }
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        if (sysUser.getId() != null && sysUser.getId() != 0) {
            queryWrapper.eq(SysUser::getUsername, sysUser.getUsername());
            queryWrapper.ne(SysUser::getId, sysUser.getId());
        } else {
            queryWrapper.eq(SysUser::getUsername, sysUser.getUsername());
        }
        return baseMapper.selectList(queryWrapper).size() <= 0;
    }

    @Override
    @Transactional
    public void add(UserInfo userInfo) {
        userInfo.getUser().setCreateTime(new Date());
        passwordEncoder.encode(userInfo.getUser().getPassword());
        baseMapper.insert(userInfo.getUser());
        this.addUserRole(userInfo);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        baseMapper.deleteById(id);
        sysUserRoleService.deleteUserRolesByUserId(id);
    }

    /**
     * 根据UserInfo保存用户与角色之前的关联
     */
    private void addUserRole(UserInfo userInfo) {
        if (userInfo.getRoles() == null) {
            return;
        }
        userInfo.getRoles().forEach(sysRole -> {
            SysUserRole sysUserRole = new SysUserRole()
                    .setUserId(userInfo.getUser().getId())
                    .setRoleId(sysRole.getId());
            sysUserRoleMapper.insert(sysUserRole);
        });
    }

    @Override
    @Transactional
    public void update(UserInfo userInfo) {
        userInfo.getUser().setPassword(null);
        this.updateById(userInfo.getUser());

        // 删除之前用户与角色表之前的关联，并重新建立关联
        sysUserRoleService.deleteUserRolesByUserId(userInfo.getUser().getId());
        this.addUserRole(userInfo);
    }

    @Override
    @Transactional
    public void updatePass(SysUser sysUser) {
        SysUser user = new SysUser()
                .setId(sysUser.getId())
                .setPassword(passwordEncoder.encode(sysUser.getPassword()));
        baseMapper.updateById(user);
    }
}
