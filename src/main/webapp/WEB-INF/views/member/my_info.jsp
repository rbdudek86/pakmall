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
<title>PakMall</title>

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

	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	

</head>
<body>
		
	<main role="main" class="container-fluid" >
		
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
			      <div class="dropdown-divider"></div>
			     <!-- <a class="dropdown-item" href="/member/delete">회원 탈퇴</a>  -->
			      <button type="button" id="btn_member_delete" class="dropdown-item">회원탈퇴</button>
			    </div>
			  </li>
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">주문내역/배송조회</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="/member/order/order_list">주문내역</a>
			      <a class="dropdown-item" href="#">배송조회</a>
			      <!-- 
			      <a class="dropdown-item" href="#">Something else here</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			       -->
			    </div>
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
			  
			</ul>
		</div>
		

	</main>
	<!-- /.container -->


</body>

<script>
$(document).ready(function(){
	$("#btn_member_delete").on("click",function(){

		var result = confirm("정말 탈퇴하시겠습니까?");
		
		if(result){
			location.href="/member/delete";
		}else{
			location.href="/"
		}
		
	});
		
	
});
</script>
</html>