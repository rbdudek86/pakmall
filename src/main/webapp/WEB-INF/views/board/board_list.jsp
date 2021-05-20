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
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">
		<div class="col-12">
			<form action="/board/board_register" method="get" >
				<div class="panel-heading text-right">
					<button id="btn_board_register" type="submit" class="btn btn-primary pull-right">글쓰기</button>
				</div>
			</form>
			<table class="table table-striped">
				<thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">내용</th>
				      <th scope="col">아이디</th>
				      <th scope="col">일시</th>
				    </tr>
				</thead>
				<tbody>
					<%-- 데이터가 존재하지 않는 경우 --%>
					<c:if test="${empty boardList }">
				  	<tr>
				  		<td colspan="5"><p style="color:red;">데이터가 없습니다.</p></td>
				  	</tr>
				  	</c:if>
				  	<c:forEach items="${boardList}" var="boardList">
					<tr onclick="javascript:fn_detail('${boardList.bd_num}');">
						<td>${boardList.bd_num}</td>
						<td>${boardList.bd_title}</td>
						<td>${boardList.bd_content}</td>
						<td>${boardList.mem_id}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${boardList.bd_date_reg}"/></td>
					</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	
	</main>
	<!-- /.container -->

</body>
<script>
function fn_detail(bd_num) {
	
	
	// 방법1
	location.href = "/board/board_detail?bd_num=" + bd_num;

	// 방법2
	//location.href = "/board/board_detail2?bd_num=" + bd_num;

}
</script>

</html>