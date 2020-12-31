package cn.tycoding.tumo.cloud.system.api.dto;

import cn.tycoding.tumo.cloud.system.api.entity.SysRole;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 作为SysRole类的增强类，继承SysRole，扩展存储菜单信息
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class RoleWithMenu extends SysRole {

    /**
     * 菜单ID
     */
    private Long menuId;

    /**
     * 菜单ID集合
     */
    private List<Long> menuIds;
}
