package cn.tycoding.tumo.cloud.system.biz.controller;

import cn.tycoding.tumo.cloud.common.core.exception.GlobalException;
import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.common.core.utils.R;
import cn.tycoding.tumo.cloud.common.log.annotation.Log;
import cn.tycoding.tumo.cloud.common.web.controller.BaseController;
import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import cn.tycoding.tumo.cloud.system.biz.service.SysLogService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 日志表 前端控制器
 *
 * @author tycoding
 * @date 2020/7/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/log")
public class SysLogController extends BaseController {

    private final SysLogService sysLogService;

    /**
     * 分页、条件查询
     *
     * @param log       查询条件
     * @param page 分页条件
     * @return
     */
    @PostMapping("/list")
    public R list(@RequestBody SysLog log, Page page) {
        return new R<>(super.getData(sysLogService.list(log, page)));
    }

    @Log("删除系统日志")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable("id") Long id) {
        try {
            sysLogService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PostMapping
    public R add(@RequestBody SysLog sysLog) {
        sysLogService.add(sysLog);
        return new R();
    }
}
