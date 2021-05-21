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
		<h3>Board</h3><br>
		  
		  <input type="hidden" id="bd_num" name="bd_num" value="${detail.bd_num }"/>
		
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" value="<c:out value="${detail.bd_title}"/>">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content" name="bd_content" rows="5"><c:out value="${detail.bd_content}"/></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">ID</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" value="<c:out value="${detail.mem_id}"/>">
		    
		  </div>
		  
		  <button type="button" id="btn_board_list" class="btn btn-primary">목록</button>
		  <button type="button" id="btn_board_update" class="btn btn-primary">수정</button>
		  <button type="button" id="btn_board_delete" class="btn btn-danger">삭제</button>
		  
		</form>

	</main>
</body>

<script>
	$(document).ready(function(){
		
		$("#btn_board_list").on("click", function(){
			location.href = "/board/board_list";
		});
		
		
	    $("#btn_board_update").on("click", function(){
	        
	        var alert = confirm("수정 하시겠습니까?");
	
	        $.ajax({
	            url: '/board/board_update',
	            type: 'POST',
	            data: {bd_num : $("#bd_num").val(), bd_title : $("#bd_title").val(), bd_content : $("#bd_content").val()},
	            dataType : 'text',
	            success : function(data) {
	
	                if(data == "SUCCESS"){
	                   
	                	// 리스트 페이지 이동
	                    location.href = "/board/board_list";
	                }else {
	                    alert("실패");
	                }
	            }
	
	        });
	    });
	    
	    $("#btn_board_delete").on("click", function(){
			
			var alert = confirm("정말 삭제 하시겠습니까?");
			
			$.ajax({
				url: '/board/board_delete',
				type: 'POST',
				data: {bd_num : $("#bd_num").val()},
				dataType: 'text',
				success: function(data){
					if(data == "SUCCESS"){
	                   
					   // 리스트 페이지 이동
					   location.href = "/board/board_list";
				   }else {
					   alert("실패");
				   }
				}
			});
			
		});
	
	});

</script>


</html>