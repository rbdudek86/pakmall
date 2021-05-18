<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>PAK Mall</title>

<%@include file="/WEB-INF/views/common/config.jsp"%>

<script>
    var message = '${status}';

    if(message == 'loginSuccess'){
        alert('로그인이 되었습니다.');
    }else if(message == 'loginIDFail'){
        alert('아이디가 틀립니다.');
    }else if(message == 'loginPWFail'){
        alert('비밀번호가 틀립니다.');
    }else if(message == 'logout'){
        alert('로그아웃 되었습니다.');
    }else if(message == 'modifySuccess'){
        alert('회원 수정이 되었습니다.');
    }else if(message == 'regdelete'){
        alert('회원삭제가 되었습니다.');
    }
	</script>

<meta name="theme-color" content="#563d7c">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

</style>




</head>
<body>

	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>
	
	

	<main role="main" class="container-fluid">
	<!-- 카테고리 목록 -->
		<div class="row">
			<div class="col-2">

				<%@include file="/WEB-INF/views/common/category_list.jsp"%>

			</div>
			
				<!-- 콘텐츠 영역 -->
				<div class="col-10">
				
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="/resources/img/shirt_01.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/shirt_03.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/shirt_04.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				
			  </div>
		  	</div>

	</main>
	<!-- /.container -->


</body>

	<div class="row">
		<!-- footer.jsp -->
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
	
	</div>

</html>