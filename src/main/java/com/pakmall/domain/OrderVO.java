package com.pakmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderVO {

	//odr_code, mem_id, odr_name, odr_zipcode, odr_addr, odr_addr_d, odr_phone, odr_total_price, odr_date
	
	private long odr_code; // 시퀀스로 처리
	private String mem_id; // 세션정보에서 참조
	private String odr_name;
	private String odr_zipcode;
	private String odr_addr;
	private String odr_addr_d;
	private String odr_phone;
	private int odr_total_price;
	private Date odr_date; // DB(default-sysdate)
}
