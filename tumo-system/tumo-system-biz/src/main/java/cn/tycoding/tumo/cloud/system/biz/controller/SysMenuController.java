package cn.tycoding.tumo.cloud.system.biz.controller;

import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.common.log.annotation.Log;
import cn.tycoding.tumo.cloud.common.web.controller.BaseController;
import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;
import cn.tycoding.tumo.cloud.system.biz.service.SysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 菜单表 前端控制器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/menu")
public class SysMenuController extends BaseController {

    private final SysMenuService sysMenuService;

    /**
     * 构建菜单Tree树，此接口将获取菜单表中所有数据
     *
     * @return List
     */
    @GetMapping("/tree")
    public R tree() {
        return new R<>(sysMenuService.tree());
    }

    /**
     * 加载系统左侧权限菜单，此接口将获取菜单中`menu`类型的数据
     *
     * @return List
     */
    @GetMapping("/build")
    public R build() {
        return new R<>(sysMenuService.build());
    }

    /**
     * 校验当前名称是否已存在
     *
     * @param sysMenu id:当前修改对象的ID
     *                name:需要校验的名称
     * @return Boolean
     */
    @PostMapping("/checkName")
    public R checkName(@RequestBody SysMenu sysMenu) {
        return new R<>(sysMenuService.checkName(sysMenu));
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable Long id) {
        if (id == null || id == 0) {
            return new R<>();
        } else {
            return new R<>(sysMenuService.getById(id));
        }
    }

    @Log("添加权限")
    @PostMapping
    public R add(@RequestBody SysMenu sysMenu) {
        sysMenuService.add(sysMenu);
        return new R();
    }

    @Log("删除权限")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable Long id) {
        sysMenuService.delete(id);
        return new R();
    }

    @Log("更新权限")
    @PutMapping
    public R edit(@RequestBody SysMenu sysMenu) {
        sysMenuService.update(sysMenu);
        return new R();
    }
}
