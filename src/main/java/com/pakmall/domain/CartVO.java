package com.pakmall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor // 모든 파라미터로 생성자 메서드 만들어준다.
public class CartVO {

	private long cart_code;
	private long pdt_num;
	private String mem_id;
	private int cart_amount;
}
