package com.test.admin.view;

public class ViewDTO {

	//실시간
	private String genre;
	private String title;
	private String poster;
	private float rate;
	private String showseq;
	
	//방문자
	private String vdate;
	private float vcnt;
	private String vrate;
	
	//일일 예매율
	private String dbdate;
	private float dbrate;
	
	//장르별 예매율
	private String ggenre;
	private float grate;
	
	//성별 연령별 예매율
	private String age;
	private float man;
	private float woman;
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public float getMan() {
		return man;
	}
	public void setMan(float man) {
		this.man = man;
	}
	public float getWoman() {
		return woman;
	}
	public void setWoman(float woman) {
		this.woman = woman;
	}
	public String getGgenre() {
		return ggenre;
	}
	public void setGgenre(String ggenre) {
		this.ggenre = ggenre;
	}
	public float getGrate() {
		return grate;
	}
	public void setGrate(float grate) {
		this.grate = grate;
	}
	public String getDbdate() {
		return dbdate;
	}
	public void setDbdate(String dbdate) {
		this.dbdate = dbdate;
	}
	public float getDbrate() {
		return dbrate;
	}
	public void setDbrate(float dbrate) {
		this.dbrate = dbrate;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public float getVcnt() {
		return vcnt;
	}
	public void setVcnt(float vcnt) {
		this.vcnt = vcnt;
	}
	public String getVrate() {
		return vrate;
	}
	public void setVrate(String vrate) {
		this.vrate = vrate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getShowseq() {
		return showseq;
	}
	public void setShowseq(String showseq) {
		this.showseq = showseq;
	}
	
	
}
