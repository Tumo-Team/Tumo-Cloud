package cn.tycoding.tumo.cloud.system.biz.controller;

import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.common.log.annotation.Log;
import cn.tycoding.tumo.cloud.common.web.controller.BaseController;
import cn.tycoding.tumo.cloud.system.api.dto.RoleWithMenu;
import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import cn.tycoding.tumo.cloud.system.biz.service.SysRoleService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 角色表 前端控制器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/role")
public class SysRoleController extends BaseController {

    private final SysRoleService sysRoleService;

    /**
     * 分页、条件查询角色列表信息
     *
     * @param sysRole   查询条件
     * @param page 分页条件
     * @return Map
     */
    @PostMapping("/list")
    public R list(@RequestBody SysRole sysRole, Page page) {
        return new R<>(super.getData(sysRoleService.list(sysRole, page)));
    }

    /**
     * 条件查询角色列表信息
     *
     * @param sysRole 查询条件
     * @return List
     */
    @PostMapping("/filter/list")
    public R list(@RequestBody SysRole sysRole) {
        return new R<>(sysRoleService.list(sysRole));
    }

    /**
     * 根据角色ID查询
     *
     * @param id
     * @return SysRole
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable Long id) {
        if (id == null || id == 0) {
            return new R<>();
        } else {
            return new R<>(sysRoleService.findById(id));
        }
    }

    /**
     * 校验当前名称是否已存在
     *
     * @param sysRole id:当前修改对象的ID
     *                name:需要校验的名称
     * @return Boolean
     */
    @PostMapping("/checkName")
    public R checkName(@RequestBody SysRole sysRole) {
        return new R<>(sysRoleService.checkName(sysRole));
    }

    @Log("添加角色")
    @PostMapping
    public R add(@RequestBody RoleWithMenu sysRole) {
        sysRoleService.add(sysRole);
        return new R();
    }

    @Log("删除角色")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable Long id) {
        sysRoleService.delete(id);
        return new R();
    }

    @Log("更新角色")
    @PutMapping
    public R edit(@RequestBody RoleWithMenu sysRole) {
        sysRoleService.update(sysRole);
        return new R();
    }
}
