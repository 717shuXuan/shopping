package com.ispan.eeit58.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit58.Order.Order;
import com.ispan.eeit58.User.User;
import com.ispan.eeit58.product.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping("/login")
    public String login(@RequestParam("account") String account, 
                        @RequestParam("password") String password, 
                        HttpSession session, 
                        Model model) {
        System.out.println("Received account: " + account);
        System.out.println("Received password: " + password);

        boolean result = adminService.login(account, password);
        if (result) {
            session.setAttribute("admin", account);
            return "redirect:/admin/index";
        } else {
            model.addAttribute("message", "Invalid account or password");
            return "login";
        }
    }



    @GetMapping("/index")
    public String index() {
        return "adminIndex";
    }


    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = adminService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/admin_users";
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        List<Product> products = adminService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/admin_products";
    }

    @GetMapping("/orders")
    public String listOrders(Model model) {
        List<Order> orders = adminService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/admin_orders";
    }

}

