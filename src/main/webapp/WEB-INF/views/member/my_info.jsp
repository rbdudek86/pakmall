<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 숫자,통화,날짜 통화 값 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- JSTL - 함수태그(functions) -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>Study DocMall - Bootstrap v4.6</title>

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
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">
		
		<div class="row">
			
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" href="#">Active</a>
			  </li>
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">회원정보</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="/member/modify">회원정보 수정</a>
			      <a class="dropdown-item" href="/member/pw_update">비밀번호 변경</a>
			      <a class="dropdown-item" href="/member/delete">회원 탈퇴</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
			  </li>
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">주문내역/배송조회</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">주문내역</a>
			      <a class="dropdown-item" href="#">배송조회</a>
			      <a class="dropdown-item" href="#">Something else here</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link" href="#">1:1문의 게시판</a>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link" href="#">나의 상품후기</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">나의 상품문의</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">최근 본 상품목록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
			  </li>
			</ul>
		<div class="col-12">
			<div class="panel-heading text-right">
				<button id="btn_cart_check_del" type="button" class="btn btn-primary pull-right">선택삭제</button>
			</div>
			<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col"><input type="checkbox" name="checkbox" id="check_all"></th>
						      <th scope="col">번호</th>
						      <th scope="col">사진</th>
						      <th scope="col">상품명</th>
						      <th scope="col">수량</th>
						      <th scope="col">금액</th>
						      <th scope="col">배송비</th>
						      <th scope="col">취소</th>
						    </tr>
						  </thead>
						  <tbody>
						  <%-- 데이터가 존재하지 않는 경우 --%>
						  <c:if test="${empty cartVOList }">
						  <tr>
						  	<td colspan="7">
						  		<p style="color:red;">장바구니가 비워있습니다.</p>
						  	</td>
						  </tr>
						  </c:if>
						  
						  <c:set var="i" value="1" ></c:set>
						  <c:set var="price" value="0" ></c:set>
						  <c:forEach items="${cartVOList }" var="cartList">
						  	<c:set var="price" value="${cartList.pdt_price * cartList.cart_amount }"></c:set>
						    <tr>
						    <td>
						    	<input type="checkbox" name="cart_check" value="${cartList.cart_code }">
						    </td>
						      <th scope="row">${i }</th>
							      <td>
							      	<img src="/cart/displayFile?fileName=${cartList.pdt_img }">
							      </td>
							      <td>
								  	<c:out value="${cartList.pdt_name }"></c:out>
								  </td>
								  <td>
								  	 <input type="number" name="cart_amount" value="<c:out value='${cartList.cart_amount }'></c:out>">
								  	 <button type="button" name="btnCartEdit" data-cart_code="${cartList.cart_code }" class="btn btn-link">Edit</button>
								  </td>
							      <td data-price="${price}">
							      	<fmt:formatNumber type="currency" value="${price}"></fmt:formatNumber>
							      </td>
								  <td>[기본배송조건]</td>
								  <td>
								  	<button type="button" name="btnCartDel" data-cart_code="${cartList.cart_code }" class="btn btn-lin">Delete</button>
								  </td>
								  <td>
								  </td>
							    </tr>
							  <c:set var="i" value="${i+1 }" ></c:set>
							  <c:set var="sum" value="${sum + price }"></c:set>
						   </c:forEach>
						   
						   </tbody>
						</table>
						<div id="sum_price" class="panel-body">
						<table class="table table-striped" >
							<tr>
								<td>총 금액</td>
								<td data-sum="${sum}"><fmt:formatNumber type="currency" value="${sum}"></fmt:formatNumber></td>
								
							</tr>
						</table>
					</div>
					<div id="sum_price" class="panel-footer">
						<table class="table table-striped" >
							<tr>
								<td>
									<button name="btn_cart_clear" type="button" class="btn btn-link">장바구니 비우기</button>
									<button name="btn_order" type="button" class="btn btn-link">전체상품 주문</button>
									<button name="btn_chk_order" type="button" class="btn btn-link">선택상품 주문</button>
								</td>
								
							</tr>
						</table>
					</div>		
			</div>
		</div>
		

	</main>
	<!-- /.container -->


</body>
</html>