package com.yaorange.ssm.mapper;

import com.yaorange.ssm.pojo.User;

import java.util.List;

public interface UserMapper {
    User findById(Integer id);

    List<User> findAll();

    void insert(User user);

    void deleteById(Long id);

    void update(User user);
}
