package com.example.controller;

import com.example.common.Result;
import com.example.entity.Poem;
import com.example.service.PoemService;
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
@RequestMapping("/api/poem")
public class PoemController {
    @Resource
    private PoemService poemService;
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
    public Result<?> save(@RequestBody Poem poem) {
        return Result.success(poemService.save(poem));
    }

    @PutMapping
    public Result<?> update(@RequestBody Poem poem) {
        return Result.success(poemService.updateById(poem));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        poemService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(poemService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(poemService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Poem> query = Wrappers.<Poem>lambdaQuery().orderByDesc(Poem::getId);
        if (StrUtil.isNotBlank(name)) {
            query.like(Poem::getName, name);
        }
        return Result.success(poemService.page(new Page<>(pageNum, pageSize), query));
    }

}
