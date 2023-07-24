package com.springBoot.jsp.OES.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.CategoryRepository;
import com.springBoot.jsp.OES.dao.ProductRepository;
import com.springBoot.jsp.OES.entity.Category;
import com.springBoot.jsp.OES.entity.Product;

@Service
public class ProductServiceIml implements ProductService{
	
	@Autowired
	ProductRepository theProductRepository;
	
	@Autowired
	CategoryRepository theCategoryRepository;
	
	@Override
	public List<Product> getAllProduct() {
		List<Product> allProduct =theProductRepository.findAll(); 
		return allProduct;
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> category= theCategoryRepository.findAll();
		return category;
	}

	@Override
	public List<Product> getProductByCategory(int i) {
		return theProductRepository.findBycid(i);
	}

	@Override
	public Product getProductById(int id) {
		Optional<Product> product = theProductRepository.findById(id);
		Product theProduct = product.get();
		return theProduct;
	}

	@Override
	public void deleteUserById(int productId) {
		theProductRepository.deleteById(productId);		
	}

	@Override
	public void deleteCategoryById(int cid) {
		theCategoryRepository.deleteById(cid);
		
	}

	
	
}
