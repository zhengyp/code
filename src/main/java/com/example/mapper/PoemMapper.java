package com.example.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.Poem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.vo.TestCaseVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface PoemMapper extends BaseMapper<Poem> {
    @Select("<script>" +
            " select t.* from t_log t" +
            " <where>" +
            " <if test='typeName!= null'>" +
            " and t.type_name like CONCAT('%',#{typeName},'%')" +
            " </if>" +
            " <if test='typeCode!= null'>" +
            " and t.type_code like CONCAT('%',#{typeCode},'%')" +
            " </if>" +
            " <if test='startTime != null'>" +
            " AND t.effective_date >= #{startTime} " +
            " </if>" +
            " <if test='endTime != null'>" +
            " AND t.effective_date &lt;= #{endTime} " +
            " </if>" +
            " </where>" +
            " </script>")
    IPage<Poem> selectPoemByPage(Page<Poem> page,
                                @Param("typeName") String typeName,
                                @Param("typeCode") String typeCode);

}
