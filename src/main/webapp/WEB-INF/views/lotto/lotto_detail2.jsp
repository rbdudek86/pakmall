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
<title>Lotto</title>

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
					
					<tr>
						<td><input type="hidden" id="seq" value="${seq }">${seq }</td>
						<td><input id="num1"></td>
						<td><input id="num2"></td>
						<td><input id="num3"></td>
						<td><input id="num4"></td>
						<td><input id="num5"></td>
						<td><input id="num6"></td>
						<td><input id="b_num"></td>
						<td><input id="reg_date"></td>
					</tr>

				</tbody>
			</table>
			<form action="/lotto/lotto_list" method="get" >
				<div class="">
					<button id="btn_lotto_list" type="submit" class="btn btn-primary pull-right">조회</button>
					<button id="btn_lotto_del" type="button" class="btn btn-danger">삭제</button>
				</div>
			</form>
		</div>
	
	</main>
	<!-- /.container -->

</body>
<script>
$(document).ready(function(){
	
	
	fn_detail('${seq}');
	
	// 삭제
	$("#btn_lotto_del").on("click",function(){
		var alert = confirm("정말 삭제 하시겠습니까?");
		
		$.ajax({
			url: '/lotto/lotto_del',
			type: 'POST',
			data: {seq: $("#seq").val()},
			dataType: 'text',
			success: function(data){
				if(data == "SUCCESS"){
					location.href = "/lotto/lotto_list";
				}else{
					alert("실패");
				}
			}
			
		});
	});
		
	
});

function fn_detail(seq){
	
	$.ajax({
		url : '/lotto/ajaxDetail',
		type : 'GET',
		data : {seq: $('#seq').val()},
		dataType : 'json',
		success : function(data){
			
			if(data != ""){
				$('#seq').val(data.seq);
				$('#num1').val(data.num1);
				$('#num2').val(data.num2);
				$('#num3').val(data.num3);
				$('#num4').val(data.num4);
				$('#num5').val(data.num5);
				$('#num6').val(data.num6);
				$('#b_num').val(data.b_num);
				$('#reg_date').val(data.reg_date);
			}else{
				alert("데이터가 없습니다.");
			}
		}
	});
}
</script>


</html>