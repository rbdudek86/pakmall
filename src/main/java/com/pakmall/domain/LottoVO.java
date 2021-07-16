package com.pakmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LottoVO {
	// seq, num1, num2, num3, num4, num5, num6, b_num, reg_date
	private String seq;
	private String num1;
	private String num2;
	private String num3;
	private String num4;
	private String num5;
	private String num6;
	private String b_num;
	private Date reg_date;
}
