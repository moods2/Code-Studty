package com.test.user.ticket;

public class UserShowCouponDTO {
	private String seq;//쿠폰번호
	private String title;//쿠폰 이름
	private String startDate;//쿠폰 시작일 
	private String endDate;//쿠폰 끝일
	private String discount;//쿠폰 할인액
	private String showSeq;//쿠폰과 관련된 공연의 번호
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getShowSeq() {
		return showSeq;
	}
	public void setShowSeq(String showSeq) {
		this.showSeq = showSeq;
	}

	
	
	
}
