package cn.tycoding.cloud.upms.biz.controller;

import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.common.core.utils.ExcelUtil;
import cn.tycoding.cloud.common.mybatis.config.constants.QueryPage;
import cn.tycoding.cloud.common.mybatis.config.utils.PageUtil;
import cn.tycoding.cloud.upms.api.entity.SysLog;
import cn.tycoding.cloud.upms.biz.service.SysLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 系统日志表(Log)表控制层
 *
 * @author tycoding
 * @since 2020-10-14 16:53:52
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/log")
@Api(value = "系统日志表接口", tags = "系统日志表接口")
public class SysLogController {

    private final SysLogService sysLogService;

    @PostMapping("/list")
    @ApiOperation(value = "分页、条件查询")
    public R<Map> list(@RequestBody SysLog sysLog, QueryPage queryPage) {
        return R.data(PageUtil.getData(sysLogService.list(sysLog, queryPage)));
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据ID查询")
    public R<SysLog> findById(@PathVariable Long id) {
        return R.data(sysLogService.getById(id));
    }

    @PostMapping
    @ApiOperation(value = "新增")
    public R add(@RequestBody SysLog sysLog) {
        sysLogService.add(sysLog);
        return R.ok();
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "根据ID删除")
    public R delete(@PathVariable Long id) {
        sysLogService.delete(id);
        return R.ok();
    }

    @GetMapping("/export")
    @ApiOperation(value = "导出Excel")
    public void export(HttpServletResponse response) {
        List<SysLog> list = sysLogService.list();
        ExcelUtil.export(response, "日志数据", "日志数据", SysLog.class, list);
    }
}
