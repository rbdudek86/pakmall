<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- bootstrap --> 
<%@include file="/WEB-INF/views/common/config.jsp" %>

<script src="/js/member/login.js"></script>


<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">

<!--  nav.jsp -->
<%@include file="/WEB-INF/views/common/nav.jsp" %>

    <title>Login</title>
</head>
<body>

<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
					<div class="card">
						<div class="card-header">Login</div>
						<div class="card-body">
							<form id="loginForm" action="/member/loginPost" method="POST" style="padding: 100px 30px">
								<div class="form-group row">
									<label for="email_address" class="col-md-4 col-form-label text-md-right">ID</label>
									<div class="col-md-6">
										<input type="text" id="memb_id" name="memb_id" class="form-control" value="testid" required autofocus>
									</div>
								</div>

								<div class="form-group row">
									<label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
									<div class="col-md-6">
										<input type="password" id="memb_pw" name="memb_pw" class="form-control" value="1234" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" name="useCookie">
												Remember Me
											</label>
										</div>
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button id="btn_login" type="button" class="btn btn-primary">로그인</button>
									<a href="/member/find_id" class="btn btn-link">아이디 찾기</a> 
									<!-- <a href="/member/find_pwd" class="btn btn-link">비밀번호 찾기</a>  -->
									<a href="/member/pw_search" class="btn btn-link">비밀번호 찾기</a>
								</div>
							</form>
						</div>
					</div>
				</div>
        	</div>
    	</div>
</main>

</body>
</html>