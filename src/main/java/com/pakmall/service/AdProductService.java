package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.CategoryVO;
import com.pakmall.domain.ProductVO;
import com.pakmall.dto.Criteria;

public interface AdProductService {

	
	public List<CategoryVO> getCategoryList() throws Exception;

	public List<CategoryVO> getSubCategoryList(String cg_code_prt) throws Exception;
	
	public void product_insert(ProductVO vo) throws Exception;
	
	public List<ProductVO> product_list(Criteria cri) throws Exception;
	
	public int getTotalCountProduct(Criteria cri) throws Exception;
	
	//상품수정폼
	public ProductVO product_modify(Long pdt_num) throws Exception;
	
	//상품 수정하기
	public void product_modify(ProductVO vo) throws Exception;
	
	//상품삭제하기
	public void product_delete(long pdt_num) throws Exception;
}
