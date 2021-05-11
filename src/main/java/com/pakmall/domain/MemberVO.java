package com.pakmall.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memb_id;
	private String memb_pw;
	private String memb_pwck;
	private String memb_name;
	private String memb_phone;
	private String memb_email;
	private String memb_zip;
	private String memb_addr1;
	private String memb_addr2;
	private String mem_authcode;
	//MEM_AUTHCODE
	private String membId;
	private String memb_pw1; //신규 비번
	private String memb_pw2; // 신규 비번 확인
	
}
