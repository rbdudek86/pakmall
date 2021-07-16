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

	

	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 100px;">
	<div class="row" >
		<div class="col-lg-12">
			<form id="searchForm" action="/admin/order/order_list" method="get">
				<select name="type" id="type">
					<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
					<option value="N" <c:out value="${pageMaker.cri.type == 'N' ? 'selected':'' }" />>상품명</option>
					<option value="D" <c:out value="${pageMaker.cri.type == 'D' ? 'selected':'' }" />>상품설명</option>
					<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>상품회사</option>
					<option value="ND" <c:out value="${pageMaker.cri.type == 'ND' ? 'selected':'' }" />>상품명 or 상품설명</option>
					<option value="NC" <c:out value="${pageMaker.cri.type == 'NC' ? 'selected':'' }" />>상품명 or 상품회사</option>
					<option value="NDC" <c:out value="${pageMaker.cri.type == 'NDC' ? 'selected':'' }" />>상품명 or 내용 or 상품회사</option>
				</select>
				<input type="text" name="keyword" value="${ pageMaker.cri.keyword}">
				<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${ pageMaker.cri.amount}">
				<button id="btnSearch" type="button" class="btn btn-primary">검색</button>
				<!-- Criteria로 보냄 -->
				
			</form>
		</div>
	</div>
		
		<div class="col-12">
			<form action="/lotto/lotto_list" method="get" >
				<div class="panel-heading text-right">
					<button id="btn_lotto_insert" type="button" class="btn btn-primary pull-right">입력</button>	
					<button id="btn_lotto_list" type="submit" class="btn btn-primary pull-right">조회</button>
				</div>
			</form>
			<table class="table table-striped">
				<thead>
				    <tr>
				      <th scope="col">회차</th>
				      <th scope="col">1</th>
				      <th scope="col">2</th>
				      <th scope="col">3</th>
				      <th scope="col">4</th>
				      <th scope="col">5</th>
				      <th scope="col">6</th>
				      <th scope="col">보너스</th>
				      <th scope="col">날짜</th>
				    </tr>
				</thead>
				<tbody>
					<%-- 데이터가 존재하지 않는 경우 --%>
					<c:if test="${empty lottoList }">
				  	<tr>
				  		<td colspan="5"><p style="color:red;">데이터가 없습니다.</p></td>
				  	</tr>
				  	</c:if>
				  	<c:forEach items="${lottoList}" var="lottoList">
					<tr onclick="javascript:fn_detail('${lottoList.seq}');" style="cursor:pointer;">
						<td>${lottoList.seq}</td>
						<td>${lottoList.num1}</td>
						<td>${lottoList.num2}</td>
						<td>${lottoList.num3}</td>
						<td>${lottoList.num4}</td>
						<td>${lottoList.num5}</td>
						<td>${lottoList.num6}</td>
						<td>${lottoList.b_num}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${lottoList.reg_date}"/></td>
					</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="row">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
				    <li class="page-item">
				      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1">Prev</a>
				    </li>
			    </c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
						<a href="${num }" class="page-link" >${num }</a>
					</li>				
				</c:forEach>
				 <c:if test="${pageMaker.next }">
				    <li class="page-item">
				      <a href="${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
				    </li>
			    </c:if>
			</ul>
			<hr>
			${pageMaker }
		</div>
		<form id="actionForm" action="/lotto/lotto_list" method="get">
			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'>
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'>
		</form>
	
	</main>
	<!-- /.container -->

</body>
<script>
function fn_detail(seq){
	// 방법1
	
	
	// 방법2 ajax
	location.href = "/lotto/lotto_detail2?seq=" + seq;
	
}

$(document).ready(function(){
	
	// 입력폼으로 이동
	$("#btn_lotto_insert").on("click",function(){
		
		location.href = "/lotto/lotto_insert";
		
	});

});
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
	
});
</script>

</html>