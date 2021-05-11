package com.pakmall.domain;

import lombok.Data;

@Data
public class OrderDetailListVO {

	// o.odr_code, p.pdt_num, o.odr_amount, o.odr_price, p.pdt_name, p.pdt_img
	
	private long odr_code;
	private long pdt_num;
	private int odr_amount;
	private int odr_price;
	
	private String pdt_name;
	private String pdt_img;
	
}
