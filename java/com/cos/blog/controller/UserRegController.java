package com.cos.blog.controller;

import com.cos.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserRegController {

    @Autowired
    private UserService userService;

    // id 중복 체크 컨트롤러
    @RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
    @ResponseBody
    public int idCheck(@RequestParam("username") String username) {

        return userService.userIdCheck(username);
    }
}