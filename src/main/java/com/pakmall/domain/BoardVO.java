package com.pakmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private long bd_num;
	private String bd_title;
	private String bd_content;
	private String mem_id;
	private Date bd_date_reg;
}
