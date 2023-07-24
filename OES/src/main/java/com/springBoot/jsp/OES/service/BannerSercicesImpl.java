package com.springBoot.jsp.OES.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springBoot.jsp.OES.dao.BannerRepository;
import com.springBoot.jsp.OES.entity.Banner;

@Service
public class BannerSercicesImpl implements BannerServices {
	
	@Autowired
	private BannerRepository bannerRepository;
	
	@Override
	public List<Banner> getAllBanner() {
		return bannerRepository.findAll() ;
	}

	
	@Override
	public void updateStatus(String status, int bid) {
		//getting object 
		Optional<Banner> getBanner = bannerRepository.findById(bid);
		Banner banner = getBanner.get();
		banner.setAction(status);
		bannerRepository.save(banner);
	}


	@Override
	public void deleteBanner(int Bid) {
		bannerRepository.deleteById(Bid);;
		}

}
