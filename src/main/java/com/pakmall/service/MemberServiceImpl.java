package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.pakmall.domain.MemberVO;
import com.pakmall.domain.UserInfoVO;
import com.pakmall.dto.LoginDTO;
import com.pakmall.mapper.MemberMapper;

import lombok.Setter;


@Service // bean name : memberServiceImpl
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public int checkIdDuplicate(String memb_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.checkIdDuplicate(memb_id);
	}

	@Override
	public MemberVO login_ok(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login_ok(dto);
	}
	
	@Override
	public void join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.join(vo);
	}

	@Override
	public MemberVO member_info(String memb_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.member_info(memb_id);
	}

	@Override
	public boolean modifyPOST(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyPOST(vo) == 1;
	}

	@Override
	public MemberVO find_pwd(String memb_id, String memb_name) throws Exception {
		// TODO Auto-generated method stub
		return mapper.find_pwd(memb_id, memb_name);
	}

	@Override
	public String find_id(String memb_name) throws Exception {
		// TODO Auto-generated method stub
		return mapper.find_id(memb_name);
	}

	@Override
	public void member_delete(String memb_id) throws Exception {
		// TODO Auto-generated method stub
		mapper.member_delete(memb_id);
	}

	@Override
	public List<UserInfoVO> userinfo_list() throws Exception {
		// TODO Auto-generated method stub
		return mapper.userinfo_list();
	}

	@Override
	public void pw_search(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		mapper.pw_search(dto);
	}

	@Override
	public int updatePOST(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updatePOST(vo);
	}

	

	

	
	

}
