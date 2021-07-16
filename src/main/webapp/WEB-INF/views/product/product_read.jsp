<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 숫자,통화,날짜 통화 값 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<title>Study DocMall - Bootstrap v4.6</title>

<%@include file="/WEB-INF/views/common/config.jsp"%>

<!-- 1)handlebars.js 참조 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 2)UI Template -->
	<script id="reviewTemplate" type="text/x-handlebars-template">
			{{#each .}}
			<ul class="list-group">
				<li class="list-group-item" data-rv_num="{{rv_num}}">{{rv_num}}</li>
				<li class="list-group-item" data-rv_content="{{rv_content}}">{{rv_content}}</li>
				<li class="list-group-item" data-mem_id="{{mem_id}}">{{mem_id}}</li>
				<li class="list-group-item" data-rv_date_reg="{{displayTime rv_date_reg}}">{{displayTime rv_date_reg}}</li>
				<li class="list-group-item" data-rv_score="{{rv_score}}"><strong>{{checkRating rv_score}}</strong></li>
				<li class="list-group-item">{{eqReplyer mem_id}}</li>
				</li>
			</ul>
			{{/each}}
	</script>
	
	<script>
		// 3) 상품후기목록 데이터 출력작업
		var printReviewData = function(reviewData, reviewTarget, reviewTemplate){
				var uiTemplate = Handlebars.compile(reviewTemplate.html());

				var reviewDataResult = uiTemplate(reviewData);
				
				reviewTarget.html(reviewDataResult);
			}

		

		// 상품후기 목록 페이징구현작업
		let curPage = 1;
		
		var replyPageDisplay = ""; // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]

	
		// 댓글 페이징번호를 출력하는 기능.

		var displayPageCount = 5; // 페이지에 출력될 개수

		var printReviewPaging = function(replyCnt, pageNum){
			
			// 페이징 알고리즘
			var endNum = Math.ceil(pageNum / 10.0) * 10; // 10 의 의미는 출력될 페이지수(pageSize)
			var startNum = endNum - 9;

			var prev = startNum != 1;
			var next = false;

			// 마지막페이수 번호 * 10개 >= 총데이타개수(실제)
			if(endNum * displayPageCount >= replyCnt){
				//  Math.ceil(12 / 10) = 2
				endNum = Math.ceil(replyCnt/parseFloat(displayPageCount)); // 실제데이타를 이용한 전체페이지 수
			}

			// 실제데이타가 마지막페이지번호*10 보다 크면, 다음데이타를 표시하기위하여 next = true 로 해줘야한다.
			if(endNum * displayPageCount < replyCnt){
				next = true;
			}

			/*
			<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
			</nav>

			*/

			var str = '<ul class="pagination">';
			// 이전표시여부
			if(prev){
				str += '<li class="page-item"><a class="page-link" href="' + (startNum - 1) + '">Previous</a></li>';
			}
			// 페이지번호 출력
			for(var i=startNum; i<= endNum; i++){
				var active = pageNum == i ? "active":""; // 현재페이지 상태를 나타내는 스타일시트 적용

				str += '<li class="page-item ' + active + ' "><a class="page-link" href="' + i + '">' + i + '</a></li>';
			}
			// 다음표시여부
			if(next){
				str += '<li class="page-item"><a class="page-link" href="' + (endNum + 1) + '">Next</a></li>';
			}

			str += '</ul>';

			//console.log(str);

			
			$("#reviewPaging").html(str);

			//페이징정보 표시

			
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

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    
    <%-- 모달 대화상자 스타일 --%>
     #star_grade a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade a.on{
        color: black;
    }
    
    #star_grade_modal a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade_modal a.on{
        color: black;
    }
    
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
      /*
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
     */
</style>

</head>
<body>
	
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">
		
		<div class="row">
			<div class="col-2">
				<!-- 카테고리 메뉴 -->

				<%@include file="/WEB-INF/views/common/category_list.jsp"%>

			</div>
		<div class="col-10">
			<!-- 상품상세설명 -->
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col-auto d-none d-lg-block">
					<img src="/product/displayFile?fileName=${productVO.pdt_img }" style="width: 150; height:250;">
	        	</div>
		        
		        <div class="col p-4 d-flex flex-column position-static">
		          상품이름 <strong class="d-inline-block mb-2 text-primary">${productVO.pdt_name }</strong>
				  		<input type="hidden" name="pdt_num" value="${productVO.pdt_num }">
		          판매가 <strong class="d-inline-block mb-2 text-primary">${productVO.pdt_price }</strong>
		          할인율 <strong class="d-inline-block mb-2 text-primary">${productVO.pdt_discount }</strong>
		          제조사 <strong class="d-inline-block mb-2 text-primary">${productVO.pdt_company }</strong>
		          수량 <input type="text" value="${productVO.pdt_amount }" id="pdt_amount" name="pdt_amount"> 
		          
		          <button type="button" id="btnOrder" class="btn btn-link">즉시구매</button>
			      <button type="button" id="btnCart" class="btn btn-link">장바구니</button>
			      <button type="button" id="btnReview" class="btn btn-link">상품후기</button>
		        </div>
		        <div class="row">
		        	<p class="card-text mb-auto">${productVO.pdt_detail }</p>
		        </div>
				<form id="btnOrder" method="get" action="/order/order">
            		<input type="hidden" name="type" value="1">
			    </form>
			</div>

		<!-- 즉시구매 클릭시 -->
	<script>

		$(document).ready(function(){

		// 즉시구매 클릭
		$("#btnOrder").on("click", function(){

			console.log("즉시구매");

			//상품코드, 구매수량

			var pdt_num = $("input[name='pdt_num']").val();
			var odr_amount = $("#pdt_amount").val();

			console.log("상품코드: " + pdt_num);
			console.log("구매수량: " + odr_amount);


			var btnOrder = $("#btnOrder");
			btnOrder.append("<input type='hidden' name='pdt_num' value='" + pdt_num + "'>");
			btnOrder.append("<input type='hidden' name='odr_amount' value='" + odr_amount + "'>");
			//return;

			btnOrder.submit();

			});


		});

	</script>


		<!-- 장바구니 클릭시 -->
<script>
	
	$(document).ready(function(){

		$("#btnCart").on("click", function(){
		console.log("장바구니");

		/*
		장바구니코드 : 시퀀스, 로그인ID(세션)
		상품코드,수량
		*/
		// <input type="hidden" name="pdt_num" value="${productVO.pdt_num }">
		var pdt_num = $("input[name='pdt_num']").val();
		var pdt_amount = $("#pdt_amount").val();

		$.ajax({
		url : "/cart/add",
		type: "post",
		data: {pdt_num : pdt_num, pdt_amount: pdt_amount },
		dataType : "text",
		success: function(data){
			if(data == "SUCCESS"){
			if(confirm("장바구니가 추가되었습니다. \n 확인 하시겠습니까?")){
				location.href = "/cart/cart_list";
			}
			}else if(data == "LoginRequired"){
				alert("로그인이 필요합니다.");
				location.href = "/member/login";
			}
		}
		});
		
		});
	});
	</script> 	

		<!-- 상품후기 목록 -->
		<div class="row">
			
			<div class="col-lg-12">
	    		<div class="panel panel-default">
	    			<div class="panel-heading">
	    			 Review List
	    			</div>
	    			<!-- 상품후기 목록위치 -->
	    			<div class="panel-body" id="reviewListView"></div>
					<!-- 페이징 위치 -->
					<div class="panel-footer" id="reviewPaging"></div>
					
				<!-- 상품후기 모달대화상자 : 후기쓰기, 후기수정, 후기삭제 -->
				<div class="modal fade" id="reviewModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="modalLabel">Product Review Modal-Register</h5>
						
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				    <div class="modal-body">
				      <!-- 상품후기쓰기 부분 -->
					 <div class="form-group">
					 <div>
						<label for="review">상품후기 평점</label><br>
							<div class="rating">
								<p id="star_grade">
							        <a href="#">★</a>
							        <a href="#">★</a>
							        <a href="#">★</a>
							        <a href="#">★</a>
							        <a href="#">★</a>
								</p>
							</div>
				        
				        	<label>상품후기</label>
							<input type="hidden" class="form-control" name="pdt_num" id="pdt_num" value="${productVO.pdt_num}">
							<input type="hidden" name="rv_num" id="rv_num">
				        	<textarea class="form-control" name="rv_content" id="rv_content"></textarea>
				        </div>
				      </div>
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" id="btnReviewAdd" class="btn btn-primary btnModal">상품후기 쓰기</button>
						<button type="button" id="btnReviewEdit" class="btn btn-primary btnModal">상품후기 수정</button>
						<button type="button" id="btnReviewDel" class="btn btn-primary btnModal">상품후기 삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
		
				</div>
			</div>
		</div>
	</div>
	
		<!-- 상품후기 목록/페이징 -->
	<script>

	var showReviewList = function(curPage){
		
		//상품코드
		let pdt_num = ${productVO.pdt_num};
		let page = curPage;
		
		console.log(pdt_num);

		let url = "/review/pages/" + pdt_num + "/" + page; // /pages/100/1

		$.getJSON(url, function(data){
			 //1)상품후기목록 출력
			printReviewData(data.list, $("#reviewListView"), $("#reviewTemplate"));
			 //2)페이징 출력
			printReviewPaging(data.reviewCnt, page);
		});
	}
	

	showReviewList(curPage);
	
	</script>


		<!-- 상품후기 버튼 클릭 -->
	<script>

		$(document).ready(function(){

			//<button type="button" id="btnReview" class="btn btn-link">
			//모달대화상자 보기 <button type="button" id="btnReviewAdd" class="btn btn-primary btnModal">상품후기 쓰기</button>
			$("#btnReview").on("click",function(){
				$("#modalLabel").html("Product Review Modal-Register");
				
				$("button.btnModal").hide();
				$("#btnReviewAdd").show();

				$("#reviewModal").modal("show");
			});

			//로그인 사용자와 상품후기 작성자 동일하면, 수정, 삭제 표시
		Handlebars.registerHelper("eqReplyer", function(replyer, rv_num){
			var str = "";
			var login_id = "${sessionScope.loginStatus.memb_id}";
			if(replyer == login_id){
				str += '<button type="button" class="btn btn-primary btn-edit">Modify</button>';
				str += '<button type="button" class="btn btn-primary btn-del">Delete</button>';
			}

			return new Handlebars.SafeString(str); //태그문자열 처리시 사용

		});

		//상품후기목록 수정클릭시 (동적으로 추가된 태그를 이벤트 설정하는 구문)
		$("#reviewListView").on("click", ".btn-edit", function(){
			console.log("후기수정버튼");

			// 모달대화상자 표시 - 수정내용 반영

			var rv_num, mem_id, pdt_num, rv_content, rv_score, rv_date_reg;

			rv_num = $(this).parents("ul.list-group").find("li[data-rv_num]").attr("data-rv_num");
			mem_id = $(this).parents("ul.list-group").find("li[data-mem_id]").attr("data-mem_id");
			rv_content = $(this).parents("ul.list-group").find("li[data-rv_content]").attr("data-rv_content");
			rv_score = $(this).parents("ul.list-group").find("li[data-rv_score]").attr("data-rv_score");
			rv_date_reg = $(this).parents("ul.list-group").find("li[data-rv_date_reg]").attr("data-rv_date_reg");
			

			console.log(rv_num);

			$("#modalLabel").html("Product Review Modal-Modify [" + rv_num + "] 번 ");

			$("#rv_num").val(rv_num);
			$("#rv_content").val(rv_content);

			// 상품후기 수정 모달 대화상자에서 별점표시작업
			$("#star_grade a").each(function(index, item){
				if(index < rv_score){ // 0 < 3 , 1 < 3, 2 < 3 -> true // 3 < 3 -> false
					$(item).addClass("on");
				}else{
					$(item).removeClass("on");
				}
			});
				
				$("button.btnModal").hide();
				$("#btnReviewEdit").show();
			

				$("#reviewModal").modal("show");


		})
		
		//상품후기 수정 모달대화상자 수정히기 (액션)
		$("#btnReviewEdit").on("click", function(){
			
			let rv_score = 0;
			let rv_content = $("#rv_content").val();
			
			let rv_num = $("#rv_num").val();

			$("#star_grade a").each(function(i,e){ // i: 인덱스, e: a태그
				if($(this).attr("class") == "on"){
					rv_score += 1;
				}
			});

			if(rv_score == 0){
				alert("별점을 선택해주세요.");
				return;
			}else if(rv_score == "" || rv_content == null){
				alert("후기 내용을 입력하세요.");
				return;
			}
			
			console.log(rv_score);
			console.log(rv_content);
			console.log(rv_num);
			
			
			//return;
			// ajax호출
			// 후기입력데이터를 전송
			$.ajax({
				url: "/review/review_modify",
				type: "post",
				data: {rv_num : rv_num, rv_score : rv_score, rv_content : rv_content}, // 변수 : 파라미터
				dataType: "text",
				success: function(data){
					alert("상품후기가 수정되었습니다.");
					$("#star_grade a").parent().children("a").removeClass("on");
					$("#rv_content").val("");

					$("#reviewModal").modal("hide");

					//상품후기 목록호출 함수
					showReviewList(1);
				}
			});
			
		});

		//상품후기목록 모달
		$("#reviewListView").on("click",".btn-del", function(){
			console.log("후기삭제버튼");

			// 모달대화상자 표시 - 수정내용 반영

			var rv_num, mem_id, pdt_num, rv_content, rv_score, rv_date_reg;

			rv_num = $(this).parents("ul.list-group").find("li[data-rv_num]").attr("data-rv_num");
			mem_id = $(this).parents("ul.list-group").find("li[data-mem_id]").attr("data-mem_id");
			rv_content = $(this).parents("ul.list-group").find("li[data-rv_content]").attr("data-rv_content");
			rv_score = $(this).parents("ul.list-group").find("li[data-rv_score]").attr("data-rv_score");
			rv_date_reg = $(this).parents("ul.list-group").find("li[data-rv_date_reg]").attr("data-rv_date_reg");
			

			console.log(rv_num);

			$("#modalLabel").html("Product Review Modal-Delete [" + rv_num + "] 번 ");

			$("#rv_num").val(rv_num);
			$("#rv_content").val(rv_content);

			// 상품후기 수정 모달 대화상자에서 별점표시작업
			$("#star_grade a").each(function(index, item){
				if(index < rv_score){ // 0 < 3 , 1 < 3, 2 < 3 -> true // 3 < 3 -> false
					$(item).addClass("on");
				}else{
					$(item).removeClass("on");
				}
			});
				
				$("button.btnModal").hide();
				$("#btnReviewDel").show();
			

				$("#reviewModal").modal("show");
		});


		//상품후기목록 삭제클릭시	

		$("#btnReviewDel").on("click", function(){

			let rv_score = 0;
			let rv_content = $("#rv_content").val();
			
			let rv_num = $("#rv_num").val();

			$("#star_grade a").each(function(i,e){ // i: 인덱스, e: a태그
				if($(this).attr("class") == "on"){
					rv_score += 1;
				}
			});

			if(rv_score == 0){
				alert("별점을 선택해주세요.");
				return;
			}else if(rv_score == "" || rv_content == null){
				alert("후기 내용을 입력하세요.");
				return;
			}
			
			
			//return;
			// ajax호출
			// 후기입력데이터를 전송
			$.ajax({
				url: "/review/review_delete",
				type: "post",
				data: {rv_num : rv_num}, // 변수 : 파라미터
				dataType: "text",
				success: function(data){
					alert("상품후기가 삭제되었습니다.");
					$("#star_grade a").parent().children("a").removeClass("on");
					$("#rv_content").val("");

					$("#reviewModal").modal("hide");

					//상품후기 목록호출 함수
					showReviewList(1);
				}
			});
		});


		// 4)사용자정의 헬퍼(Handlebars 버전의 함수)
		// 댓글 날짜를 하루기준으로 표현을 1)24시간 이전 시:분:초 2)24시간 이후 년/월/일
		Handlebars.registerHelper("displayTime", function(timeValue){
			var today = new Date(); // 1970년1월1일 0시0분0초 0 밀리세컨드
			var gap = today.getTime() - timeValue;

			var dateObj = new Date(timeValue);
			var str = "";

			if (gap < (1000 * 60 * 60 * 24)){
				var hh = dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();

				return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
						':', (ss > 9 ? '' : '0') + ss ].join('');
			}else {
				var yy = dateObj.getFullYear();
				var mm = dateObj.getMonth();
				var dd = dateObj.getDate();

				return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
						(dd > 9 ? '' : '0') + dd ].join('');
			}
		});
		
		Handlebars.registerHelper("checkRating", function(rating){
			var stars = "";

			switch(rating){
          case 1:
            stars = "★☆☆☆☆";
            break;
          case 2:
            stars = "★★☆☆☆";
            break;
          case 3:
            stars = "★★★☆☆";
            break;
          case 4:
            stars = "★★★★☆";
            break;
          case 5:
            stars = "★★★★★";
            break;
          default:
            stars = "☆☆☆☆☆";
            break;
			}
		
			return stars;
		
		});

		$("#reviewPaging").on("click", "li.page-item a", function(e){
			e.preventDefault();

			console.log("페이지번호 클릭");

			curPage = $(this).attr("href");
			showReviewList(curPage);
		});




			// 별점 색상변경
			$("#star_grade a").click(function(e){

				e.preventDefault();
				$(this).parent().children("a").removeClass("on"); // 새로 클릭했을때 지우고 다시 선택
				$(this).addClass("on").prevAll("a").addClass("on");
			});

			// 상품후기 쓰기 클릭
			$("#btnReviewAdd").on("click", function(){

				let rv_score = 0;
				let rv_content = $("#rv_content").val();
				let pdt_num = $("#pdt_num").val();

				$("#star_grade a").each(function(i,e){ // i: 인덱스, e: a태그
					if($(this).attr("class") == "on"){
						rv_score += 1;
					}
				});

				if(rv_score == 0){
					alert("별점을 선택해주세요.");
					return;
				}else if(rv_score == "" || rv_content == null){
					alert("후기 내용을 입력하세요.");
					return;
				} 
				// ajax호출
				// 후기입력데이터를 전송
				$.ajax({
					url: "/review/review_register",
					type: "post",
					data: {rv_score : rv_score, rv_content : rv_content, pdt_num : pdt_num}, // 변수 : 파라미터
					dataType: "text",
					success: function(data){
						alert("상품후기가 등록되었습니다.");
						$("#star_grade a").parent().children("a").removeClass("on");
						$("#rv_content").val("");

						$("#reviewModal").modal("hide");

						//상품후기 목록호출 함수
						showReviewList(1);
					}
				});
			});
		});

	</script>

	</main>
	<!-- /.container -->


</body>
</html>