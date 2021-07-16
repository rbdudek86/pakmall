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
<title>Board2</title>

<!-- css file -->
<%@include file="/WEB-INF/views/common/config.jsp"%>

</head>
<body>
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 10px;">

		<form style="padding:50px 30px">
		<h3>글쓰기</h3><br>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title2" name="bd_title2" placeholder="제목입력">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content2" name="bd_content2" rows="5" placeholder="내용입력"></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Writer</label>
		    <input type="text" class="form-control" id="bd_writer" name="bd_writer" placeholder="작성자">
		    
		  </div>
		  
		  <button type="button" id="btn_board_insert" class="btn btn-primary">등록</button>
		  <button type="button" id="btn_board_list" class="btn btn-danger">취소</button>
		</form>

	</main>
</body>

<script>
$(document).ready(function(){
	$("#btn_board_insert").on("click",function(){
		$.ajax({
			url : '/board2/board_insert',
			type : 'post',
			data : {bd_title2 : $("#bd_title2").val(), bd_content2 : $("#bd_content2").val(), bd_writer : $("#bd_writer").val()},
			dataType : 'text',
			success : function(data){
				if(data == 'SUCCESS'){
					location.href = "/board2/board_insert";
				}else{
					alert();
				}
			}
			
		});
		
	});
	
	$("#btn_board_list").on("click",function(){
		
		var alert = confirm("취소 하시겠습니까?");
		
		location.href = "/board2/board_list";
	});
});
</script>


</html>