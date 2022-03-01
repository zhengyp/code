package com.example.controller;

import com.example.common.Result;
import com.example.entity.Requirement;
import com.example.service.RequirementService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import com.example.exception.CustomException;
import cn.hutool.core.util.StrUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/api/requirement")
public class RequirementController {
    @Resource
    private RequirementService requirementService;
    @Resource
    private HttpServletRequest request;

    public User getUser() {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            throw new CustomException("-1", "请登录");
        }
        return user;
    }

    @PostMapping
    public Result<?> save(@RequestBody Requirement requirement) {
        return Result.success(requirementService.save(requirement));
    }

    @PutMapping
    public Result<?> update(@RequestBody Requirement requirement) {
        return Result.success(requirementService.updateById(requirement));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        requirementService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(requirementService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(requirementService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Requirement> query = Wrappers.<Requirement>lambdaQuery().orderByDesc(Requirement::getId);
        if (StrUtil.isNotBlank(name)) {
            query.like(Requirement::getName, name);
        }
        return Result.success(requirementService.page(new Page<>(pageNum, pageSize), query));
    }

}
