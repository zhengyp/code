package com.example.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("requirement")
public class Requirement extends Model<Requirement> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 需求背景 
      */
    private String background;

    /**
      * 具体内容 
      */
    private String content;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
      * 创建人 
      */
    private String creator;

    /**
      * 标题 
      */
    private String name;

    /**
      * 关联内容 
      */
    private String related;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    @TableField(fill = FieldFill.INSERT)
    private Date updateTime;

    /**
      * 更新人 
      */
    private String updator;

}