package com.test.user.ticket;

public class UserShowDTO {
	
	//공연기본정보
	private String seq;//seq
	private String title;//제목
	private String startDate;//시작일
	private String endDate;//종료일
	private String price;//티켓가격
	private String poster;//포스터이름
	private String content;//내용
	private String openDate;//오픈날짜
	private String age;//관람가능연령
	private String genre;//장르
	private String agencySeq;//기획사 번호
	private String theaterSeq;//상영관 번호
	private String delflag;//삭제여부
	
	
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getAgencySeq() {
		return agencySeq;
	}
	public void setAgencySeq(String agencySeq) {
		this.agencySeq = agencySeq;
	}
	public String getTheaterSeq() {
		return theaterSeq;
	}
	public void setTheaterSeq(String theaterSeq) {
		this.theaterSeq = theaterSeq;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	
	
	

}
