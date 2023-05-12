package com.ispan.eeit58.Category;

import javax.persistence.*;

import com.ispan.eeit58.product.Product;

import java.util.List;

@Entity
@Table(name = "os_productsCategory")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "category")
    private List<Product> products;

    // Getters and setters
}
