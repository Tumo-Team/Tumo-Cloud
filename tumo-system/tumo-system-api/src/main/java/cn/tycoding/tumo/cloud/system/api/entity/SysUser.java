package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户表
 *
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@Accessors(chain = true)
@TableName(value = "sys_user")
public class SysUser implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 电话
     */
    private String phone;

    /**
     * 状态：true激活、false锁定
     */
    private Boolean status;

    /**
     * 创建时间
     */
    private Date createTime;

    public void setUsername(String username) {
        this.username = username == null ? "" : username.trim();
    }
}
