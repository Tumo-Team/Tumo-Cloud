package cn.tycoding.tumo.cloud.common.core.utils;

import cn.tycoding.tumo.cloud.common.core.constant.CommonConstants;
import cn.tycoding.tumo.cloud.common.core.constant.enums.CommonEnums;
import cn.tycoding.tumo.cloud.common.core.constant.enums.ScstHttpStatus;
import lombok.*;

import java.io.Serializable;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Builder
@ToString
@AllArgsConstructor
public class R<T> implements Serializable {

    @Getter
    @Setter
    private int code = CommonConstants.SUCCESS;

    @Getter
    @Setter
    private Object msg = "success";

    @Getter
    @Setter
    private T data;

    public R() {
        super();
    }

    public R(T data) {
        super();
        this.data = data;
    }

    public R(T data, String msg) {
        super();
        this.data = data;
        this.msg = msg;
    }

    public R(CommonEnums enums) {
        super();
        this.code = enums.getCode();
        this.msg = enums.getMsg();
    }

    public R(ScstHttpStatus enums) {
        super();
        this.code = enums.getCode();
        this.msg = enums.getMsg();
    }

    public R(Throwable e) {
        super();
        this.code = CommonConstants.ERROR;
        this.msg = e.getMessage();
    }
}
