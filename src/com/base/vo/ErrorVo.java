package com.base.vo;

/**
 * 错误信息封装
 *
 * @author ChenMW 2016-02-22 14:04
 */
public class ErrorVo {

    private Integer errorCode;
    private String errorMessage;

    public ErrorVo(){}

    public ErrorVo(Integer errorCode, String errorMessage) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Integer getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(Integer errorCode) {
        this.errorCode = errorCode;
    }

}
