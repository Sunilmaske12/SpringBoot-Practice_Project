package com.springBoot.jsp.OES.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.BlogRepository;
import com.springBoot.jsp.OES.entity.Blog;

@Service
public class BlogServiceImpl implements BlogServices {

	@Autowired
	private BlogRepository blogRepository;
	
	@Override
	public List<Blog> getAllBlog() {
		return blogRepository.findAll();
	}

	@Override
	public Blog getBlogById(int id) {
		Optional<Blog> blog=blogRepository.findById(id);
		Blog getBlog= blog.get();
		return getBlog;
	}

}
