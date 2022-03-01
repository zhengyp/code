package com.example.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName(value = "test_case")
public class TestCase extends Model<TestCase> {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String caseType;

    private String preCondition;

    private String anticipate;

    private String inputArgs;
    @TableLogic
    private Integer isDeleted;

    private String businessComponent;

    private String name;

    private String requirement;

    private String responseData;

    private String sprint;

    private String operateStatus;
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
    @Version
    private Integer version;

}