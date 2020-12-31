package cn.tycoding.tumo.cloud.system.biz.mapper;

import cn.tycoding.tumo.cloud.system.api.dto.RoleWithMenu;
import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

    List<SysRole> findRolesByUserId(Long id);

    List<RoleWithMenu> findById(Long id);
}
