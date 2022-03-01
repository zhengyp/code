package com.example.controller;

import com.example.common.Result;
import com.example.entity.Dept;
import com.example.service.DeptService;
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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/dept")
public class DeptController {
    @Resource
    private DeptService deptService;
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
    public Result<?> save(@RequestBody Dept dept) {
        return Result.success(deptService.save(dept));
    }

    @PutMapping
    public Result<?> update(@RequestBody Dept dept) {
        return Result.success(deptService.updateById(dept));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        deptService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(deptService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        List<Dept> list = deptService.list();
        return Result.success(createTree(null, list));
    }

    @GetMapping("/all")
    public Result<?> all() {
        return Result.success(deptService.list());
    }



    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String typeName,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Dept> query = Wrappers.<Dept>lambdaQuery().orderByDesc(Dept::getId);
        if (StrUtil.isNotBlank(typeName)) {
            query.like(Dept::getTypeName, typeName);
        }
        return Result.success(deptService.page(new Page<>(pageNum, pageSize), query));
    }

    /**
     * 递归生成菜单树
     */
    private List<Dept> createTree(Long pid, List<Dept> depts) {
        List<Dept> treeMenu = new ArrayList<>();
        for (Dept dept : depts) {
            if (dept.getParent() == pid) {
                treeMenu.add(dept);
                dept.setChildren(createTree(dept.getId(), depts));
            }
        }
        return treeMenu;
    }

}
