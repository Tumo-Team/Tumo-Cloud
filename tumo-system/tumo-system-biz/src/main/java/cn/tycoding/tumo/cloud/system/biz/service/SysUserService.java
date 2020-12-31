package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.system.api.dto.MenuTree;
import cn.tycoding.tumo.cloud.system.api.dto.UserInfo;
import cn.tycoding.tumo.cloud.system.api.dto.UserWithInfo;
import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;
import cn.tycoding.tumo.cloud.system.api.entity.SysUser;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 获取用户基本信息、角色信息、权限信息
     */
    UserInfo getUserInfo(SysUser user);

    /**
     * 根据用户名查询
     */
    SysUser findByName(String username);

    /**
     * 根据ID查询
     */
    UserInfo findById(Long id);

    /**
     * 根据用户ID获取菜单信息
     */
    List<MenuTree<SysMenu>> getMenuByUserId(Long id);

    /**
     * 查询用户集合数据
     */
    IPage<UserWithInfo> list(SysUser user, Page page);

    /**
     * 校验当前名称是否存在
     */
    boolean checkName(SysUser sysUser);

    /**
     * 新增
     */
    void add(UserInfo userInfo);

    /**
     * 删除，并删除与该角色相关的权限信息
     */
    void delete(Long id);

    /**
     * 更新
     */
    void update(UserInfo userInfo);

    /**
     * 修改密码
     */
    void updatePass(SysUser sysUser);
}
