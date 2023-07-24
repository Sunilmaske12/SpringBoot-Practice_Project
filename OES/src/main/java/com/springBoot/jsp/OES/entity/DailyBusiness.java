package com.springBoot.jsp.OES.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class DailyBusiness {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Sr_No;
	private Date Date;
	private Long DailySell;
	private Long DailyProfit;
	private Long DailyOnlinePayment;
	private  Long DailyCashOnDelivery;
	public int getSr_No() {
		return Sr_No;
	}
	public void setSr_No(int sr_No) {
		Sr_No = sr_No;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
	public Long getDailySell() {
		return DailySell;
	}
	public void setDailySell(Long dailySell) {
		DailySell = dailySell;
	}
	public Long getDailyProfit() {
		return DailyProfit;
	}
	public void setDailyProfit(Long dailyProfit) {
		DailyProfit = dailyProfit;
	}
	public Long getDailyOnlinePayment() {
		return DailyOnlinePayment;
	}
	public void setDailyOnlinePayment(Long dailyOnlinePayment) {
		DailyOnlinePayment = dailyOnlinePayment;
	}
	public Long getDailyCashOnDelivery() {
		return DailyCashOnDelivery;
	}
	public void setDailyCashOnDelivery(Long dailyCashOnDelivery) {
		DailyCashOnDelivery = dailyCashOnDelivery;
	}
	
	

}
