package com.test.user.ticket;


public class UserShowRoundDTO {

	private String rseq;//회차seq
	private String rstartTime;//회차 시작시간!!
	private String rendTime;//회차 끝나는 시간!
	private String showSeq;//공연번호
	private String delflag;//삭제여부
	
	public String getRseq() {
		return rseq;
	}
	public void setRseq(String rseq) {
		this.rseq = rseq;
	}
	public String getRstartTime() {
		return rstartTime;
	}
	public void setRstartTime(String rstartTime) {
		this.rstartTime = rstartTime;
	}
	public String getRendTime() {
		return rendTime;
	}
	public void setRendTime(String rendTime) {
		this.rendTime = rendTime;
	}
	public String getShowSeq() {
		return showSeq;
	}
	public void setShowSeq(String showSeq) {
		this.showSeq = showSeq;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	
	
}
