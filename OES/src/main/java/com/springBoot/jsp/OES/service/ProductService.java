package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.Category;
import com.springBoot.jsp.OES.entity.Product;

public interface ProductService {
	
	public List<Product> getAllProduct();

	public List<Category> getAllCategories();

	public List<Product> getProductByCategory(int i);

	public Product getProductById(int id);

	public void deleteUserById(int productId);

	public void deleteCategoryById(int cid);

	

}
