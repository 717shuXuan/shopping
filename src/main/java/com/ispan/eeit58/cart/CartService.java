package com.ispan.eeit58.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit58.User.User;
import com.ispan.eeit58.product.Product;
import com.ispan.eeit58.product.ProductRepository;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;
    
    @Autowired
    private ProductRepository productRepository;
    
    @Autowired
    private CartItemRepository cartItemRepository;

    // 在這裡實現購物車相關的業務邏輯
    public List<CartItem> getCartItems(User user) {
        Cart cart = cartRepository.findByUser(user).orElse(null);
        return cart != null ? cart.getCartItems() : new ArrayList<>();
    }

    public void addToCart(User user, long productId, int quantity) {
        // 通过 productId 查找 Product
        // 如果找不到，抛出 IllegalArgumentException 异常
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("無效的商品ID"));

        // 通过 user 查找购物车 Cart
        // 如果找不到，创建一个新的购物车
        Cart cart = cartRepository.findByUser(user).orElseGet(() -> createNewCart(user));

        // 将 Product 添加到购物车，或更新购物车中的商品数量
        addOrUpdateCartItem(cart, product, quantity);
    }

    private Cart createNewCart(User user) {
        Cart cart = new Cart();
        cart.setUser(user);
        cartRepository.save(cart);
        return cart;
    }

    private void addOrUpdateCartItem(Cart cart, Product product, int quantity) {
        // 在购物车中查找是否已经存在该商品
        CartItem cartItem = cart.getCartItems().stream()
                .filter(item -> item.getProduct().getId() == product.getId())
                .findFirst()
                .orElse(null);

        if (cartItem == null) {
            // 如果购物车中不存在该商品，则创建一个新的 CartItem
            cartItem = new CartItem();
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cartItem.setQuantity(quantity);
            cart.getCartItems().add(cartItem);
        } else {
            // 如果购物车中已经存在该商品，则更新商品的数量
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        }

        // 保存或更新购物车项
        cartItemRepository.save(cartItem);
    }
    public void updateQuantity(int itemId, int delta) {
        CartItem cartItem = cartItemRepository.findById(itemId).orElseThrow(() -> new NoSuchElementException("找不到購物車項目"));
        int newQuantity = cartItem.getQuantity() + delta;

        if (newQuantity <= 0) {
            cartItemRepository.delete(cartItem);
        } else {
            cartItem.setQuantity(newQuantity);
            cartItemRepository.save(cartItem);
        }
    }

    public void deleteCartItem(int itemId) {
        CartItem cartItem = cartItemRepository.findById(itemId).orElseThrow(() -> new NoSuchElementException("找不到購物車項目"));
        cartItemRepository.delete(cartItem);
    }

    public List<CartItem> getCartItemsByUserId(int userId) {
        Cart cart = cartRepository.findByUserId(userId);
        return cartItemRepository.findByCartId(cart.getId());
    }
}
