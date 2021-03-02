package cn.tycoding.cloud.common.mybatis.config.constants;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 分页结果集封装
 *
 * @author tycoding
 * @since 2021/2/25
 */
@Data
@AllArgsConstructor
public class QueryPage implements Serializable {
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
