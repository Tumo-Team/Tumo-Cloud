package cn.tycoding.tumo.cloud.system.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 用于构建Vue组件Meta
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@AllArgsConstructor
public class MenuMeta implements Serializable {

    private String title;

    private String icon;
}
