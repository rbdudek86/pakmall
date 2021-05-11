package com.pakmall.domain;

import lombok.Data;

@Data
public class CategoryVO {
	
	private String cg_code;		//2차 카테고리
	private String cg_code_prt; //1차 카테고리
	private String cg_name;
}
