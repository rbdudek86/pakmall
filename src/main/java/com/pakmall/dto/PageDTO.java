package com.pakmall.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 리스트페이지에 페이징번호 출력작업.. [이전] 1 2 3 4 5 6 .... [다음]
@Getter
@Setter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private int cntPage = 5; // 현재 페이지에서 보여지는 페이지 수 (한블록당 보여줄 페이지 수)
	private boolean prev, next;
	
	private int total; // 총 게시글 수
	private Criteria cri; // 현재페이지번호, 게시물 출력개수
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)cntPage)) * cntPage; 
		// 한 화면에 출력될 페이지의 끝 번호
		// Math.ceil(cri.getPageNum() / 10.0) 의미 ? 현재페이지에서 보여지는 endPage값을 고정해 주기 위해
		
		this.startPage = (this.endPage - cntPage) + 1;
		
		int realEnd = (int)(Math.ceil(total / (double)cri.getAmount())); // 총 페이지 수
		// int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount())); // 총 페이지 수
		// int realEnd = (int)(Math.ceil((double)total / cri.getAmount())); // 총 페이지 수
		
		if(realEnd <= this.endPage) this.endPage = realEnd;
		// 만약 realEnd가 endPage보다 작거나 같으면 realEnd는 endPage로 합니다.
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
