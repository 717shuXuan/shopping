package com.ispan.eeit58.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(String username, String password) {
        boolean result = adminService.login(username, password);
        if (result) {
            return "登录成功";
        } else {
            return "用户名或密码错误";
        }
    }

    // 更多的管理功能...
}
