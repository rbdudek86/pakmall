package com.pakmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;

import com.pakmall.domain.CartVO;
import com.pakmall.domain.CartVOList;
import com.pakmall.dto.CartDTO;

public interface CartService {

	public void add_cart(CartVO vo) throws Exception;
	
	// 로그인 회원ID에 해당하는 장바구니 목록 보기
	public List<CartVOList> list_cart(String mem_id) throws Exception;
	
	public void cartAll_delete(String mem_id) throws Exception;
	
	public void cart_amount_update(int cart_code, int cart_amount) throws Exception;

	public void cart_check_delete(List<Integer> checkArr) throws Exception;
	
	public List<CartDTO> cart_money() throws Exception;
	
	public JSONObject getChartData();
	
	public void cart_not_check_delete(List<Integer> checkArr) throws Exception;
}
