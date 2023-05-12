package com.ispan.eeit58.Order;

import com.ispan.eeit58.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderItemRepository orderItemRepository;

	@PostMapping("/ecpayCheckout")
	public String ecpayCheckout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			// 如果 user 为 null，请将用户重定向到登录页面
			return "redirect:/login";
		}
		// 使用 OrderService 的方法来生成绿界金流的付款表单
		String aioCheckOutALLForm = orderService.ecpayCheckout(user);

		// 将付款表单添加到 model 中，然后在前端页面中渲染它
		model.addAttribute("aioCheckOutALLForm", aioCheckOutALLForm);

		return "ecpayCheckout";
	}

	@GetMapping("/orders")
	public String getOrders(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "5") int size) {
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login";
		}

		Pageable pageable = PageRequest.of(page, size, Sort.by("orderDate").descending());
		Page<Order> ordersPage = orderService.findOrdersByCustomerId(user.getId(), pageable);

		for (Order order : ordersPage.getContent()) {
			List<OrderItem> orderItems = orderItemRepository.findByOrderId(order.getOrderId());
			order.setOrderItems(orderItems);
		}

		model.addAttribute("ordersPage", ordersPage);
		return "orders";
	}

}
