package com.test.atticket;
//유저 객체 정보
public class UserDTO {

	private int seq;//회원번호
	private String name;//회원이름
	private String ssn;//회원 주민번호
	private String id;//회원 아이디
	private String pw;//회원 비밀번호
	private int eggMoney;//회원 에그머니
	private String addr;//회원 주소
	private String tel;//회원 전화번호
	private String email;//회원 이메일번호
	private String grade;//회원등급
	private int delflag;//탈퇴한 회원유무 확인

	
	
	
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getEggMoney() {
		return eggMoney;
	}
	public void setEggMoney(int eggMoney) {
		this.eggMoney = eggMoney;
	}
	public int getDelflag() {
		return delflag;
	}
	public void setDelflag(int delflag) {
		this.delflag = delflag;
	}
	
	
	
}
