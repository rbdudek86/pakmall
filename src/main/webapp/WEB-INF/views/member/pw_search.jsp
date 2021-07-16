<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- bootstrap --> 
<%@include file="/WEB-INF/views/common/config.jsp" %>

<script src="/js/member/id_pw_search.js"></script>


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

    <title>비밀번호 찾기</title>
</head>
<body>


<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">비밀번호 찾기</div>
                    <div class="card-body">
                        <form style="padding:100px 30px">
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">ID</label>
                                <div class="col-md-6">
                                    <input type="text" id="memb_id" name="memb_id" class="form-control" required autofocus>
                                </div>
                            </div>
							<!-- 
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">이름</label>
                                <div class="col-md-6">
                                    <input type="text" id="memb_name" name="memb_name" class="form-control" required>
                                </div>
                            </div>
							 -->

                            <div class="col-md-6 offset-md-4">
                                <button id="btn_PW_search" type="submit" class="btn btn-primary">
                                    비밀번호 찾기
                                </button>
                                <p id="result" style="color:red;" ></p>
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