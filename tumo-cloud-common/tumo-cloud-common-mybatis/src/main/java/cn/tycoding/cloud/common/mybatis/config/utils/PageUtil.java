package cn.tycoding.cloud.common.mybatis.config.utils;

import cn.tycoding.cloud.common.mybatis.config.constants.PageConstant;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.HashMap;
import java.util.Map;

/**
 * 分页查询数据封装
 *
 * @author tycoding
 * @since 2021/2/26
 */
public class PageUtil {

    public static Map<String, Object> getData(IPage<?> page) {
        Map<String, Object> data = new HashMap<>();
        data.put(PageConstant.PAGE_ROWS, page.getRecords());
        data.put(PageConstant.PAGE_TOTAL, page.getTotal());
        return data;
    }
}
