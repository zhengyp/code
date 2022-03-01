package com.test;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.Application;
import com.example.entity.TestCase;
import com.example.mapper.TestCaseMapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest(classes = Application.class)
class TestCaseMapperTest {
    @Autowired
    private TestCaseMapper testCaseMapper;
    @Test
    void testCase() {
        testCaseMapper.testCaseList().forEach(System.out ::println);
    }

    @Test
    void testCase1(){
        Page<TestCase> page = new Page<>(1,2);
        Page<TestCase> result = (Page<TestCase>) testCaseMapper.selectPage(page,null);
        System.out.println(result.getSize());
        System.out.println(result.getTotal());
        result.getRecords().forEach(System.out ::println);

    }

    @Test
    void testCase2(){
        QueryWrapper  queryWrapper = new QueryWrapper();
        Map<String,Object> map = new HashMap<>();
        map.put("name","测试2");
        map.put("operate_status","NOT_EXECUTE");
//        queryWrapper.likeLeft("name","测试");
        queryWrapper.allEq(map);
        testCaseMapper.selectList(queryWrapper).forEach(System.out ::println);
    }
//
//    @Test
//    void testCase3(){
//        testCaseMapper.getPageVo(1,2)
//    }



}