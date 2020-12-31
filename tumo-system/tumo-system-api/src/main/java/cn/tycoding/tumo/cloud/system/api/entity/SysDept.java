package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 部门表
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@TableName(value = "sys_dept")
public class SysDept implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 上级部门ID
     */
    private Long parentId;

    /**
     * 名称
     */
    private String name;

    public void setName(String name) {
        this.name = name == null ? "" : name.trim();
    }
}
