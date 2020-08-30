package com.test.user.review;

public class ReviewDTO {

	private String rseq; //리뷰번호
	private int cseq; //고객번호(로그인한 고객)
	private String id; //고객id
	private String title;
	private String content;
	private String regdate;
	private String rview; //조회수
	private String rfile; //첨부파일
	private String heart; //추천수
	
	private String showSeq; //공연 번호
	private String showName; //해당 리뷰의 공연 이름
	private String genre; //공연 장르
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRfile() {
		return rfile;
	}
	public void setRfile(String rfile) {
		this.rfile = rfile;
	}
	public String getRseq() {
		return rseq;
	}
	public void setRseq(String rseq) {
		this.rseq = rseq;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRview() {
		return rview;
	}
	public void setRview(String rview) {
		this.rview = rview;
	}
	public String getShowSeq() {
		return showSeq;
	}
	public void setShowSeq(String showSeq) {
		this.showSeq = showSeq;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}

}
