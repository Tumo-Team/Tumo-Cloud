package cn.tycoding.cloud.upms.biz.mapper;

import cn.tycoding.cloud.upms.api.entity.SysDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 部门表(Dept)表数据库访问层
 *
 * @author tycoding
 * @since 2020-10-14 14:47:30
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

}
