package com.springBoot.jsp.OES.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springBoot.jsp.OES.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

}
