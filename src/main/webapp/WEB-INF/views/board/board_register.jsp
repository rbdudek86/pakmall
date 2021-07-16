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
	
	<main role="main" class="container-fluid" >
		<form style="padding:120px 50px" id="registerForm" action="/board/board_register" method="post">
		  <div>
		  	<h3>글쓰기</h3>
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" placeholder="제목입력" onkeyup="chkword(this, 30)" onmouseout="chkword(this, 30)">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control" id="bd_content" name="bd_content" rows="15" placeholder="내용입력" onkeyup="chkword(this, 3000)" onmouseout="chkword(this, 3000)"></textarea>
		  	<br/>
		  	<span style="color:#aaa;" id="counter">(0 / 최대 3000자)</span>
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Writer</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="작성자입력" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
		    
		  </div>
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Password</label>
		    <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호입력" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
		    <span style="color:#aaa;">(영문,숫자 혼합 8 ~ 15자리)</span>
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
	
	// textarea 체크
	$("#bd_content").keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅
	});
	
</script>
<script>
	$(document).ready(function(){
		
		// 게시판 리시트로 돌아가기
		$("#btn_board_list").on("click", function(){
			location.href = "/board/board_list";
		});
		
		// 등록
	    $("#btn_board_register").on("click", function(){
	        
	    	var form = $("#registerForm");
	    	
	    	var bd_title = $("#bd_title").val();
			var bd_content = $("#bd_content").val();
			var mem_id = $("#mem_id").val();
			var mem_pw = $("#mem_pw").val();
			
			var num = mem_pw.search(/[0-9]/g);
			var eng = mem_pw.search(/[a-z]/ig);
			var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			/* var spe = bd_reply_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); */
			
			if(bd_title==null || $.trim(bd_title) == ""){
				alert("제목 입력하세요.");
				bd_title.focus();
				
			} else if(bd_content==null || $.trim(bd_content) == ""){
				alert("내용을 입력하세요.");
				bd_content.focus();
				
			} else if(mem_id==null || $.trim(mem_id) == ""){
				alert("작성자를 입력하세요.");
				mem_id.focus();
				
			} else if(mem_pw==null || $.trim(mem_pw) == ""){
				alert("비밀번호를 입력하세요.");
				mem_pw.focus();
				
			} else if(mem_pw.length < 8 || mem_pw.length > 20){
			    alert("8자리 ~ 15자리 이내로 입력해주세요.");
			    mem_pw.focus();
			
			}else if(mem_pw.search(/\s/) != -1){
			    alert("비밀번호는 공백 없이 입력해주세요.");
			    mem_pw.focus();
			    
			}else if(hangulcheck.test(mem_pw)){
		   		alert("비밀번호에 한글을 사용 할 수 없습니다."); 
		   		mem_pw.focus();
		   		
			}else if(num < 0 || eng < 0){
			    alert("영문,숫자 를 혼합하여 입력해주세요.");
			    mem_pw.focus();

			} else {
				var bd_title = $.trim(bd_title);
				var bd_content = $.trim(bd_content);
				var mem_id = $.trim(mem_id);
				var mem_pw = $.trim(mem_pw);
				
				form.submit();
			}
			
	    });
	    
		// 취소
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