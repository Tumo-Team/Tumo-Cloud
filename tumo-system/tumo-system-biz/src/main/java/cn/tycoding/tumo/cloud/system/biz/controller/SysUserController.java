package cn.tycoding.tumo.cloud.system.biz.controller;

import cn.tycoding.tumo.cloud.common.core.constant.enums.CommonEnums;
import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.common.log.annotation.Log;
import cn.tycoding.tumo.cloud.common.security.utils.SecurityUtil;
import cn.tycoding.tumo.cloud.common.web.controller.BaseController;
import cn.tycoding.tumo.cloud.system.api.dto.UserInfo;
import cn.tycoding.tumo.cloud.system.api.entity.SysUser;
import cn.tycoding.tumo.cloud.system.biz.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 用户表 前端控制器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/user")
public class SysUserController extends BaseController {

    private final SysUserService sysUserService;

    /**
     * 获取当前用户信息
     *
     * @return UserInfo
     */
    @GetMapping("/info")
    public R info() {
        String username = SecurityUtil.getUsername();
        SysUser user = sysUserService.findByName(username);
        if (user == null) {
            return new R<>(CommonEnums.USER_ERROR);
        }
        return new R<>(sysUserService.getUserInfo(user));
    }

    /**
     * 根据用户名查询用户信息
     * 为Feign服务，用户登录时Security需要存储用户信息
     *
     * @param username
     * @return UserInfo
     */
    @GetMapping("/info/{username}")
    public R loadUserInfo(@PathVariable("username") String username) {
        SysUser sysUser = sysUserService.findByName(username);
        if (sysUser == null) {
            return new R<>(CommonEnums.USER_ERROR);
        }
        return new R<>(sysUserService.getUserInfo(sysUser));
    }

    /**
     * 分页、条件查询用户列表信息
     *
     * @param sysUser   查询条件
     * @param page 分页参数
     * @return Map
     */
    @PostMapping("/list")
    public R list(@RequestBody SysUser sysUser, Page page) {
        return new R<>(super.getData(sysUserService.list(sysUser, page)));
    }

    /**
     * 根据用户ID获取对应的菜单列表
     *
     * @param id 用户名
     * @return List
     */
    @GetMapping("/getMenus/{id}")
    public R getMenuByUserId(@PathVariable("id") Long id) {
        return new R<>(sysUserService.getMenuByUserId(id));
    }

    /**
     * 根据用户ID获取用户信息
     *
     * @param id 用户ID
     * @return UserInfo
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable Long id) {
        if (id == null || id == 0) {
            return new R<>();
        } else {
            return new R<>(sysUserService.findById(id));
        }
    }

    /**
     * 校验当前用户名是否已存在
     *
     * @param sysUser id:当前修改对象的ID
     *                username:需要校验的用户名
     * @return Boolean
     */
    @PostMapping("/checkName")
    public R checkName(@RequestBody SysUser sysUser) {
        return new R<>(sysUserService.checkName(sysUser));
    }

    @Log("添加用户")
    @PostMapping
    public R add(@RequestBody UserInfo userInfo) {
        sysUserService.add(userInfo);
        return new R();
    }

    @Log("删除用户")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable Long id) {
        sysUserService.delete(id);
        return new R();
    }

    @Log("更新用户")
    @PutMapping
    public R update(@RequestBody UserInfo userInfo) {
        sysUserService.update(userInfo);
        return new R();
    }

    @Log("修改密码")
    @PutMapping("/updatePass")
    public R updatePass(@RequestBody SysUser sysUser) {
        sysUserService.updatePass(sysUser);
        return new R();
    }
}
