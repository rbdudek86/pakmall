package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pakmall.domain.OrderDetailListVO;
import com.pakmall.domain.OrderDetailVO;
import com.pakmall.domain.OrderVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.OrderSaleDTO;
import com.pakmall.mapper.CartMapper;
import com.pakmall.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService{

	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;
	
	// bean 주입
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	@Transactional
	@Override
	public void order_buy(OrderVO vo, String memb_id) throws Exception {
		// TODO Auto-generated method stub
		
		orderMapper.order_add(vo);
		orderMapper.orderDetail_add(vo.getOdr_code(), memb_id); // 동시성 보장
		cartMapper.cartAll_delete(memb_id);
	
	}
	@Transactional
	@Override
	public void orderDirect_buy(OrderVO vo, OrderDetailVO vo2) throws Exception {
		// TODO Auto-generated method stub
		orderMapper.order_add(vo); // 파라미터가 참조형(주소)으로 전달되기 때문에
		vo2.setOdr_code(vo.getOdr_code());
		orderMapper.orderDirect_add(vo2);
	}
	@Override
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.orderInfo_list(cri);
	}
	@Override
	public int getTotalCountOrder(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.getTotalCountOrder(cri);
	}
	@Override
	public List<OrderDetailListVO> order_detail_list(long odr_code) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.order_detail_list(odr_code);
	}
	@Override
	public List<OrderSaleDTO> order_sale(String startDate, String endDate) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.order_sale(startDate, endDate);
	}

	


}
