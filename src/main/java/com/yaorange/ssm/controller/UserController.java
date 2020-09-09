package com.yaorange.ssm.controller;


import com.yaorange.ssm.pojo.User;
import com.yaorange.ssm.service.UserService;
import com.yaorange.ssm.vo.PageVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

@RestController
@RequestMapping("/rest/user")
public class UserController {
    @Resource
    private UserService userService;

    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") Integer id){
        return userService.findById(id);
    }

     @GetMapping("/listByPage")
    public PageVo<User> queryById(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        return userService.findByPage(page,limit);
    }

//    添加
    @PostMapping("/add")
    public String add(User user){
        user.setCreated(new Date());
        user.setUpdated(new Date());
        userService.save(user);
        return "ok";
    }

    //编辑
    @PostMapping("/update")
    public String update(User user){
        userService.update(user);
        return "ok";
    }

    //删除
    @PostMapping("/delete")
    public String delete(Long id){
        userService.deleteById(id);
        return "ok";
    }
}
