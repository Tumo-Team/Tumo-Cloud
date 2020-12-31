package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 菜单表
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@TableName(value = "sys_menu")
public class SysMenu implements Serializable {

    public static final String TYPE_MENU = "menu";
    public static final String TYPE_BUTTON = "button";

    /**
     * 菜单ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 上级菜单ID
     */
    private Long parentId;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * 菜单地址
     */
    private String path;

    /**
     * 图标
     */
    private String icon;

    /**
     * Vue组件
     */
    private String component;

    /**
     * 菜单类型
     */
    private String type;

    /**
     * 是否隐藏
     */
    private Boolean hidden;

    /**
     * 是否是外链
     */
    private Boolean frame;

    public void setName(String name) {
        this.name = name == null ? "" : name.trim();
    }

    public void setPerms(String perms) {
        this.perms = perms == null ? "" : perms.trim();
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? "" : icon.trim();
    }

    public void setComponent(String component) {
        this.component = component;
    }
}
