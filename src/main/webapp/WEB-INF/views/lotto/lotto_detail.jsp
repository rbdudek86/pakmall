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
		<div class="col-12">
			<form action="/lotto/lotto_list" method="get" >
				<div class="panel-heading text-right">
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
					<tr onclick="javascript:fn_detail('${lottoList.seq}');">
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
	
	</main>
	<!-- /.container -->

</body>



</html>