package com.pakmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderDetailVO {

	// odr_code, pdt_num, odr_amount, odr_price
	private long odr_code; // 
	private long pdt_num;
	private int odr_amount;
	private int odr_price;
}
