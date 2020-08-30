package com.test.admin.working;

public class BoardDTO {

	private String seq; //번호
	private String title; //제목
	private String content; //내용
	private String regdate; //날짜
	private int nview; //조회수
	private String emseq; //직원번호
	private String delfalg; //
	private String getInputfile;	
	private String name; //이름
	private String id; //아이디
	
	
	
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
	public int getNview() {
		return nview;
	}
	public void setNview(int nview) {
		this.nview = nview;
	}
	public String getEmseq() {
		return emseq;
	}
	public void setEmseq(String emseq) {
		this.emseq = emseq;
	}
	public String getDelfalg() {
		return delfalg;
	}
	public void setDelfalg(String delfalg) {
		this.delfalg = delfalg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGetInputfile() {
		return getInputfile;
	}
	public void setGetInputfile(String getInputfile) {
		this.getInputfile = getInputfile;
	}
	
}
