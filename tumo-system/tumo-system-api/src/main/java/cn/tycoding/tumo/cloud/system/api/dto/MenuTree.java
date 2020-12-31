package cn.tycoding.tumo.cloud.system.api.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Data
public class MenuTree<T> {

    /**
     * 节点ID
     */
    private Long id;

    /**
     * 父节点ID
     */
    private Long parentId;

    /**
     * 路由名称
     */
    private String name;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 重定向地址
     */
    private String redirect;

    /**
     * Vue组件地址
     */
    private String component;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * icon && title 信息
     */
    private MenuMeta meta;

    /**
     * 是否隐藏该节点
     */
    private Boolean hidden;

    /**
     * 其下子节点知否作为根节点展示
     */
    private Boolean alwaysShow;

    /**
     * 是否是外链
     */
    private Boolean frame;

    /**
     * 子节点
     */
    private List<MenuTree<T>> children = new ArrayList<>();
}
