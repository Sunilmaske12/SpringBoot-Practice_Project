package com.springBoot.jsp.OES.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springBoot.jsp.OES.entity.Banner;


public interface BannerRepository extends JpaRepository<Banner, Integer> {

}
