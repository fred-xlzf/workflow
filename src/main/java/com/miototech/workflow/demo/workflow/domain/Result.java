package com.miototech.workflow.demo.workflow.domain;

import java.io.Serializable;

public class Result<T> implements Serializable {
    private int errorCode;
    private String errorMsg;
    private T data;

    public Result(Integer code, String msg) {
        super();
        this.errorCode = code;
        this.errorMsg = msg;
    }

    public Result(Integer code, String msg, T data) {
        this.errorCode = code;
        this.errorMsg = msg;
        this.data = data;
    }

    public Result(int code, String msg, T data) {
        super();
        this.errorCode = code;
        this.errorMsg = msg;
        this.setData(data);
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public T getData() {
        return data;
    }

    private void setData(T data) {
        this.data = data;
    }
}
