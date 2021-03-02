package cn.tycoding.cloud.common.core.utils;

import com.alibaba.excel.EasyExcel;

import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * 对EasyExcel的简单封装
 *
 * @author tycoding
 * @since 2021/2/25
 */
public class ExcelUtil {

    public static <T> void export(HttpServletResponse response, String fileName, String sheetName, Class<T> clazz, List<T> list) {
        try {
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding(StandardCharsets.UTF_8.name());
            fileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8.name());
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            EasyExcel.write(response.getOutputStream(), clazz).sheet(sheetName).doWrite(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
