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
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 10px;">
		<form style="padding:50px 30px" id="registerForm" action="/board/board_register" method="post">
		<h3>글쓰기</h3><br>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" placeholder="제목입력" onkeyup="chkword(this, 30)">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content" name="bd_content" rows="5" placeholder="내용입력" onkeyup="chkword(this, 300)"></textarea>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Writer</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="작성자입력" onkeyup="chkword(this, 10)">
		    
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Password</label>
		    <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호입력" onkeyup="chkword(this, 13)">
		    
		  </div>
		  
		  <button type="button" id="btn_board_list" class="btn btn-primary">목록</button>
		  <button type="button" id="btn_board_register" class="btn btn-primary">등록</button>
		  <button type="button" id="btn_board_cancle" class="btn btn-danger">취소</button>
		</form>

	</main>
</body>
<script type="text/javascript">
	// 입력 글자수 제한
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
		
		$("#btn_board_list").on("click", function(){
			location.href = "/board/board_list";
		});
		
		
	    $("#btn_board_register").on("click", function(){
	        
	    	var form = $("#registerForm");
	    	
	    	var bd_title = $("#bd_title");
			var bd_content = $("#bd_content");
			var mem_id = $("#mem_id");
			var mem_pw = $("#mem_pw");
			
			
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
				
			} else if(mem_pw.val()==null || mem_pw.val()==""){
				alert("비밀번호를 입력하세요.");
				mem_pw.focus();
				
			} else if($.trim(mem_pw.val()) == ""){
				alert("비밀번호를 입력하세요.");
				mem_pw.focus();

			} else {
				var bd_title = $.trim(bd_title);
				var bd_content = $.trim(bd_content);
				var mem_id = $.trim(mem_id);
				var mem_pw = $.trim(mem_pw);
				
				form.submit();
			}
			
	    });
	    
	    $("#btn_board_cancle").on("click",function(){
	    	
	    	var alert = confirm("취소 하시겠습니까?");
	    	
	    	location.href = "/board/board_register";
	    	
	    });
	
	});

</script>

<script>
	// 비밀번호 공백 사용 못함
	/* function noSpaceForm(obj){
		var str_space = /\s/; // 공백 체크
		if(str_space.exec(obj.value)){
			alert("해당 항목에는 공백을 사용할 수 없습니다.");
			obj.value = obj.value.replace(' ','');
			return false;
		}
	} */
</script>


</html>