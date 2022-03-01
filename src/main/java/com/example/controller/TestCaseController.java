package com.example.controller;

import com.example.common.Result;
import com.example.entity.TestCase;
import com.example.service.TestCaseService;
import com.example.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.vo.TestCaseVO;
import org.springframework.web.bind.annotation.*;
import com.example.exception.CustomException;
import cn.hutool.core.util.StrUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/testCase")
public class TestCaseController {
    @Resource
    private TestCaseService testCaseService;
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
    public Result<?> save(@RequestBody TestCase testCase) {
//        String ct = testCase.getCreateTime();
//        if(ct == null){
//            String now = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
//            testCase.setCreateTime(now);
//        }else{
//            testCase.setCreateTime(ct);
//        }
//        String now1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
//        testCase.setUpdateTime(now1);
//        testCase.setIsDeleted(false);
///       testCase.setCreator();
//       testCase.setUpdater("test");
        testCaseService.save(testCase);

        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody TestCase testCase) {
        return Result.success(testCaseService.updateById(testCase));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        testCaseService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Long id) {
        return Result.success(testCaseService.getById(id));
    }

    @GetMapping
    public Result<?> findAll() {
        return Result.success(testCaseService.list());
    }

    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<TestCase> query = Wrappers.<TestCase>lambdaQuery().orderByDesc(TestCase::getId);
        if (StrUtil.isNotBlank(name)) {
            query.like(TestCase::getName, name);
        }
        return Result.success(testCaseService.page(new Page<>(pageNum, pageSize), query));
    }

    @GetMapping("pageTest/{page}/{size}")
    public Page<TestCaseVO> pageTestB(@PathVariable Integer page, @PathVariable Integer size){
        Page<TestCaseVO> iPage = new Page<TestCaseVO>(page, size);
        return testCaseService.myTestCaseVo(iPage);
    }




}
