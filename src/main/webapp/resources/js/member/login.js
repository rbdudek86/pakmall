$(document).ready(function() {
	
	var form = $("#loginForm");
	
	// 로그인 버튼 클릭 시 
	$("#btn_login").on("click", function(){
		
		var memb_id = $("#memb_id");
		var memb_pw = $("#memb_pw");
		
		console.log("--------");
		console.log("memb_id : " + memb_id.val());
		console.log("memb_pw : " + memb_pw.val());

		if(memb_id.val()==null || memb_id.val()==""){
			alert("ID를 입력 하세요.");
			memb_id.focus();
			
		} else if(memb_pw.val()==null || memb_pw.val()==""){
			alert("비밀번호를 입력하세요.");
			memb_pw.focus();

		} else {
			form.submit();
		}
	});
	
});

