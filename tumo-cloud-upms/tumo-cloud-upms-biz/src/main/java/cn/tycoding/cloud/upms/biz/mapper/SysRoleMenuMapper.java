package cn.tycoding.cloud.upms.biz.mapper;

import cn.tycoding.cloud.upms.api.entity.SysMenu;
import cn.tycoding.cloud.upms.api.entity.SysRoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色资源关联表(RoleMenu)表数据库访问层
 *
 * @author tycoding
 * @since 2020-10-15 12:34:11
 */
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

    List<SysMenu> getMenuListByRoleId(Long roleId);
}
