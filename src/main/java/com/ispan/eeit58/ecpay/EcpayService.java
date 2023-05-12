package com.ispan.eeit58.ecpay;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import com.ispan.eeit58.ecpay.AllInOne;
import com.ispan.eeit58.ecpay.domain.AioCheckOutALL;
import com.ispan.eeit58.ecpay.domain.AioCheckOutOneTime;
import com.ispan.eeit58.ecpay.ecpayOperator.EcpayFunction;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;
import java.util.UUID;
import java.util.HashMap;
import java.util.Enumeration;
import java.util.Map;

@Service
public class EcpayService {
	private AllInOne allInOne;

	public EcpayService() {
		allInOne = new AllInOne("");
	}

	public String generateEcpayForm(int totalPrice, int orderId) {
		// 绿界金流表单生成逻辑
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		String randomTradeNo = UUID.randomUUID().toString().replace("-", "").substring(0, 16);
		obj.setMerchantTradeNo(randomTradeNo);
		obj.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())); // 当前日期格式：yyyy/MM/dd															// HH:mm:ss
		obj.setTotalAmount(String.valueOf(totalPrice));
		obj.setTradeDesc("Order Payment");
		obj.setItemName("Product Name");
		obj.setReturnURL("http://localhost:8080/test/payment-notification");
		obj.setClientBackURL("http://localhost:8080/test/orders");
		obj.setNeedExtraPaidInfo("N");
		String aioCheckOutALLForm = allInOne.aioCheckOut(obj, null);
		return aioCheckOutALLForm;
	}

	public boolean handlePaymentNotification(HttpServletRequest request) {
		// 验证支付通知签名
		Map<String, String> params = new HashMap<>();
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			params.put(paramName, request.getParameter(paramName));
		}

		String checkMacValue = params.get("CheckMacValue");
		params.remove("CheckMacValue");

		String genCheckMacValue = EcpayFunction.genCheckMacValue("5294y06JbISpM5x9", "v77hoKGq4kWxNNIS", params);

		return checkMacValue.equals(genCheckMacValue);
	}
}
