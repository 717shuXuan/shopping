package com.ispan.eeit58.payments;

import javax.servlet.http.HttpServletRequest;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.ispan.eeit58.ecpay.EcpayService;

@Controller
public class PaymentController {
    
    private EcpayService ecpayService;
    
    public PaymentController(EcpayService ecpayService) {
        this.ecpayService = ecpayService;
    }

    @PostMapping("/payment-notification")
    public ResponseEntity<String> handlePaymentNotification(HttpServletRequest request) {
        boolean isValid = ecpayService.handlePaymentNotification(request);
        if (isValid) {
            // 處理成功支付通知的邏輯
            return ResponseEntity.ok("1|OK");
        } else {
            // 處理無效支付通知的邏輯
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("0|ERR");
        }
    }
}
