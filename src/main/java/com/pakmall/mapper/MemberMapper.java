package com.pakmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pakmall.domain.MemberVO;
import com.pakmall.domain.UserInfoVO;
import com.pakmall.dto.LoginDTO;

public interface MemberMapper {

	// 아이디 중복체크
	public int checkIdDuplicate(String memb_id) throws Exception;
	
	// 로그인 인증
	public MemberVO login_ok(LoginDTO dto) throws Exception;
	
	//회원가입 저장
	public void join(MemberVO vo) throws Exception;
	
	// 회원수정 폼
	public MemberVO member_info(String memb_id) throws Exception;
	
	// 회원수정
	public int modifyPOST(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 : 메일전송
	public MemberVO find_pwd(@Param("memb_id") String memb_id,@Param("memb_name") String memb_name) throws Exception;

	// 아이디 찾기 : 화면출력
	public String find_id(String memb_name) throws Exception;
	
	// 회원 탈퇴
	public void member_delete(String memb_id) throws Exception;
	
	public List<UserInfoVO> userinfo_list() throws Exception;
	
	public void pw_search(LoginDTO dto) throws Exception;
	
	public int updatePOST(MemberVO vo) throws Exception;
	
}


