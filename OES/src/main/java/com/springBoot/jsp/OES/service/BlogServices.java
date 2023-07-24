package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.Blog;

public interface BlogServices {

	List<Blog> getAllBlog();

	Blog getBlogById(int id);

}
