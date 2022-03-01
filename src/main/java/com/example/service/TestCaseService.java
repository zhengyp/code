package com.example.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.common.Result;
import com.example.entity.TestCase;
import com.example.mapper.TestCaseMapper;
import com.example.vo.TestCaseVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TestCaseService extends ServiceImpl<TestCaseMapper, TestCase> {

    @Resource
    private TestCaseMapper testCaseMapper;

    public Page<TestCaseVO> myTestCaseVo(Page<TestCaseVO> iPage){

        return testCaseMapper.getPageVo(iPage);
    }

    }



