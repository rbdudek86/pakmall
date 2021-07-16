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

	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 50px;">
		<form action="/lotto/lotto_insert" method="post" >
			<div class="w-50">
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
					    </tr>
					</thead>
					<tbody>
					
						<tr>
							<td><input id="seq" name="seq"></td>
							<td><input id="num1" name="num1"></td>
							<td><input id="num2" name="num2"></td>
							<td><input id="num3" name="num3"></td>
							<td><input id="num4" name="num4"></td>
							<td><input id="num5" name="num5"></td>
							<td><input id="num6" name="num6"></td>
							<td><input id="b_num" name="b_num"></td>
						</tr>
						
	
					</tbody>
				</table>
			</div>
			<div class="panel-heading">
				<button id="btn_lotto_insert" type="button" class="btn btn-primary">등록</button>
				<button id="btn_lotto_list" type="button" class="btn btn-primary">조회</button>
			</div>
		</form>
	
	</main>
	<!-- /.container -->

</body>
<script>
$(document).ready(function(){
	$("#btn_lotto_insert").on("click",function(){
		var alert = confirm("등록 하시겠습니까?");
	});
	
	$("#btn_lotto_list").on("click",function(){
		location.href = "/lotto/lotto_list"
	})
});
</script>

</html>