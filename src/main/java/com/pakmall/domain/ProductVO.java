package com.pakmall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	private int		pdt_num;
	private String 	cg_code;  // 2차카테고리
	private String 	cg_code_prt; //  1차카테고리
	private String 	pdt_name;
	private int		pdt_price;
	private int 	pdt_discount;
	private String	pdt_company;
	private String	pdt_detail;
	private String	pdt_img;
	private int		pdt_amount;
	private String 	pdt_buy;
	private Date	pdt_date_sub;
	private Date	pdt_date_up;

	//파일첨부 파라미터 작업
	private MultipartFile file1;
}
