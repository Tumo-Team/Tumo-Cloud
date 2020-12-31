package cn.tycoding.tumo.cloud.common.core.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * 分页查询响应结构
 *
 * @author tycoding
 * @since 2020/12/26
 */
@Data
@AllArgsConstructor
public class Page implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 当前页
     */
    private int page;

    /**
     * 每页的记录数
     */
    private int limit;
}
