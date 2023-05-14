package com.ispan.eeit58.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ispan.eeit58.User.UserRepository;
import com.ispan.eeit58.cart.CartService;
import com.ispan.eeit58.ecpay.EcpayService;
import com.ispan.eeit58.payments.Payment;
import com.ispan.eeit58.payments.PaymentRepository;
import com.ispan.eeit58.User.User;
import com.ispan.eeit58.cart.CartItem;
import com.ispan.eeit58.ecpay.AllInOne;
import com.ispan.eeit58.ecpay.domain.AioCheckOutALL;


import java.math.BigDecimal;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderItemRepository orderItemRepository;
	@Autowired
	private PaymentRepository paymentRepository;
	@Autowired
	private UserRepository userRepository;
	private Payment payment;
	@Autowired
    private EcpayService ecpayService;
	
	public Page<Order> findOrdersByCustomerId(int customerId, Pageable pageable) {
	    return orderRepository.findByCustomerId(customerId, pageable);
	}


    public String ecpayCheckout(User user) {
        // 根据用户ID获取用户信息
        int userId = user.getId();

        // 获取购物车内容
        List<CartItem> cartItems = cartService.getCartItemsByUserId(userId);

        // 计算订单总金额
        BigDecimal totalPrice = cartItems.stream()
                .map(item -> item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 创建订单
        Order order = new Order();
        order.setCustomerId(userId);
        order.setTotalAmount(totalPrice);
        order.setOrderDate(new Date());
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());
        order.setStatus("待出貨");
        order.setPaymentMethod("ECPay");
        order.setShippingMethod("ECPay");
        order.setShippingAddress("");
        orderRepository.save(order);

        // 创建订单项
        for (CartItem cartItem : cartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(order.getOrderId());
            orderItem.setProductId(cartItem.getProduct().getId());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setUnitPrice(cartItem.getProduct().getPrice());
            orderItem.setTotalPrice(cartItem.getProduct().getPrice().multiply(new BigDecimal(cartItem.getQuantity())));
            orderItemRepository.save(orderItem);
        }

        // 创建支付
        Payment payment = new Payment();
        payment.setOrderId(order.getOrderId());
        payment.setPaymentMethod("ECPay");
        payment.setPaymentPrice(totalPrice);
        payment.setPaymentDate(new Date());
        payment.setPaymentStatus("待出貨");
        paymentRepository.save(payment);

        // 生成绿界金流的支付表单
        
        String aioCheckOutALLForm = ecpayService.generateEcpayForm(totalPrice.intValue(), order.getOrderId());


        return aioCheckOutALLForm;
    }
}
