package cn.tycoding.cloud.common.core.utils;

import cn.hutool.json.JSONUtil;
import cn.tycoding.cloud.common.core.api.R;
import cn.tycoding.cloud.common.core.constants.CommonConstant;
import lombok.SneakyThrows;

import javax.servlet.http.HttpServletResponse;

/**
 * Servlet常见工具类封装
 *
 * @author tycoding
 * @since 2021/2/25
 */
public class ServletUtil {

    @SneakyThrows
    public static void write(HttpServletResponse response, R data) {
        response.setStatus(data.getCode());
        response.setHeader("Content-type", "application/json;charset=" + CommonConstant.UTF_8);
        response.setCharacterEncoding(CommonConstant.UTF_8);
        response.getWriter().write(JSONUtil.toJsonStr(data));
    }
}
