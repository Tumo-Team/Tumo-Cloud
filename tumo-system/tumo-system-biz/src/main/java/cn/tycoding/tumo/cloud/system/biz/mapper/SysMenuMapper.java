package cn.tycoding.tumo.cloud.system.biz.mapper;

import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 根据用户ID查询此用户可访问的菜单列表
     *
     * @param id
     * @return
     */
    List<SysMenu> findPermissionsByUserId(Long id);

    /**
     * 改变父节点
     *
     * @param id
     */
    void changeTopNode(Long id);
}
