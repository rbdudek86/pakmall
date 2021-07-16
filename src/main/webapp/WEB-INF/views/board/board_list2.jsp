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
	<main role="main" class="container-fluid" style="position: relative; left: 10px; top: 100px;">
		<textarea style="width:600px;" class="DOC_TEXT" name="DOC_TEXT" placeholder="선택하신 서류사항 항목에 대한 내용을 200자 이내로 기재해주세요."></textarea>
		<br />
		<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>


<!-- 페이징 표시 -->
	 <div class="row">
	 	<div class="col-lg-12">
	 			<div class="panel-footer">
	 			   <ul class="pagination">
	 			   <c:if test="true">
			    		<li class="page-item">
			      		<a href="0" class="page-link" href="#" tabindex="-1">Prev</a>
			    	</li>
		    </c:if>
		    <c:forEach begin="1" end="15" var="num">
		    	<li class="page-item" active:1>
		    		<a href="1" class="page-link" href="#">1</a>
		    	</li>
		    </c:forEach>
		    <c:if test="true">
			    <li class="page-item">
			      <a href="16" class="page-link" href="#">Next</a>
			    </li>
		    </c:if>
		  </ul>
	
	  				<hr>
			</div>
	 	</div>
	 </div>
	<!-- /.container -->

</body>


<Script>
//서류사항 textarea 체크
$('.DOC_TEXT').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

    if (content.length > 200){
        alert("최대 200자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 200));
        $('#counter').html("(200 / 최대 200자)");
    }
});
</Script>

</html>