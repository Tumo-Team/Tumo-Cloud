package cn.tycoding.tumo.cloud.system.biz.mapper;

import cn.tycoding.tumo.cloud.system.api.entity.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

    /**
     * 改变部门表节点排序
     *
     * @param id
     */
    void changeTopNode(Long id);
}
