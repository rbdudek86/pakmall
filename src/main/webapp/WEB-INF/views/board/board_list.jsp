<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 숫자,통화,날짜 통화 값 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>Board List</title>

<%@include file="/WEB-INF/views/common/config.jsp"%>

<meta name="theme-color" content="#563d7c">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>
<body>
	
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 100px;">
		<!-- 검색 -->
		<div class="row" >
			<div class="col-lg-12">
				<form id="searchForm" action="/board/board_list" method="get">
					<select style="width:170px; height:38px" name="type" id="type">
						<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
						<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }" />>제목</option>
						<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>내용</option>
						<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }" />>작성자</option>
						<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected':'' }" />>제목 or 내용</option>
						<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }" />>제목 or 작성자</option>
						<option value="TCW" <c:out value="${pageMaker.cri.type == 'TCW' ? 'selected':'' }" />>제목 or 내용 or 작성자</option>
					</select>
					<input style="height:38px;" type="text" name="keyword" value="${ pageMaker.cri.keyword}">
					<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${ pageMaker.cri.amount}">
					<button style="height:38px;" id="btnSearch" type="button" class="btn btn-primary">검색</button>
					<!-- Criteria로 보냄 -->
					
				</form>
			</div>
		</div>
		
		<div class="col-12">
			<form action="/board/board_register" method="get" >
				<div class="panel-heading text-right">
					<button id="btn_board_register" type="submit" class="btn btn-primary pull-right">글쓰기</button><br>
				</div>
			</form>
			<table class="table table-striped">
				<thead>
				    <tr>
				      <th scope="col" style="text-align: center;" class="col-1">글번호</th>
				      <th scope="col" style="text-align: center;" class="col-7">제목</th>
				      <th scope="col" style="text-align: center;" class="col-2">작성자</th>
				      <th scope="col" style="text-align: center;" class="col-2">작성일</th>
				    </tr>
				</thead>
				<tbody>
					<%-- 데이터가 존재하지 않는 경우 --%>
					<c:if test="${empty boardList }">
				  	<tr>
				  		<td colspan="5"><p style="color:red;">데이터가 없습니다.</p></td>
				  	</tr>
				  	</c:if>
				  	<c:forEach items="${boardList}" var="list">
					<tr onclick="javascript:fn_detail('${list.bd_num}');" style="cursor:pointer;">
						<td style="text-align: center;"><c:out value="${total - (list.rn - 1)}"></c:out></td>
						<td><c:out value="${list.bd_title}"></c:out></td>
						<td style="text-align: center;"><c:out value="${list.mem_id}"></c:out></td>
						<td style="text-align: center;"><fmt:formatDate pattern="yy/MM/dd" value="${list.bd_date_reg}"/></td>
					</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		
		
		<!-- 페이징 소스 2
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div> 
		
		<!-- 옵션선택 끝
		
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/board/board_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/board/board_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/board/board_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		-->
		
		 <!-- 페이징 표시 -->
		    <div class="row">
		    	<div class="col-lg-12">
		    			<div class="panel-footer">
		    			   <ul class="pagination">
		    			   <c:if test="${pageMaker.prev }">
							    <li class="page-item">
							      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1">Prev</a>
							    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="num">
						    	<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
						    		<a href="${num }" class="page-link" href="#">${num }</a>
						    	</li>
						    </c:forEach>
						    <c:if test="${pageMaker.next }">
							    <li class="page-item">
							      <a href="${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
							    </li>
						    </c:if>
						  </ul>
				
			    				<hr>
	    			</div>
		    	</div>
		    </div>
		     
	    <!-- 페이지번호클릭시, 수정클릭시, 삭제클릭시 상품코드정보 추가 -->
		    <form id="actionForm" action="/board/board_list" method="get">
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
				<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
			</form>
		
	
	</main>
	<!-- /.container -->

</body>
<script>
	<!-- 페이징 2
	function selChange(){
		var sel = document.getElementById('cntPerPage').value;
		location.href="/board/board_list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	-->
</script>

<script>
function fn_detail(bd_num) {
	
			
	// 방법2
		location.href = "/board/board_detail2?bd_num=" + bd_num;
			
	// 방법1
	//location.href = "/board/board_detail?bd_num=" + bd_num;


}

</script>
<script>
$(document).ready(function(){

	// 페이징 번호 클릭
 	var actionForm = $("#actionForm");

	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));			
		actionForm.submit();

	});
	
	// 검색버튼 클릭 
	var searchForm = $("#searchForm");

	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력하세요");
			return false;
		}

		searchForm.find("input[name='pageNum']").val("1");

		searchForm.submit();

	});
});
</script>


</html>