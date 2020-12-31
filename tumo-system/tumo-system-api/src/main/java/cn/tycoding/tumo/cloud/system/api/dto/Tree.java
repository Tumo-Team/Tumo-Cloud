package cn.tycoding.tumo.cloud.system.api.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Data
public class Tree<T> {

    /**
     * 节点ID
     */
    private Long id;

    /**
     * 父节点ID
     */
    private Long parentId;

    /**
     * 节点名称
     */
    private String name;

    /**
     * 子节点
     */
    private List<Tree<T>> children = new ArrayList<>();
}
