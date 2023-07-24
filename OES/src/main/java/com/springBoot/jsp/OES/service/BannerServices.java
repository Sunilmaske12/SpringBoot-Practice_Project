package com.springBoot.jsp.OES.service;

import java.util.List;

import com.springBoot.jsp.OES.entity.Banner;

public interface BannerServices {

	List<Banner> getAllBanner();

	void updateStatus(String status, int bid);

	void deleteBanner(int bid);

}
