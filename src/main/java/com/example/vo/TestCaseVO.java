package com.example.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data
public class TestCaseVO {
    private Long id;
    private String name;
    private String caseType;
    private String typeName;
    private String preCondition;
    private String anticipate;
    private String inputArgs;
    private String businessComponent;
    private String requirement;
    private String responseData;
    private String sprint;
    private String operateStatus;
    private String statusName;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    private String creator;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
    private String updater;
}
