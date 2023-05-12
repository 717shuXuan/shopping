package com.ispan.eeit58.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Base64;


@Controller
public class ProductController {
	private final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductService productService;
    

    @GetMapping("/products")
    public ModelAndView listProducts(@RequestParam(required = false) String search, @RequestParam(required = false) Long categoryId) {
        ModelAndView modelAndView = new ModelAndView();

        List<Product> products;
        if (search != null) {
            products = productService.searchProducts(search);
        } else if (categoryId != null) {
            products = productService.getProductsByCategory(categoryId);
        } else {
            products = productService.getAllProducts();
        }

        // 将商品图片字节数组转换为Base64编码的字符串
        Map<Long, String> base64Images = new HashMap<>();
        for (Product product : products) {
            byte[] imageData = product.getImageData();
            String base64Image = Base64.getEncoder().encodeToString(imageData);
            base64Images.put(product.getId(), base64Image);
        }

        modelAndView.addObject("products", products);
        modelAndView.addObject("base64Images", base64Images);
        modelAndView.setViewName("products");

        return modelAndView;
    }


    @GetMapping("/products/{id}")
    public String productDetails(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);

        // Convert the image data to a Base64 encoded string
        String base64Image = "";
        if (product.getImageData() != null) {
            base64Image = Base64.getEncoder().encodeToString(product.getImageData());
        }

        model.addAttribute("product", product);
        model.addAttribute("base64Image", base64Image);
        return "product-details";
    }

}
