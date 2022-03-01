package com.example.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.TestCase;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.vo.TestCaseVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TestCaseMapper extends BaseMapper<TestCase> {

    @Select("select t.id,t.name,c.typeName,d.statusName from test_case t\n" +
            "left join dept c on t.case_type = c.id\n" +
            "left join dictionary_item d on d.key = t.operate_status;")
    List<TestCaseVO> testCaseList();

    @Select("select t.id,\n" +
            "       t.name,\n" +
            "       t.requirement,\n" +
            "       t.sprint,\n" +
            "       t.business_component,\n" +
            "       t.pre_condition,\n" +
            "       t.response_data,\n" +
            "       t.input_args,\n" +
            "       t.anticipate,\n" +
            "       t.create_time,\n" +
            "       t.creator,\n" +
            "       t.update_time,\n" +
            "       t.updater,\n" +
            "       t.version,\n" +
            "       c.type_name,\n" +
            "       c.id caseType,\n" +
            "       d.status_name,\n+" +
            "       d.id operateStatus from test_case t\n" +
            "left join dept c on t.case_type = c.id\n" +
            "left join dictionary_item d on d.id = t.operate_status where t.is_deleted = '0' order by t.update_time desc")
    Page<TestCaseVO> getPageVo(Page<TestCaseVO> iPage);


}
