package com.ispan.eeit58.product;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByNameContainingIgnoreCase(String search);

    List<Product> findByCategoryId(Long categoryId);
}
