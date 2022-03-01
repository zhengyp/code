package com.example.service;

import com.example.entity.Dept;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.DeptMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DeptService extends ServiceImpl<DeptMapper, Dept> {

    @Resource
    private DeptMapper deptMapper;

}
