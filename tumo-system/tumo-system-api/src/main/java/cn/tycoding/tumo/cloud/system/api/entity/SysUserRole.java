package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户角色表
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@Accessors(chain = true)
@TableName(value = "sys_user_role")
public class SysUserRole implements Serializable {

    /**
     * 用户ID
     */
    @TableField(value = "user_id")
    private Long userId;

    /**
     * 角色ID
     */
    @TableField(value = "role_id")
    private Long roleId;
}
