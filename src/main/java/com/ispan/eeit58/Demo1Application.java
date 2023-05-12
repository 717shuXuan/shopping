package com.ispan.eeit58;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ispan.eeit58.User",
								"com.ispan.eeit58.Order",
								"com.ispan.eeit58.product", 
								"com.ispan.eeit58.Category",
								"com.ispan.eeit58.cart",
								"com.ispan.eeit58.ecpay",
								"com.ispan.eeit58.payments"})

public class Demo1Application {

	public static void main(String[] args) {
		SpringApplication.run(Demo1Application.class, args);
	}

}
