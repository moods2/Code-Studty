package com.test.admin.sales;

public class SalesDTO {

	private String bdate; //예매일
	private String sdate; //조회 시작 날
	private String edate; //조회 끝날
	private String Genre; //장르
	private int sales; //매출액
	private String strSales; //금액 표시 변환
	
	
	public void setStrSales(int sales) {
		this.strSales = String.format("%,d", sales);
	}
	
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getSales() {
		return sales;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	
}
