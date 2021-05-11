package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.CategoryVO;
import com.pakmall.domain.ProductVO;
import com.pakmall.dto.Criteria;

public interface AdProductMapper {
	
	// 1차 카테고리 
	public List<CategoryVO> getCategoryList() throws Exception;

	// 2차 카테고리
	public List<CategoryVO> getSubCategoryList(String cg_code) throws Exception;
	
	// 상품등록
	public void product_insert(ProductVO vo) throws Exception;
	
	// 상품리스트
	public List<ProductVO> product_list(Criteria cri) throws Exception;
	
	// 상품개수(페이징기능에 사용)
	public int getTotalCountProduct(Criteria cri) throws Exception;
	
	// 상품수정폼
	public ProductVO product_modify(Long pdt_num) throws Exception;
	
	// 상품수정하기
	public void product_modifyOK(ProductVO vo) throws Exception;
	
	// 상품삭제하기
	public void product_deleteOK(long pdt_num) throws Exception;

	
}
