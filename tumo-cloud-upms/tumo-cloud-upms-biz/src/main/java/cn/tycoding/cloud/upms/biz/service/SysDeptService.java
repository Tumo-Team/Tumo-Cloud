package cn.tycoding.cloud.upms.biz.service;

import cn.hutool.core.lang.tree.Tree;
import cn.tycoding.cloud.upms.api.entity.SysDept;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 部门表(Dept)表服务接口
 *
 * @author tycoding
 * @since 2021/5/21
 */
public interface SysDeptService extends IService<SysDept> {

    /**
     * 条件查询
     */
    List<SysDept> list(SysDept sysDept);

    /**
     * 获取部门Tree
     */
    List<Tree<Object>> tree();

    /**
     * 删除
     */
    void delete(Long id);

}
