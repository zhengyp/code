package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("poem")
public class Poem extends Model<Poem> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 作者 
      */
    private String author;

    /**
      * 内容 
      */
    private String content;

    /**
      * 标题 
      */
    private String name;

    /**
      * 时代 
      */
    private String period;

}