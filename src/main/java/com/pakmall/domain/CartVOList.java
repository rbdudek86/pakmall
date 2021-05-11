package com.pakmall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor // 파라미터를 이용한 생성자메서드 만들기
@NoArgsConstructor
public class CartVOList {

	// c.cart_code, p.pdt_img, p.pdt_name, c.cart_amount, p.pdt_price
	
	private long cart_code;
	private String pdt_img;
	private String pdt_name;
	private int cart_amount;
	private long pdt_price;
	
}
