<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>Board</title>

<!-- css file -->
<%@include file="/WEB-INF/views/common/config.jsp"%>

</head>
<body>
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">

		<form style="padding:50px 30px">
		<h3>상품문의</h3><br>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" placeholder="제목입력">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content" name="bd_content" rows="5" placeholder="내용입력"></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">ID</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID">
		    
		  </div>
		  
		  <button type="button" id="btn_board_register" class="btn btn-primary">등록</button>
		  <button type="button" id="btn_board_list" class="btn btn-danger">취소</button>
		</form>

	</main>
</body>

<script>
	$(document).ready(function(){
		
		$("#btn_board_list").on("click", function(){
			location.href = "/board/board_list";
		});
		
		
	    $("#btn_board_register").on("click", function(){
	        
	        var alert = confirm("등록 하시겠습니까?");
	
	        $.ajax({
	            url: '/board/board_register',
	            type: 'POST',
	            data: {bd_title : $("#bd_title").val(), bd_content : $("#bd_content").val(), mem_id : $("#mem_id").val()},
	            dataType : 'text',
	            success : function(data) {
	
	                if(data == "SUCCESS"){
	                   
	                	// 리스트 페이지 이동
	                    location.href = "/board/board_list";
	                }else {
	                    alert("다시 입력해 주세요.");
	                }
	            }
	
	        });
	    });
	
	});

</script>


</html>