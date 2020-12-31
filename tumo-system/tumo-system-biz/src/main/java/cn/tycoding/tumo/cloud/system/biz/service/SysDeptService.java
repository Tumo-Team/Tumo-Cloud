package cn.tycoding.tumo.cloud.system.biz.service;

import cn.tycoding.tumo.cloud.system.api.dto.Tree;
import cn.tycoding.tumo.cloud.system.api.entity.SysDept;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public interface SysDeptService extends IService<SysDept> {

    /**
     * 查询部门Tree树
     */
    List<Tree<SysDept>> tree();

    /**
     * 条件查询
     */
    List<SysDept> list(SysDept sysDept);

    /**
     * 根绝ID查询
     */
    SysDept findById(Long id);

    /**
     * 校验当前名称是否存在
     */
    boolean checkName(SysDept sysDept);

    /**
     * 添加部门
     */
    void add(SysDept dept);

    /**
     * 删除部门
     */
    void delete(Long id);

    /**
     * 更新部门
     */
    void update(SysDept sysDept);
}
