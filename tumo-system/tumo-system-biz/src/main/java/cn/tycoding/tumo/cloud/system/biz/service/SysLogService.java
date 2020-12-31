package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.common.core.utils.Page;
import cn.tycoding.tumo.cloud.system.api.entity.SysLog;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysLogService extends IService<SysLog> {

    /**
     * 分页、条件查询日志列表
     */
    IPage<SysLog> list(SysLog log, Page page);

    /**
     * 根据ID删除日志记录
     */
    void delete(Long id);

    /**
     * 保存操作日志
     */
    void add(SysLog log);
}
