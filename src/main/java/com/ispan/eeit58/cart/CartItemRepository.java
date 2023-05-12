package com.ispan.eeit58.cart;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ispan.eeit58.cart.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {

	List<CartItem> findByCartId(int id);
    // 如果您需要添加自定义查询方法，请在这里添加
}
