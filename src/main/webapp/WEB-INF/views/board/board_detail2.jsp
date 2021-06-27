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
<title>Board Detail</title>

<!-- css file -->
<%@include file="/WEB-INF/views/common/config.jsp"%>

</head>
<body>
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">
		<form style="padding:50px 30px" id="boardUpdateFrom" method="post" action="/board/board_update">
		
		<h3>No.${bd_num }</h3>
		  
		  <input type="text" id="bd_num" name="bd_num" value="${bd_num }"/>
		  <input type="text" id="mem_pw" name="mem_pw" value="${mem_pw }"/>
		
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" onkeyup="chkword(this, 30)">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content" name="bd_content" rows="5" onkeyup="chkword(this, 300)"></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Writer</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" onkeyup="chkword(this, 10)">
		    
		  </div>
		  
			  <button type="button" id="btn_board_list" class="btn btn-primary">목록</button>
			  <button type="button" id="btn_board_update" class="btn btn-primary">수정</button>
			  <button type="button" id="btn_board_delete" class="btn btn-danger">삭제</button>
		 
		</form>

	</main>
</body>

<script type="text/javascript">
	<!--입력 글자수 제한 -->
	function chkword(obj, maxByte){
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";
		
		for (var i = 0; i< strLen; i++){
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4){
				totalByte ++;
			} else {
				totalByte ++;
			}
			
			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
			
		}
		
		// 넘어가는 글자는 자른다.
		if (totalByte > maxByte){
			alert(maxByte + "자 까지 입력할 수 있습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}
</script>

<script>
	$(document).ready(function(){
		
		// 상세정보 ajax로 가져오기
		fn_detail('${bd_num}');
		
		$("#btn_board_list").on("click", function(){
			location.href = "/board/board_list";
		});
		
		// 수정 버튼 클릭
	    $("#btn_board_update").on("click", function(){
	        
	    	var form = $("#boardUpdateFrom");
	    
	        var result = confirm("수정 하시겠습니까?");
			if(result){
				
				var bd_title = $("#bd_title");
				var bd_content = $("#bd_content");
				var mem_id = $("#mem_id");
				
				
				if(bd_title.val()==null || bd_title.val()==""){
					alert("제목 입력하세요.");
					bd_title.focus();
					
				} else if($.trim(bd_title.val()) == ""){
					alert("제목 입력하세요.");
					bd_title.focus();
					
				} else if(bd_content.val()==null || bd_content.val()==""){
					alert("내용을 입력하세요.");
					bd_content.focus();
				
				} else if($.trim(bd_content.val()) == ""){
					alert("내용을 입력하세요.");
					bd_content.focus();
				
				} else if(mem_id.val()==null || mem_id.val()==""){
					alert("작성자를 입력하세요.");
					mem_id.focus();
				
				} else if($.trim(mem_id.val()) == ""){
					alert("작성자를 입력하세요.");
					mem_id.focus();

				} else {
					var bd_title = $.trim(bd_title);
					var bd_content = $.trim(bd_content);
					var mem_id = $.trim(mem_id);
					
					form.submit();
				}
			
			}else {
				
			}
			
	    });
	    
	    $("#btn_board_delete").on("click", function(){
			
			var result = confirm("정말 삭제 하시겠습니까?");
			
			if(result){
				
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
				
			}else{
				false;
			}
			
			
			
		});
	
	});

	
	function fn_detail(bd_num){
		
		$.ajax({
			url : '/board/ajaxDetail',
			type : 'GET',
			data : {bd_num: $('#bd_num').val()},
			dataType : 'json',
			success : function(data){
				
				if(data != ""){
					$("#bd_num").val(data.bd_num);
					$("#bd_title").val(data.bd_title);
					$("#bd_content").val(data.bd_content);
					$("#mem_id").val(data.mem_id);
					$("#mem_pw").val(data.mem_pw);
				}else{
					alert("게시글이 없습니다.");
				}
			}
		});
	}
</script>


</html>