package com.pakmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private long bd_num; //게시글 번호
	private String bd_title; //게시글 제목
	private String bd_content; //게시글 내용
	private String mem_id; //게시글 작성자
	private String mem_pw; //게시글 비밀번호
	private Date bd_date_reg; //게시글 작성일시
	private int bd_parent; //부모글 번호(원글 번호)
	private int bd_ref; //글 그룹 번호(원글(답글포함)에대한 순서)
	private int bd_layer; // 답글 계층
	private int bd_re_count; // 게시글 댓글 개수
	private String bd_show; // 게시글 삭제 상태 유무(y, n)
	
	
	private long rn;
	
	private int start;
	private int end;
	
	
}
