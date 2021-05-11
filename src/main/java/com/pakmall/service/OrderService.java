package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.OrderDetailListVO;
import com.pakmall.domain.OrderDetailVO;
import com.pakmall.domain.OrderVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.OrderSaleDTO;

public interface OrderService {
	
	public void order_buy(OrderVO vo, String mem_id) throws Exception;

	public void orderDirect_buy(OrderVO vo, OrderDetailVO vo2) throws Exception;
	
	// 상품리스트
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception;
		
	// 상품개수(페이징기능에 사용)
	public int getTotalCountOrder(Criteria cri) throws Exception;
	
	public List<OrderDetailListVO> order_detail_list(long odr_code) throws Exception;
	
	public  List<OrderSaleDTO> order_sale(String startDate, String endDate) throws Exception;
}
