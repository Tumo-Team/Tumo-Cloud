package cn.tycoding.cloud.upms.biz.mapper;

import cn.tycoding.cloud.upms.api.dto.SysUserDTO;
import cn.tycoding.cloud.upms.api.entity.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户表(User)表数据库访问层
 *
 * @author tycoding
 * @since 2021/5/21
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    IPage<SysUserDTO> page(IPage<SysUser> page, SysUserDTO user, Long ignoreId);
}
