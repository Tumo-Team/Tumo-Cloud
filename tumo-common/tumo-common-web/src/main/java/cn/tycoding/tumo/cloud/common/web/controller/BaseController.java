package cn.tycoding.tumo.cloud.common.web.controller;

import cn.tycoding.tumo.cloud.common.core.constant.CommonConstants;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.HashMap;
import java.util.Map;

/**
 * 提供Controller层公共方法
 *
 * @author tycoding
 * @since 2020/12/26
 */
public class BaseController {

    public Map<String, Object> getData(IPage<?> page) {
        Map<String, Object> data = new HashMap<>();
        data.put(CommonConstants.PAGE_ROWS, page.getRecords());
        data.put(CommonConstants.PAGE_TOTAL, page.getTotal());
        return data;
    }

}
