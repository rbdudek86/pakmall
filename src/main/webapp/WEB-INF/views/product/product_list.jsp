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
			<div class="card-deck mb-3 text-center">
				<c:forEach items="${productVOList}" var="productVO">
				    <div class="card mb-4 shadow-sm">
				      <div class="card-body">
				      	<a href="/product/product_read?pdt_num=${productVO.pdt_num}">
				        	<img src="/product/displayFile?fileName=${productVO.pdt_img}" />
				        </a>
				      	<br>
				      	<input type="hidden" name="pdt_num" value="${productVO.pdt_num }">
				      	<span><c:out value="${productVO.pdt_name }" /></span><br>
				      	<span><fmt:formatNumber type="currency" value="${productVO.pdt_price }"></fmt:formatNumber></span>
				      	<input type="number" style="width:50px;" name="odr_amount" value="1" > 개 <br>
				      	<input type="hidden" value="${productVO.pdt_amount }" id="pdt_amount" name="pdt_amount"> 
				      	<button type="button" name="btn_direct_buy" class="btn btn-link">즉시구매</button>
			      		<button type="button" name="btn_cart_add" class="btn btn-link">장바구니</button>
				      </div>
				    </div>
			    </c:forEach>
			    <form id="order_direct_form" method="get" action="/order/order">
            		<input type="hidden" name="type" value="1">
			    </form>
		  	</div>
		</div>
	</div>
	</main>
	<!-- /.container -->


</body>


<!-- 핸들바 사용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="subCGListTemplate" type="text/x-handlebars-template">
{{#each .}}
<li><a href="/product/product_list?cg_code={{cg_code}}">{{cg_name}}</a></li>
{{/each}}
</script>

<script>

var subCGList = function(subCGData, targetSubCategory, templateObject){

var template = Handlebars.compile(templateObject.html());
var subCGLi = template(subCGData);


$(".mainCategory .subCategory").empty();

targetSubCategory.find(".subCategory").append(subCGLi);
}

  $(document).ready(function() {

    $(".mainCategory").on("click", function(){

      var mainCategory = $(this);
      var cg_code = $(this).find("a").attr("data-code");
      var url = "/product/subCategoryList/" + cg_code;

      //alert(url);
      //1차카테고리를 참조하는 2차카테고리 정보 
      $.getJSON(url, function(data){
        subCGList(data, mainCategory, $("#subCGListTemplate"))

      });
    });


    // 즉시구매 클릭
    // <button type="button" name="btn_direct_buy"
    $("button[name='btn_direct_buy']").on("click", function(){

      console.log("즉시구매");

      //상품코드, 구매수량

      var pdt_num = $(this).parent().find("input[name='pdt_num']").val(); // <input type='hidden' name='pdt_num'
      var odr_amount = $(this).parent().find("input[name='odr_amount']").val(); //<input type="number" style="width:50px;" name="odr_amount"

      console.log("상품코드: " + pdt_num);
      console.log("구매수량: " + odr_amount);

      
      var order_direct_form = $("#order_direct_form");
      order_direct_form.append("<input type='hidden' name='pdt_num' value='" + pdt_num + "'>");
      order_direct_form.append("<input type='hidden' name='odr_amount' value='" + odr_amount + "'>");
      //return;
      
      order_direct_form.submit();

    });

  });
</script>

      <!-- 장바구니 클릭시 -->
<script>

    $(document).ready(function(){

      // <button type="button" name="btn_cart_add"
      $("button[name='btn_cart_add']").on("click", function(){
        console.log("장바구니");

      /*
        장바구니코드 : 시퀀스, 로그인ID(세션)
        상품코드,수량
      */
     // <input type="hidden" name="pdt_num"
      var pdt_num = $("input[name='pdt_num']").val();
      // <input type="number" style="width:50px;" name="odr_amount" value="1" > 개 <br>
      var pdt_amount = $("input[name='odr_amount']").val();


      $.ajax({
        url : "/cart/add",
        type: "post",
        data: {pdt_num : pdt_num, pdt_amount: pdt_amount },
        dataType : "text",
        success: function(data){
          if(data == "SUCCESS"){
            if(confirm("장바구니가 추가되었습니다. \n 확인 하시겠습니까?")){
              location.href = "/cart/cart_list";
            }
          }else if(data == "LoginRequired"){
        	  alert("로그인이 필요합니다.");
        	  location.href = "/member/login";
          }
        }
      });
        
      });
    });


  </script> 

</html>