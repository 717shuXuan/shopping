package com.ispan.eeit58.product;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ispan.eeit58.Category.Category;

@Entity
@Table(name = "os_products")
public class Product {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
	
	@Column(name = "name")
    private String name;
	
	@Column(name = "price")
    private BigDecimal price;
	
	@Lob
	@Column(name = "imageData")
	private byte[] imageData;
	
	@Column(name = "description")
    private String description;
	
	@Column(name = "stock")
    private int stock;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
        return price;
    }

	public void setPrice(BigDecimal price) {
        this.price = price;
    }

	public byte[] getImageData() {
	    return imageData;
	}

	public void setImageData(byte[] imageData) {
	    this.imageData = imageData;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
    
    

	
}
