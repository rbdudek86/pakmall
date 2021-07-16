package com.pakmall.dto;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // 현재 페이지 // 페이지번호. 1  2  3  4  5
	private int amount; // 정한 수(상수) // 페이지당 글 개 수(예5)
	
	// 검색종류 
	// 검색방법? 
	// 1)단일항목검색 제목(T),내용(C),작성자(W)
	// 2)다중항목검색 제목(T),내용(C),작성자(W),제목+내용(TC), 제목+작성자(TW), 제목+내용+작성자(TCW)
	private String type; 
	private String keyword; // 검색어
	
	private String mem_id;
	private	String memb_id;
	
	private long bd_num; // 댓글 페이징
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/*
	public String getType() {
		return type;
	}
	*/
	
	public String[] getTypeArr() {
		
//		System.out.println("called getTypeArr");

		return type == null? new String[] {} : type.split("");
	}

	/*
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	*/
	
	
}
