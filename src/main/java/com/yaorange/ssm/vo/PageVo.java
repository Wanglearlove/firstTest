package com.yaorange.ssm.vo;

import lombok.Data;

import java.util.List;

@Data
public class PageVo<T> {
    private Integer code;
    private Long count;
    private List<T> data;
    private String msg;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
