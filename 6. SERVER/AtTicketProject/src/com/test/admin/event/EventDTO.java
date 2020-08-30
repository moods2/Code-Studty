package com.test.admin.event;

public class EventDTO {
	
	private String seq; //번호
	private String title; //제목
	private String startdate; //시작일
	private String enddate; //종료일
	private String eindex; //구분
	private String banner; //배너사진
	private String content; //페이지사진
	private int showseq; //공연번호
	private String delflag; //ㅇㅇ
	
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
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getEindex() {
		return eindex;
	}
	public void setEindex(String eindex) {
		this.eindex = eindex;
	}
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getShowseq() {
		return showseq;
	}
	public void setShowseq(int showseq) {
		this.showseq = showseq;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	

}
