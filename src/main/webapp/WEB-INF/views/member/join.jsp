<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- bootstrap -->
<%@include file="/WEB-INF/views/common/config.jsp"%>

<script src="/js/member/join.js"></script>

<!--  nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp"%>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">회원가입</div>
					<div class="card-body">
					<form class="form-horizontal" id="joinForm" action="/member/join" method="post" style="padding:100px 50px">
						<fieldset>
						<!-- Form Name -->
						<legend>회원가입</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inputId">아이디</label>
							<div class="col-md">
								<input id="memb_id" name="memb_id" type="text" placeholder="ID"
									class="form-control input-md" required="">
								<button id="btn_checkId" class="btn btn-default" type="button">중복 확인</button>
								<p id="id_availability" style="color: red;"></p>

							</div>
						</div>

						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="passwordinput">비밀번호</label>
							<div class="col-md">
								<input id="memb_pw" name="memb_pw" type="password"
									placeholder="password" class="form-control input-md" required="">
								<span class="help-block">max 16 characters</span>
							</div>
						</div>

						<!-- Password input-->
						<div class="form-group">
							<label class="col-md-6 control-label" for="confirm_password">비밀번호 확인</label>
							<div class="col-md">
								<input id="memb_pwck" name="memb_pwck" type="password" placeholder="Re-type password"
									class="form-control input-md" required="">

							</div>
						</div>
						
						<!-- Multiple Radios (inline) -->
						<!--
						<div class="form-group">
							<label class="col-md-4 control-label" for="gender">성별</label>
							<div class="col-md">
								<label class="radio-inline" for="gender-0"> <input
									type="radio" name="gender" id="gender-0" value="Male"
									checked="checked"> 남자
								</label> <label class="radio-inline" for="gender-1"> <input
									type="radio" name="gender" id="gender-1" value="Female">
									여자
								</label>
							</div>
						</div>
						-->
						
						<!-- 이름 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="inputName">이름</label>
							<div class="col-md">
								<input id="memb_name" name="memb_name" type="text" placeholder="Name"
									class="form-control input-md" required="">
							</div>
						</div>

						<!-- 주소 -->
						<div class="form-group">
							<label class="col-md-4 control-label"  for="address">주소</label>
							<div class="col-md">
								<input type="text" id="memb_zip" name="memb_zip"placeholder="우편번호">
								<input type="button" onclick="sample2_execDaumPostcode()"
									value="우편번호 찾기"><br> 
								<input type="text" id="memb_addr1" name="memb_addr1" placeholder="주소"><br> 
								<input type="text" id="memb_addr2" name="memb_addr2" placeholder="상세주소">
								<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
							</div>
							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer"
								style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
									onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
						</div>

						<!-- 휴대폰 번호 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="mobilenumber">휴대폰 번호</label>
							<div class="col-md">
								<input id="memb_phone" name="memb_phone" type="text"
									placeholder="Mobile Number" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- 이메일 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="InputEmail">이메일</label>
							<div class="col-md">
								<input id="memb_email" name="memb_email" type="email"
									placeholder="user@domain.com" class="form-control input-md">
								<button id="btn_sendAuthCode" class="btn btn-default" type="button" >이메일 인증</button>
								<p id="authcode_status" style="color: red;"></p>
							</div>
							<!-- 이메일 인증 요청을 하고 , 성공적으로 진행이 되면, 아래 div태그가 보여진다. -->
							<div id="email_authcode" class="form-group" style="display: none;">
								<label for="inputAuthCode">이메일 인증코드</label><br /> 
								<input type="text"
									class="form-control" id="mem_authcode" 
									placeholder="이메일 인증코드를 입력해 주세요" 
									style="max-width: 570px; width:calc(100% - 70px); margin-right: 5px; display: inline-block;" />
								<button id="btn_checkAuthCode" class="btn btn-default" type="button" >확인</button>
							</div>
						</div>

						<!-- Prepended checkbox -->
						<!--
						<div class="form-group">
							<label class="col-md-6 control-label" for="check_critiria">Check
								the box</label>
							<div class="col-md">
								<div class="input-group">
									<span class="input-group-addon"> <input type="checkbox">
									</span> <input id="check_critiria" name="check_critiria"
										class="form-control" type="text"
										placeholder="I accept the criteria" required="">
								</div>

							</div>
						</div>
						-->

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md">
								<button id="btn_submit" name="btn_submit" class="btn btn-primary">회원가입</button>
								<button id="btn_cancel" name="btn_cancel" class="btn btn-secondary">취소</button>
							</div>
						</div>
					</fieldset>
					</form>
				</div>
			</div>	
		</div>
	</div>
</div>

<!-- 주소찾기 daum api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function sample2_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample2_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample2_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('memb_zip').value = data.zonecode;
						document.getElementById("memb_addr1").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("memb_addr2")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
</script>

