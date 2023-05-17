package com.ispan.eeit58.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit58.Order.Order;
import com.ispan.eeit58.Order.OrderRepository;
import com.ispan.eeit58.User.User;
import com.ispan.eeit58.User.User.Role;
import com.ispan.eeit58.User.UserRepository;
import com.ispan.eeit58.product.Product;
import com.ispan.eeit58.product.ProductService;

@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderRepository orderRepository;

    public boolean login(String account, String password) {
        User user = userRepository.findByAccount(account);
        System.out.println("Queried user: " + user);
        System.out.println("User role: " + user.getRole());
        boolean result = user != null && user.getPassword().equals(password) && user.getRole() == Role.ADMIN;
        System.out.println("Login result: " + result);
        return result;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public List<Product> getAllProducts() {
        return productService.findAll();
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    // ... 更多的管理功能

}
