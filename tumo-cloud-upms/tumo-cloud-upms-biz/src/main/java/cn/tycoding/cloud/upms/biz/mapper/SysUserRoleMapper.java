package cn.tycoding.cloud.upms.biz.mapper;

import cn.tycoding.cloud.upms.api.entity.SysRole;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import cn.tycoding.cloud.upms.api.entity.SysUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户角色关联表(UserRole)表数据库访问层
 *
 * @author tycoding
 * @since 2021/5/21
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

    /**
     * 根据RoleID查询User集合
     */
    List<SysUser> getUserListByRoleId(Long roleId);

    /**
     * 根据UserID查询Role集合
     */
    List<SysRole> getRoleListByUserId(Long userId);
}
