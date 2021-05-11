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

<script>
    var message = '${status}';

    if(message == 'loginSuccess'){
        alert('로그인이 되었습니다.');
    }else if(message == 'loginIDFail'){
        alert('아이디가 틀립니다.');
    }else if(message == 'loginPWFail'){
        alert('비밀번호가 틀립니다.');
    }else if(message == 'logout'){
        alert('로그아웃 되었습니다.');
    }else if(message == 'modifySuccess'){
        alert('회원 수정이 되었습니다.');
    }else if(message == 'regdelete'){
        alert('회원삭제가 되었습니다.');
    }
	</script>
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
<script>
	$(document).ready(function(){
		$("button[name='btnCartDel']").on("click", function(){
			//console.log("장바구니 삭제");
			
			var cart_code = $(this).attr("data-cart_code");
			
			var cart_tr = $(this).parents("tr");

			var cart_price = cart_tr.find("td[data-price]").attr("data-price");

			console.log(cart_price);

			var sum_price = $("div#sum_price td[data-sum]").attr("data-sum");

			console.log(sum_price);
			
			$.ajax({
					url: '/cart/delete',
					type: 'post',
					dataType: 'text',  //  '/member/checkIdDuplicate'주소에서 넘어오는 리턴값의 형식
					data: {cart_code : cart_code},  // javasciprt object 표현구문.www.w3school.com 참고
					success : function(data){
						if(data== 'SUCCESS'){
							
							//삭제 후 페이지 다시 불러오는 방법
							//location.href = "/cart/cart_list";
							alert("장바구니 상품: " + cart_code + "삭제되었습니다.");
							//행을 화면에서 제거
							cart_tr.remove();

							//합계 계산
							//총금액(삭제 후 총금액) - 삭제행 금액 = 삭제 후 총금액
							sum_price = parseInt(sum_price) - parseInt(cart_price) // JS형변환
							$("div#sum_price td[data-sum]").attr("data-sum",sum_price); //삭제시 값의 변경이 지속적으로 처리해야 한다.
							$("div#sum_price td[data-sum]").text(sum_price);
						} 
					}
				});	
			
		});

		// 수량텍스트박스 변경 이벤트 작업
		$("input[name='cart_amount']").on("change", function(){
			
			console.log("수량변경");
		});

		// 작업2> 수량변경 수정버튼 클릭시
		// <button type="button" name="btnCartEdit"
		$("button[name='btnCartEdit']").on("click",function(){

			console.log("수량변경버튼");

			// 주요 파라미터 : 장바구니코드, 변경된 수량 
			var cart_code = $(this).attr("data-cart_code");

			var cart_amount = $(this).siblings("input[name='cart_amount']").val(); //cart_tr.find("input[name=[name='cart_amount']");
			console.log(cart_code);
			console.log(cart_amount);
			var cart_tr = $(this).parents("tr");
			
			// 그 다음 작업 직접 처리 AJAX로...
			$.ajax({
					url: '/cart/cart_amount_update',
					type: 'post',
					data: {cart_code : cart_code, cart_amount : cart_amount},  // javasciprt object 표현구문.www.w3school.com 참고
					dataType: "text",
					success : function(data){
						if(data== 'SUCCESS'){
							alert("수량이 변경되었습니다.");
						
						} 
					}
				});	


		});

		// 작업3> 장바구니 비우기
		// 페이지 하단 [비우기] 버튼 생성 후 작업
		$("button[name='btn_cart_clear']").on("click",function(){
			location.href = "/cart/cart_all_delete";
		});
		

		//주문하기 이동. 
		//<button name="btn_order"
		$("button[name='btn_order']").on("click",function(){
			location.href = "/order/order?type=2";
		});
		
		//btn_chk_order
		//선택상품 주문 <input type="button" name="cart_check" value="${cartList.cart_code}">
		$("button[name='btn_chk_order']").on("click", function(){
			//console.log($("input[name='cart_check']:checked").length);

			if($("input[name='cart_check']:checked").length == 0){
				alert("구매할 상품을 선택하세요.");
				return;
			}

			var result = confirm("선택한 상품을 구매하시겠습니까?");

			if(result){
				var checkArr = [];

				$("input[name='cart_check']:checked").each(function(){
					var cart_code = $(this).val();
					checkArr.push(cart_code);

				});

				$.ajax({
					url : "/cart/cart_check_order",
					type : "post",
					data : {checkArr : checkArr},
					dataType : "text",
					success : function(data){
						if(data == "SUCCESS"){

							location.href = "/order/order?type=2";
						}
					}
				});
			}
		});

		//장바구니 선택삭제 <input type="button" name="cart_check" value="${cartList.cart_code}">
		$("#btn_cart_check_del").on("click", function(){
			//console.log($("input[name='cart_check']:checked").length);

			if($("input[name='cart_check']:checked").length == 0){
				alert("삭제할 상품을 선택하세요.");
				return;
			}

			var result = confirm("선택한 상품을 삭제하시겠습니까?");

			if(result){
				var checkArr = [];

				$("input[name='cart_check']:checked").each(function(){
					var cart_code = $(this).val();
					checkArr.push(cart_code);

				});

				$.ajax({
					url : "/cart/cart_check_delete",
					type : "post",
					data : {checkArr : checkArr},
					dataType : "text",
					success : function(data){
						if(data == "SUCCESS"){
							alert("선택된 상품이 삭제되었습니다.");
							location.href = "/cart/cart_list";
						}
					}
				});
			}
		});

		// 제목행의 체크박스 선택시 전체선택
		$("#check_all").on("click", function(){
			$("input[name='cart_check']").prop("checked", this.checked);
		});

		// 데이터 행의 체크박스 클릭
		$("input[name='cart_check']").on("click", function(){
			//$("#check_all").prop("checked", false);
			if($("input[name='cart_check']:checked").length == $("input[name='cart_check']").length){
				$("#check_all").prop("checked", true);
			}else{
				$("#check_all").prop("checked", false);
			}
		});
	});

</script>

</body>
</html>