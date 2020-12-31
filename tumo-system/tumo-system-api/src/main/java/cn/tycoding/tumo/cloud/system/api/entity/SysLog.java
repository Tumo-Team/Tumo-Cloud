package cn.tycoding.tumo.cloud.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Data
@TableName(value = "sys_log")
public class SysLog implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 操作用户
     */
    private String username;

    /**
     * 日志描述
     */
    private String operation;

    /**
     * 操作耗时
     */
    private Long time;

    /**
     * 操作方法
     */
    private String method;

    /**
     * 方法参数
     */
    private String params;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 地理位置
     */
    private String location;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 用于搜索条件
     */
    @TableField(exist = false)
    private String timeField;
}
