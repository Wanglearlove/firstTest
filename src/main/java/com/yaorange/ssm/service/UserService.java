package com.yaorange.ssm.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yaorange.ssm.mapper.UserMapper;
import com.yaorange.ssm.pojo.User;
import com.yaorange.ssm.vo.PageVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    public User findById(Integer id){
        return userMapper.findById(id);
    }

    public PageVo<User> findByPage(Integer page, Integer limit) {
        PageVo<User> result = new PageVo<User>();
        result.setCode(0);
        PageHelper.startPage(page,limit);
        Page<User> pageInfo = (Page<User>) userMapper.findAll();
        result.setCount(pageInfo.getTotal());
        result.setData(pageInfo.getResult());
        result.setMsg("ok");
        return result;
    }

    public void save(User user) {
        userMapper.insert(user);
    }

    public void deleteById(Long id) {
        userMapper.deleteById(id);
    }

    public void update(User user) {
        userMapper.update(user);
    }
}
