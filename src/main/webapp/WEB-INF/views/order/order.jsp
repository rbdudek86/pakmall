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
			<div class="col-2">
				<!-- 카테고리 메뉴 -->

				<%@include file="/WEB-INF/views/common/category_list.jsp"%>

			</div>
		<div class="col-10">
			
			<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">사진</th>
						      <th scope="col">상품명</th>
						      <th scope="col">수량</th>
						      <th scope="col">금액</th>
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
						      <th scope="row">${i }</th>
							      <td>
							      	<img src="/order/displayFile?fileName=${cartList.pdt_img }">
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
							    </tr>
							  <c:set var="i" value="${i+1 }" ></c:set>
							  <c:set var="sum" value="${sum + price }"></c:set>
						   </c:forEach>
						   
					   </tbody>
				</table>
				<div id="sum_price" class="panel-body">
		  			<table class="table table-striped">
		  				<tr>
		  					<td>총 금액</td>
		  					<td>
		  						<fmt:formatNumber type="currency" value="${sum}"></fmt:formatNumber>
		  						
	  						</td>
									  					
		  				</tr>
		  			 </table>
		  		</div>
		
			
			
						
				<!-- 주문자 정보 -->
				<div class="panel panel-default">
	  				<div class="panel-body">			
						
							<h3>주문자정보</h3>
							

							<!-- 이름 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="inputName" >이름</label>
								<div class="col-md">
									<input id="odr_name" name="odr_name" type="text" placeholder="Name" value="${sessionScope.loginStatus.memb_name }"
										class="form-control input-md" required="" style="max-width:600px;">
									<input type="hidden" name="type" value="">
								</div>
							</div>
							<!-- 주소 -->
							<div class="form-group">
								<label class="col-md-4 control-label"  for="address">주소</label>
								<div class="col-md">
									<input type="text" id="odr_zipcode" name="odr_zipcode"placeholder="우편번호" value="${sessionScope.loginStatus.memb_zip }">
									<input type="button" onclick="sample2_execDaumPostcode()"
										value="우편번호 찾기"><br> 
									<input type="text" id="odr_addr" name="odr_addr" placeholder="주소" value="${sessionScope.loginStatus.memb_addr1 }"><br> 
									<input type="text" id="odr_addr_d" name="odr_addr_d" placeholder="상세주소" value="${sessionScope.loginStatus.memb_addr2 }">
									<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
								</div>
							<!-- 휴대폰 번호 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="mobilenumber">휴대폰 번호</label>
								<div class="col-md">
									<input id="odr_phone" name="odr_phone" type="text"
										placeholder="Mobile Number" class="form-control input-md"
										required="" value="${sessionScope.loginStatus.memb_phone }" style="max-width:600px;">

									</div>
								</div>
								<!-- 이메일 -->
								<!-- 
								<div class="form-group">
									<label class="col-md-4 control-label" for="InputEmail">이메일</label>
									<div class="col-md">
										<input id="memb_email" name="memb_email" type="email"
											placeholder="user@domain.com" class="form-control input-md">
										<button id="btn_sendAuthCode" class="btn btn-default" type="button" >이메일 인증</button>
										<p id="authcode_status" style="color: red;"></p>
									</div>
									 -->
									
									
								<!-- 배송정보 -->	
								<h3>배송정보</h3>
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <div class="input-group-text">
								      <input type="checkbox" aria-label="Checkbox for following text input">
								    </div>
								  </div>
								  주문고객 정보와 동일
							</div>
								<form id="orderForm" action="/order/order_buy" method="post">		
								<div class="panel panel-default">
								
							<input type="hidden" name="pdt_num" value="${pdt_num }">
							<input type="hidden" name="odr_amount" value="${odr_amount }">
							<input type="hidden" name="odr_price" value="${odr_price }">
								
								
								
								
			  				<div class="panel-body">			
							<form id="orderForm" action="#" method="post">
											
							
							<!-- 이름 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="inputName" >이름</label>
								<div class="col-md">
									<input id="odr_name" name="odr_name" type="text" placeholder="Name" value="${sessionScope.loginStatus.memb_name }"
										class="form-control input-md" required="" style="max-width:600px;">
									<input type="hidden" name="type" value="${type }">
								</div>
							</div>
							<!-- 주소 -->
							<div class="form-group">
								<label class="col-md-4 control-label"  for="address">주소</label>
								<div class="col-md">
									<input type="text" id="odr_zipcode" name="odr_zipcode"placeholder="우편번호" value="${sessionScope.loginStatus.memb_zip }">
									<input type="button" onclick="sample2_execDaumPostcode()"
										value="우편번호 찾기"><br> 
									<input type="text" id="odr_addr" name="odr_addr" placeholder="주소" value="${sessionScope.loginStatus.memb_addr1 }"><br> 
									<input type="text" id="odr_addr_d" name="odr_addr_d" placeholder="상세주소" value="${sessionScope.loginStatus.memb_addr2 }">
									<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
								</div>
							<!-- 휴대폰 번호 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="mobilenumber">휴대폰 번호</label>
								<div class="col-md">
									<input id="odr_phone" name="odr_phone" type="text"
										placeholder="Mobile Number" class="form-control input-md"
										required="" value="${sessionScope.loginStatus.memb_phone }" style="max-width:600px;">
									<input type="hidden" name="odr_total_price" value="${sum} "/>
									</div>
								</div>
									 
								<div class="form-group text-center">
									<button type="submit" id="btn_submit" class="btn btn-primary">
										구매하기
									</button>
									<button type="button" id="btn_cancle" class="btn btn-warning">
										구매취소
									</button>
								</div>
																
						</form>
						
<!-- 주소찾기 daum api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function sample2_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample2_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample2_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('memb_zip').value = data.zonecode;
						document.getElementById("memb_addr1").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("memb_addr2")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
</script>
					</div>
				
				</div>
						
			</div>
		</div>
		

	</main>
	<!-- /.container -->
<script>
	$(document).ready(function(){
		
	});

</script>

</body>
</html>