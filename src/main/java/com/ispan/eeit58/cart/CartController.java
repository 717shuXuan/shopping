package com.ispan.eeit58.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ispan.eeit58.User.User;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/cart")
    public String showCart(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
        	redirectAttributes.addFlashAttribute("message", "請先登入");
            return "redirect:/login";
        }
        model.addAttribute("cartItems", cartService.getCartItems(user));
        return "cart";
    }

    @PostMapping("/cart/add")
    public ResponseEntity<?> addToCart(@RequestParam("productId") long productId,
                            @RequestParam("quantity") int quantity,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("請先登錄");
        }
        try {
            cartService.addToCart(user, productId, quantity);
            return ResponseEntity.ok("添加成功");
        } catch (Exception e) {
            e.printStackTrace(); // 打印異常堆棧跟踪
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("添加失敗: " + e.getMessage());
        }
    }

    @PostMapping("/cart/update/{itemId}")
    public String updateQuantity(@PathVariable int itemId, int delta) {
        cartService.updateQuantity(itemId, delta);
        return "購物車已更新";
    }

    @DeleteMapping("/cart/delete/{itemId}")
    public String deleteCartItem(@PathVariable int itemId) {
        cartService.deleteCartItem(itemId);
        return "購物車商品已刪除";
    }
    
    @PostMapping("/cart/update")
    public String updateCartItemQuantity(@RequestParam int itemId, @RequestParam int delta) {
        cartService.updateQuantity(itemId, delta);
        return "redirect:/cart";
    }

    @PostMapping("/cart/remove")
    public String removeCartItem(@RequestParam int itemId) {
        cartService.deleteCartItem(itemId);
        return "redirect:/cart";
    }


}
