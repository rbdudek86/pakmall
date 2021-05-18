<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- bootstrap -->
<%@include file="/WEB-INF/views/common/config.jsp"%>



<!--  nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp"%>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<form class="form-horizontal" id="updateForm" action="/member/pw_update" method="post" style="padding:100px">
					<fieldset>

						<!-- Form Name -->
						<legend>비밀번호 변경</legend>

						<!-- 기존 비밀번호 -->
						<div class="form-group">
							<label class="col-md control-label" for="passwordinput">기존 비밀번호</label>
							<div class="col-md">
								<input id="memb_pw" name="memb_pw" type="password" placeholder="" class="form-control input-md" 
									required="">
								<span class="help-block">max 16 characters</span>
							</div>
						</div>

						<!-- 변경 비밀번호 -->
						<div class="form-group">
							<label class="col-md control-label" for="passwordinput">변경 비밀번호</label>
							<div class="col-md">
								<input id="memb_pw1" name="memb_pw1" type="password" placeholder="" class="form-control input-md" 
									required="">
								<span class="help-block">max 16 characters</span>
							</div>
						</div>
						
						<!-- 변경 비밀번호 확인 -->
						<div class="form-group">
							<label class="col-md control-label" for="passwordinput">변경 비밀번호 확인</label>
							<div class="col-md">
								<input id="memb_pw2" name="memb_pw2" type="password" placeholder="" class="form-control input-md" 
									required="">
							</div>
						</div>
						

						<!-- Button -->
						<div class="form-group">
							<label class="col-md control-label" for="submit"></label>
							<div class="col-md">
								<button id="btn_submit" name="btn_submit" class="btn btn-primary">수정</button>
								<button id="btn_cancel" name="btn_cancel" class="btn btn-secondary">취소</button>
							</div>
							
						</div>

					</fieldset>
				</form>
				
			</div>
		</div>
	</div>
</div>


