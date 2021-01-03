package com.qst.test;

import com.qst.bean.User;
import com.qst.dao.UserDao;
import org.junit.Ignore;
import org.junit.Test;

import java.util.Date;

public class UserDaoTest {
    @Test
    public void testLogin() {
//        User Loginuser = new User();
//        Loginuser.setEmail("123@123");
//        Loginuser.setPassword("123456");
//
//        UserDao dao = new UserDao();
//        User user = dao.Login(Loginuser);
//
//        System.out.println(user);
        UserDao dao = new UserDao();
        for (int i = 0; i < 100; i++) {
            String email = i + "454855@qq.com";


            /*User user = new User (email,"123456");*/
            dao.update(email, 10);
            dao.Message(email, new Date(), "存了" + 10 + "元钱");
        }
/*
        if (dao.findEmail("123@123"))

            dao.Register(user);
        System.out.println("已存在");*/
//        System.out.println(dao.findEmail("qw@qw"));
    }
}
