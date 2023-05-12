package com.ispan.eeit58.User;

import com.ispan.eeit58.User.User;
import com.ispan.eeit58.User.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // 其他方法（如註冊、登錄等）

    public User updateUserProfile(User updatedUser) {
        // 在這裡處理表單數據並更新用戶資料
        // 例如：
        // 1. 如果有新的檔案上傳，更新用戶頭像
        // 2. 更新用戶的其他資訊，如姓名、信箱、電話、生日、地址等
        // 3. 保存更新後的用戶資料到資料庫
        // 4. 更新 session 中的用戶資料
        // 5. 使用 RedirectAttributes 添加一條成功消息，以便在個人資料頁面顯示

        User existingUser = userRepository.findById(updatedUser.getId()).orElseThrow(() -> new IllegalArgumentException("Invalid user id"));

        // 更新用戶的其他資訊，如姓名、信箱、電話、生日、地址等
        existingUser.setRealname(updatedUser.getRealname());
        existingUser.setEmail(updatedUser.getEmail());
        existingUser.setPhone(updatedUser.getPhone());
        existingUser.setBirthday(updatedUser.getBirthday());
        existingUser.setAddress(updatedUser.getAddress());
        existingUser.setSex(updatedUser.getSex());


        // 如果有新的檔案上傳，更新用戶頭像
        if (updatedUser.getPicture() != null) {
            existingUser.setPicture(updatedUser.getPicture());
        }

        // 保存更新後的用戶資料到資料庫
        userRepository.save(existingUser);

        return existingUser;
    }

    public User registerUser(User user) throws IOException {
        // 將用戶信息保存到數據庫中
        return userRepository.save(user);
    }
    
}
