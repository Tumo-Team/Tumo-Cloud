package cn.tycoding.tumo.cloud.system.api.utils;

import cn.tycoding.tumo.cloud.system.api.dto.MenuMeta;
import cn.tycoding.tumo.cloud.system.api.dto.MenuTree;
import cn.tycoding.tumo.cloud.system.api.entity.SysMenu;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public class MenuTreeUtils {

    public static List<MenuTree<SysMenu>> build(List<SysMenu> menus) {
        List<MenuTree<SysMenu>> treeList = new ArrayList<>();
        menus.forEach(menu -> {
            MenuTree<SysMenu> tree = new MenuTree<>();
            tree.setId(menu.getId());
            tree.setName(menu.getName());
            tree.setPath(menu.getPath());
            tree.setMeta(new MenuMeta(menu.getName(), menu.getIcon()));
            tree.setComponent(menu.getComponent());
            tree.setPerms(menu.getPerms());
            tree.setHidden(menu.getHidden());
            tree.setFrame(menu.getFrame());
            tree.setParentId(menu.getParentId());
            treeList.add(tree);
        });
        return buildTree(treeList);
    }

    /**
     * 构建Tree树
     *
     * @param nodes 节点集合
     * @return
     */
    private static List<MenuTree<SysMenu>> buildTree(List<MenuTree<SysMenu>> nodes) {
        if (nodes == null) {
            return null;
        }
        List<MenuTree<SysMenu>> tree = new ArrayList<>();
        nodes.forEach(node -> {
            Long pid = node.getParentId();
            if (pid == null || pid.equals(0L)) {
                node.setComponent("Layout");
                node.setAlwaysShow(true);
                tree.add(node);
                return;
            }
            for (MenuTree<SysMenu> c : nodes) {
                Long id = c.getId();
                if (id != null && id.equals(pid)) {
                    c.getChildren().add(node);
                    return;
                }
            }
        });
        return tree;
    }
}
