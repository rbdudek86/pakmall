package com.pakmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private long bd_rno; //댓글번호
	private long bd_num; //글번호
	
	private String bd_reply;
	private String bd_reply_pw;
	private String bd_replyer;
	private Date bd_date_reply;
	
	private long rn;
}
