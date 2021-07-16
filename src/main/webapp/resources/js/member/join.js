$(document).ready(function() {
	
	var form = $("#joinForm");
	
	// 아이디중복체크 기능 사용여부확인 변수
	var isCheckId = "false";

	// 인증 확인 여부를 위한 변수
	var isCheckEmail = "false";
	
	/* 아이디 중복체크 클릭 시 */
	$("#btn_checkId").on("click", function(){
		
		if($("#memb_id").val()=="" || $("#memb_id").val()== null){
			$("#id_availability").html("아이디를 먼저 입력해주세요.");
			return;
		} 		
		
		var memb_id = $("#memb_id").val();

		
		// ajax방식은 제어의 흐름이 클라이언트시작 -> 서버요청 -> 클라이언트  종료
		// ajax방식은 서버요청에 실행되는 코드가 response.redirect,redirect: 주소이동 구문이 사용안하거나 
		// 동작되어서는 안된다.
		$.ajax({
			url: '/member/checkIdDuplicate',
			type: 'post',
			dataType: 'text',  //  '/member/checkIdDuplicate'주소에서 넘어오는 리턴값의 형식
			data: {memb_id : memb_id},  // javasciprt object 표현구문.www.w3school.com 참고
			success : function(data){
				if(data== 'SUCCESS'){
					// 사용 가능한 아이디
					$("#id_availability").css("color", "blue");
					$("#id_availability").html("사용가능한 아이디 입니다.");
					// 아이디를 중복체크하고 나서 아이디 텍스트박스 읽기모드, ,중복체크 비활성화
					$("#memb_id").attr("readonly", true);
					$("#btn_checkId").attr("disabled", true);
					
					isCheckId = "true";  // 아이디 중복체크를 한 용도
				} else {
					// 사용 불가능 - 이미 존재하는 아이디
					$("#id_availability").html("이미 존재하는 아이디입니다. \n다시 시도해주세요.");
				}
			}
		});
	});
	
	
	/* 이메일 인증 클릭 시 */
	$("#btn_sendAuthCode").on("click", function(){
		var receiveMail = $("#memb_email").val();
		
		if(receiveMail == "" || receiveMail == null){
			// 메시지를 alert()   사용하지않고, 임의의 위치에 출력하는 형태
			$("#authcode_status").html("이메일을 먼저 입력해주세요.");
			return;
		}
		
		// 현재 작업이 진행중인 메시지를 보여주는 구문.
		$("#authcode_status").css("color", "grey");
		$("#authcode_status").html('인증코드 메일을 전송중입니다.  잠시만 기다려주세요...');
		
		$.ajax({
			url: '/email/send',    // EmailController.java
			type: 'post',
			dataType: 'text',
			data: {receiveMail : receiveMail},  //  {key : value}
			success: function(data){
				$("#email_authcode").show();
				$("#authcode_status").css("color", "grey");
				$("#authcode_status").html('메일이 전송되었습니다.  입력하신 이메일 주소에서 인증코드 확인 후 입력해주세요.');
			}
		});
	});
	
	/* 인증코드 입력 후 확인 클릭 시 */
	$("#btn_checkAuthCode").on("click", function(){
		var code = $("#mem_authcode").val(); // 메일을 통하여 받았던 인증코드를 보고 입력하면 인증코드를참조 
		
		$.ajax({
			url: '/member/checkAuthcode',
			type: 'post',
			dataType: 'text',
			data: {code : code},
			success: function(data){
				if(data == 'SUCCESS'){
					$("#email_authcode").hide(); // 인증코드 입력화면 숨김.
					$("#authcode_status").css("color", "blue");
					$("#authcode_status").html('인증 성공');
					$("#memb_email").attr("readonly",true);
					$("#btn_sendAuthCode").attr("disabled", true);
					isCheckEmail = "true";  // 인증메일 유효성 검사에 사용하기위한 변수. 
					return;
					
				} else {
					$("#email_authcode").hide();
					$("#authcode_status").css("color", "red");
					$("#authcode_status").html('인증 실패. 다시 시도해주세요.');
					return;
				}
			}
		});
	});
	
	
	/* 회원가입 버튼 클릭 시 */ 
	$("#btn_submit").on("click", function(){
		
		var memb_id = $("#memb_id");
		var memb_pw = $("#memb_pw");
		var memb_pwck = $("#memb_pwck");
		var memb_name = $("#memb_name");
		var memb_email = $("#memb_email");
		var mem_authcode = $("#mem_authcode");
		var memb_phone = $("#memb_phone");
		var memb_zip = $("input[name='memb_zip']");
		var memb_addr1 = $("input[name='memb_addr1']");
		var memb_addr2 = $("input[name='memb_addr2']");
		
		/* 유효성 검사 */
		if(memb_id.val()==null || memb_id.val()==""){
			alert("아이디를 입력해주세요");
			memb_id.focus();
			
		} else if(isCheckId =="false"){   // 아이디 중복기능 사용여부 확인
			alert("아이디 중복 체크를 해주세요.");
			$("#btn_checkId").focus();
			
		} else if(memb_pw.val()==null || memb_pw.val()==""){
			alert("비밀번호를 입력해주세요.");
			memb_pw.focus();
			
		} else if(memb_pwck.val()==null || memb_pwck.val()==""){
			alert("비밀번호 확인 란을 입력해주세요.");
			memb_pwck.focus();
			
		} else if(memb_pw.val() != memb_pwck.val()){
			alert("입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요.");
			memb_pwck.focus();

		} else if(memb_name.val()==null || memb_name.val()==""){
			alert("이름을 입력해주세요.");
			memb_name.focus();
		
		} else if(memb_email.val()==null || memb_email.val()==""){
			alert("이메일을 입력해주세요.");
			memb_email.focus();

		} else if(mem_authcode.val()==null || mem_authcode.val()==""){
			alert("이메일 인증 확인 후 인증 코드를 입력해주세요.");
			mem_authcode.focus();

		} else if(isCheckEmail=="false"){   // 이메일인증 확인여부
			alert("이메일인증을 해주세요.");
			$("#btn_sendAuthCode").focus();
		
		} else if(memb_phone.val()==null || memb_phone.val()==""){
			alert("휴대폰 번호를 입력해주세요.");
			memb_phone.focus();

		} else if(memb_zip.val()==null || memb_zip.val()==""){
			alert("우편번호를 입력해주세요.");
			$("#btn_postCode").focus();
			
		} else if(memb_addr1.val()==null || memb_addr1.val()==""){
			alert("주소를 입력해주세요.");
			$("#btn_postCode").focus();
			
		} else if(memb_addr2.val()==null || memb_addr2.val()==""){
			alert("상세 주소를 입력해주세요.");
			memb_addr2.focus();

		} else {
			form.submit();  // 전송태그를 <button type="button"> 를 사용하여 서브밋메서들 호출함.
		}
	});
	
	$("#btn_cancel").on("click", function(){
		
		var result = confirm("가입을 취소하시겠습니까?");
		if(result){
			location.href="/"; 
		} else{}
	});
	
});

