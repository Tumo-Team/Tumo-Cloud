package cn.tycoding.cloud.upms.biz.controller;

import cn.tycoding.cloud.common.auth.utils.AuthUtil;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.common.core.utils.ExcelUtil;
import cn.tycoding.cloud.common.log.annotation.ApiLog;
import cn.tycoding.cloud.common.mybatis.config.constants.QueryPage;
import cn.tycoding.cloud.common.mybatis.config.utils.PageUtil;
import cn.tycoding.cloud.upms.api.dto.SysUserDTO;
import cn.tycoding.cloud.upms.api.dto.UserInfo;
import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import cn.tycoding.cloud.upms.biz.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用户表 前端控制器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
@Api(value = "用户表接口", tags = "用户表接口")
public class SysUserController {

    private final SysUserService sysUserService;

    /**
     * 根据用户名查询用户信息
     * 为Feign服务，用户登录时Security需要存储用户信息
     */
    @GetMapping("/info/{username}")
    public R<UserInfo> loadUserInfo(@PathVariable("username") String username) {
        return R.data(sysUserService.info(username));
    }

    @GetMapping("/info")
    @ApiOperation(value = "获取当前用户信息")
    public R<UserInfo> info() {
        UserInfo userInfo = sysUserService.info(AuthUtil.getUsername());
        userInfo.getUser().setPassword(null);
        return R.data(userInfo);
    }

    @GetMapping("/role/list/{id}")
    @ApiOperation(value = "根据用户ID查询角色ID集合")
    public R menuList(@PathVariable Long id) {
        List<SysRole> sysRoleList = sysUserService.roleList(id);
        List<String> ids = sysRoleList.stream().map(SysRole::getId).collect(Collectors.toList()).stream().map(String::valueOf).collect(Collectors.toList());
        return R.data(ids);
    }

    @PostMapping("/role/add/{id}")
    @ApiOperation(value = "分配角色")
    public R addRole(@RequestBody List<Long> roleList, @PathVariable Long id) {
        sysUserService.addRole(roleList, id);
        return R.ok();
    }

    @PostMapping("/checkName")
    @ApiOperation(value = "校验名称是否已存在")
    public R<Boolean> checkName(@RequestBody SysUser sysUser) {
        return R.data(sysUserService.checkName(sysUser));
    }

    @PostMapping("/filter/list")
    @ApiOperation(value = "条件查询")
    public R<List<SysUser>> list(@RequestBody SysUser sysUser) {
        return R.data(sysUserService.list(sysUser));
    }

    @PostMapping("/list")
    @ApiOperation(value = "分页、条件查询")
    public R<Map> list(@RequestBody SysUserDTO user, QueryPage queryPage) {
        return R.data(PageUtil.getData(sysUserService.list(user, queryPage)));
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据ID查询")
    public R<SysUserDTO> findById(@PathVariable Long id) {
        return R.data(sysUserService.findById(id));
    }

    @PostMapping
    @ApiLog("新增用户")
    @ApiOperation(value = "新增")
    public R<SysUser> add(@RequestBody SysUserDTO user) {
        sysUserService.add(user);
        return R.ok();
    }

    @PutMapping
    @ApiLog("修改用户")
    @ApiOperation(value = "修改")
    public R update(@RequestBody SysUserDTO user) {
        sysUserService.update(user);
        return R.ok();
    }

    @DeleteMapping("/{id}")
    @ApiLog("删除用户")
    @ApiOperation(value = "根据ID删除")
    public R delete(@PathVariable Long id) {
        sysUserService.delete(id);
        return R.ok();
    }

    @DeleteMapping("/resetPass")
    @ApiLog("重置密码")
    @ApiOperation(value = "重置密码")
    public R resetPass(@RequestBody SysUser sysUser) {
        sysUserService.resetPass(sysUser);
        return R.ok();
    }

    @GetMapping("/export")
    @ApiOperation(value = "导出Excel")
    public void export(HttpServletResponse response) {
        List<SysUser> list = sysUserService.list();
        ExcelUtil.export(response, "用户数据", "用户数据", SysUser.class, list);
    }
}
