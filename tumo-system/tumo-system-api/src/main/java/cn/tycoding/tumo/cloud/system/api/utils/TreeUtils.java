package cn.tycoding.tumo.cloud.system.api.utils;

import cn.tycoding.tumo.cloud.system.api.dto.Tree;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
public class TreeUtils {

    /**
     * 构建Tree树
     *
     * @param nodes 节点集合
     * @return
     */
    public static <T> List<Tree<T>> build(List<Tree<T>> nodes) {
        if (nodes == null) {
            return null;
        }
        List<Tree<T>> treeList = new ArrayList<>();
        nodes.forEach(children -> {
            Long pid = children.getParentId();
            if (pid == null || pid.equals(0L)) {
                treeList.add(children);
                return;
            }
            for (Tree<T> parent : nodes) {
                Long id = parent.getId();
                if (id != null && id.equals(pid)) {
                    parent.getChildren().add(children);
                    return;
                }
            }
        });
        return treeList;
    }
}
