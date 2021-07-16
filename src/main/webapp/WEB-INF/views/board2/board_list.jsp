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
<title>Board List2</title>

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
		<div class="col-12">
			<table id="boardList" class="table table-striped">
				<thead>
				    <tr>
				      <th scope="col"><input type="checkbox"></th>
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">내용</th>
				      <th scope="col">작성자</th>
				      <th scope="col">일시</th>
				    </tr>
				</thead>
				<tbody>
					<%-- 데이터가 존재하지 않는 경우 --%>
				  	<c:if test="${empty boardList }">
					  	<tr>
					  		<td scope="col"><p style="color:red;">데이터가 없습니다.</p></td>
					  	</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<form action="/board2/board_insert" method="get" >
			<div>
				<button id="btn_board_list" type="button" class="btn btn-primary pull-right">조회</button>
				<button id="btn_board_insert" type="submit" class="btn btn-primary pull-right">글쓰기</button>
				<button id="btn_board_update" type="button" class="btn btn-primary pull-right">수정</button>
			</div>
		</form>
	
	</main>
	<!-- /.container -->

</body>
<script>
$(document).ready(function(){

	
	$.ajax({
		url : '/board2/board_list_ajax',
		type : 'post',
		dataType : 'text',
		success : function(data){
			
			alert(data);
			
		}
		
	});
	
	
	$("#btn_board_list").on("click",function(){
		alert();
		
		location.href = "/board2/board_list";
	});
});
</script>

</html>