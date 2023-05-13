package com.ispan.eeit58.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public boolean login(String username, String password) {
        // 验证管理员身份...
        return true;
    }

    // 更多的管理功能...
}
