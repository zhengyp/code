package com.example.service;

import com.example.entity.Requirement;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.RequirementMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RequirementService extends ServiceImpl<RequirementMapper, Requirement> {

    @Resource
    private RequirementMapper requirementMapper;

}
