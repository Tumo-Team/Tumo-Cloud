package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色表
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@TableName(value = "sys_role")
public class SysRole implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 描述
     */
    private String description;

    public void setName(String name) {
        this.name = name == null ? "" : name.trim();
    }
}
