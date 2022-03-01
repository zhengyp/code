package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;

import java.util.List;


@Data
@TableName("dept")
public class Dept extends Model<Dept> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 名称
      */
    private String typeName;

    /**
      * 描述
      */
    private String description;

    /**
      * 状态
      */
    private Boolean state;

    private Long parent;

    @TableField(exist = false)
    private List<Dept> children;

}
