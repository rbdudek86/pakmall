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
<title>글쓰기</title>

<!-- css file -->
<%@include file="/WEB-INF/views/common/config.jsp"%>
</head>
<body>
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	<h3>상품문의</h3>
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">

		<form action="/board/board_register" method="get" >
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" placeholder="제목입력">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea name="bd_content" class="form-control" id="bd_content" rows="5" placeholder="내용입력"></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">ID</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID">
		    
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</main>


</body>
</html>