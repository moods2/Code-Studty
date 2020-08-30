package com.test.object;

public class Book {
	
	private String title;
    private int price;
    private String author;
    private String publisher;
    private String pubYear = "2020";
    private String isbn;
    private int page;
    
    
    

//  제목 : 읽기/쓰기, 최대 50자 이내(한글, 영어, 숫자)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		
		//유효성 검사
		boolean result = false;
		
		if (title.length() > 50) {
			result = true;
		}
		
		for (int i=0; i<title.length(); i++) {
			char c = title.charAt(i);
			if ((c < '가' || c > '힣') 
				 && (c < 'A' || c > 'Z')
				 && (c < 'a' || c > 'z') 
				 && (c < '0' || c > '9')
				 && c != ' ') {
				result = true;
				break;
			}
		}
		
		if (!result) {
			this.title = title;
		}
	}
	
	
	
//  가격 : 읽기/쓰기, 0 ~ 1000000원
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		
		if (price >= 0 && price <= 1000000) {
			this.price = price;
		}
	}
	
	
	
	
	
//  저자 : 읽기/쓰기, 제한 없음
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	
	
	
//  출판사 : 쓰기 전용
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	
	
	
	
//  발행년도 : 읽기 전용(2020년)
	public String getPubYear() {
		return pubYear;
	}
	
	
	
	
	
	
//  ISBN : 읽기/쓰기
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
//	페이지수 : 읽기/쓰기, 1~무제한
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page > 0) {
			this.page = page;
		}
	}
    
    

}





