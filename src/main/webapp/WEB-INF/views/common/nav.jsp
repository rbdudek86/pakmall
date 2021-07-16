<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top ">

	  <!--  <a class="navbar-brand" href="#">PakMall</a>  -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <!-- 인증 전 표시 -->
      <c:if test="${sessionScope.loginStatus == null}">
      <li class="nav-item">
        <a class="nav-link" href="/member/login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/join">Join</a>
      </li>
      </c:if>
      <!-- 인증 후 표시 -->
      <c:if test="${sessionScope.loginStatus != null}">
      <li class="nav-item">
        <a class="nav-link" href="/member/logout">LogOut</a>
      </li>
      <!-- 
      <li class="nav-item">
        <a class="nav-link" href="/member/modify">RegModify</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/delete">RegDelete</a>
      </li>
       -->
       <li class="nav-item">
        <a class="nav-link" href="/cart/cart_list">CartList</a>
      </li>
      <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MyPage</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="/member/modify">회원정보 수정</a>
	      <a class="dropdown-item" href="/member/pw_update">비밀번호 변경</a>
	      <div class="dropdown-divider"></div>
	      <button type="button" id="btn_member_delete" class="dropdown-item">회원탈퇴</button>
	    </div>
	  </li>
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">주문내역/배송조회</a>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="/member/order/order_list">주문내역</a>
	      <a class="dropdown-item" href="#">배송조회</a>
	     
	    </div>
	  </li>
      </c:if>
      
      <li class="nav-item">
        <a class="nav-link" href="/board/board_list">Board</a>
      </li>
      
     
      <!-- 
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
       
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      -->
    </ul>
	  </div>
	</nav>

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

    