<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 숫자,통화,날짜 통화 값 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Board Detail</title>

<!-- css file -->
<%@include file="/WEB-INF/views/common/config.jsp"%>
<!-- <style>
	textarea.form-control {min-height: 100px; }
</style> -->
<script>
function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}
</script>

<script>
$(document).ready(function(){
	
	$.ajax({
		url: '/reply/reply_getList',
		type: 'post',
		data: {bd_num : $("#bd_num").val()},
		dataType: 'text'
	});
	
	
	
});
</script>

</head>
<body>
	<div style="position: relative;">	
	<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>	
	</div>
	
	<main role="main" class="container-fluid" style="position: relative; left:10px; top: 70px;">
		
		
		<form style="padding:50px 50px" id="boardUpdateFrom" method="post" action="/board/board_update">
			<div>
				<h3>게시글</h3>
			</div>
		  
		  <input type="hidden" id="bd_num" name="bd_num" value="${bd_num }"/>
		  <input type="hidden" id="mem_pw" name="mem_pw" value="${mem_pw }"/>
		  <input type="hidden" id="bd_parent" name="bd_parent" value="${bd_parent }"/>
		  <input type="hidden" id="bd_ref" name="bd_ref" value="${bd_ref }"/>
		  <input type="hidden" id="bd_layer" name="bd_layer" value="${bd_layer }"/>
		 <div class="panel-heading text-right">
			  <button type="button" id="btn_board_list" class="btn btn-primary">목록</button>
			  <button type="button" id="board_reply_register" class="btn btn-primary">답글작성</button>
		</div>
		
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-laebel">Title</label>
		    <input type="text" class="form-control" id="bd_title" name="bd_title" onkeyup="chkword(this, 30)" onmouseout="chkword(this, 30)">
		    
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">Content</label>
		    <textarea  class="form-control"  id="bd_content" name="bd_content" rows="15" onkeyup="chkword(this, 3000)" onmouseout="chkword(this, 3000)"></textarea>
		  </div> 
		  
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Writer</label>
		    <input type="text" class="form-control" id="mem_id" name="mem_id" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
		    
		  </div>
		  
		 <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">Password</label>
		    <input type="password" class="form-control" id="mem_pw_ck" name="mem_pw_ck" placeholder="비밀번호 영문,숫자 혼합 8 ~ 15자리 입력" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
		    
		  </div>
		  
		  <div class="panel-heading text-right">
			  <button type="button" id="btn_board_update" class="btn btn-primary">수정</button>
			  <button type="button" id="btn_board_delete" class="btn btn-danger">삭제</button>
		  </div>
		  
		</form>	  
		<br>
		<hr>
		<br>
		<div style="padding:10px 50px">	
			<div>
				<h3>댓글작성</h3>
			</div>
				<div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Reply</label>
				    <textarea  class="form-control" rows="4" id="bd_reply" name="bd_reply" placeholder="댓글입력" onkeyup="chkword(this, 300)" onmouseout="chkword(this, 300)"></textarea>
				    <span style="color:#aaa;" id="counter">(0 / 최대 300자)</span>
			  	</div> 
			  	
			  	<div class="mb-3">
				   <label for="exampleInputEmail1" class="form-label">Replyer</label>
				   <input type="text" class="form-control" id="bd_replyer" name="bd_replyer" placeholder="작성자입력" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
				</div>
				<div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Password</label>
				    <input type="password" class="form-control" id="bd_reply_pw" name="bd_reply_pw" placeholder="비밀번호입력" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
				    <span style="color:#aaa;">(영문,숫자 혼합 8 ~ 15자리)</span>
			  	</div>
			  	<div>			
			   		<button type="button" id="reply_insert" class="btn btn-primary">등록</button>
				</div>
			</div>
		<br>
		<hr>
		<br>  
		
		<div>
			<div style="padding:10px 50px">
				<h3>댓글리스트</h3>
			</div>
			<div class="row">
			
				<%-- 데이터가 존재하지 않는 경우 --%>
				<c:if test="${empty replyList }">
			  		<p style="color:red; padding:10px 70px ">댓글이 없습니다.</p>
			  	</c:if>
			</div>
			<div class="mb-3">
			  	<c:forEach items="${replyList}" var="list">
			  		<form style="padding:10px 50px" border="0.5" id="rno_${list.bd_rno }" name="rno_${list.bd_rno }" action="/reply/reply_update" method="post">
						<table width="100%" bordercolor="silver">
						  	<tr>	
								<td width="100%">
									<label>Reply</label>
									<textarea class="form-control" id="reply_${list.bd_rno }" readonly><c:out value="${list.bd_reply}"/></textarea>
									<input type="hidden" name="bd_rno" value="<c:out value="${list.bd_rno}"/>">
									<input type="hidden" name="bd_num" value="<c:out value="${list.bd_num }"/>">
								</td>
							</tr>
							<tr>
						  		<td>
						  			<label>Replyer</label>
						  			<input class="form-control" id="replyer_${list.bd_rno }" readonly value="<c:out value="${list.bd_replyer}"/>">
					  			</td>
						  	</tr>
						  	<tr>
						  		<td>
						  			<label>Password</label>
						  			<input type="hidden" name="bd_reply_pw" value="<c:out value="${list.bd_reply_pw}"/>">
						  			<input type="password" id="reply_pw_ck_${list.bd_rno }" class="form-control" rows="1" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)">
						  			<span style="color:#aaa;">(영문,숫자 혼합 8 ~ 15자리)</span>
					  			</td>
						  	</tr>
							<tr class="text-right">
								<td> 
									[ <fmt:formatDate pattern="yy-MM-dd hh:mm" value="${list.bd_date_reply}"/> ] &nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<div class="panel-heading text-right">
										<br>
										<button onclick="javascript:fn_editReply('${list.bd_num }','${list.bd_rno}','${list.bd_date_reply}','${list.bd_reply_pw}');" style="cursor:pointer;" type="button" class="btn btn-primary pull-right">수정</button>
						  				<button onclick="javascript:fn_reply_delete('${list.bd_rno }','${list.bd_reply_pw}');" style="cursor:pointer;" type="button" class="btn btn-danger pull-right">삭제</button>
						  			</div>
						  		</td>
						  	</tr>
					  	</table>
					 </form>
					 <hr> 	
				</c:forEach>
			</div>
		</div>
		<div style="padding:10px 50px">	
		<!-- 페이징 표시 -->
		 <div class="row">
		 	<div class="col-lg-12">
		 			<div class="panel-footer">
		 			   <ul class="pagination">
		 			   <c:if test="${pageMaker.prev }">
				    <li class="page-item">
				      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1">Prev</a>
				    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="num">
			    	<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
			    		<a href="${num }" class="page-link" href="#">${num }</a>
			    	</li>
			    </c:forEach>
			    <c:if test="${pageMaker.next }">
				    <li class="page-item">
				      <a href="${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
				    </li>
			    </c:if>
			  </ul>
		
		  				<hr>
				</div>
		 	</div>
		 </div>
		     
		 <!-- 페이지번호클릭시, 수정클릭시, 삭제클릭시 상품코드정보 추가 -->
		 <form id="actionForm" action="/board/board_detail2" method="get">
		 	<input type="hidden" name="bd_num" value='<c:out value="${pageMaker.cri.bd_num }" />'>
			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
		</form>
		</div>

	</main>
</body>


<!--댓글 textarea 크기 자동조절 -->
<script type="text/javascript">
$(document).ready(function() {
	$("table").on("keyup", "textarea", function(e) {
		$(this).css("height", "auto");
		$(this).height(this.scrollHeight);
	});
	$("table").find("textarea").keyup();
	
});
</script>
<script>

// 댓글수정 버튼 클릭
function fn_editReply(bd_num,bd_rno,bd_date_reply,bd_reply_pw){
	
	var bd_reply = $('#rno_'+bd_rno+' #reply_'+bd_rno).text();
	
	var bd_replyer = $('#rno_'+bd_rno+' #replyer_'+bd_rno).val();
	
	/* var bd_reply_pw = bd_reply_pw; */
	var bd_reply_pw_ck = $("#reply_pw_ck_"+bd_rno).val();
	
	
	if(bd_reply_pw_ck==null || $.trim(bd_reply_pw_ck) == ""){
		alert("비밀번호를 입력하세요.");
		bd_reply_pw_ck.focus();
	
	}else if(bd_reply_pw != bd_reply_pw_ck){
			alert("비밀번호가 틀립니다.");
			bd_reply_pw_ck.focus();
	
	}else {
		var bd_reply_pw_ck = $.trim(bd_reply_pw_ck);
		
		/* 댓글수정 폼 */
		
		var htmls = "";
		
		htmls += '<form style="padding:10px 50px;" border="0.5" id="rno_'+bd_rno+'" action="/reply/reply_update" method="post">';
		htmls += '<table width="100%" bordercolor="silver">';
		htmls += '  	<tr>	';
		htmls += '		<td width="100%">';
		htmls += '			<label>Reply</label>';
		htmls += '			<textarea class="form-control" id="reply_'+bd_rno+'" name="bd_reply" rows="4" onkeyup="chkword(this, 300)" onmouseout="chkword(this, 300)">';
		htmls += bd_reply;
		htmls += '</textarea>';
		htmls += '			<input type="hidden" name="bd_rno" value="'+bd_rno+'">';
		htmls += '			<input type="hidden" name="bd_num" value="'+bd_num+'">';
		htmls += '		</td>';
		htmls += '	</tr>';
		htmls += '	<tr>';
		htmls += '  		<td>';
		htmls += '  			<label>Replyer</label>';
		htmls += '  			<textarea class="form-control" name="bd_replyer" rows="1" onkeyup="chkword(this, 15)" onmouseout="chkword(this, 15)" >';
		htmls += bd_replyer;
		htmls += '</textarea>';
		htmls += '		</td>';
		htmls += '  	</tr>';
		htmls += '	<tr>';
		htmls += '		<td>';
		htmls += '			<div class="panel-heading text-right">';
		htmls += '				<br>';
		htmls += '				<button onclick="javascript:fn_reply_update('+bd_rno+');" style="cursor:pointer;" type="button" class="btn btn-primary pull-right">저장</button>';
		htmls += '		  		<button onclick="javascript:fn_reply_cancel('+bd_num+');" style="cursor:pointer;" type="button" class="btn btn-primary pull-right">취소</button>';
		htmls += '  			</div>';
		htmls += '  		</td>';
		htmls += '  	</tr>';
		htmls += '</table>';
		htmls += '</form>';
		
		$('#rno_' + bd_rno).replaceWith(htmls);
		$('#rno_' + bd_rno + ' #reply_' + bd_rno).focus();
		
		
	}
	
	
	
}

//댓글수정 저장
function fn_reply_update(bd_rno) {
	
	var result = confirm("수정 하시겠습니까?");
	
	
	if(result){
		var form = $("#rno_"+bd_rno);
		form.submit();
		
		
	}else{
		alert("댓글 수정 실패 했습니다.");
	}
}

//댓글수정 취소
function fn_reply_cancel(bd_num) {
	
	location.href = "/board/board_detail2?bd_num=" + bd_num;
	
}



</script>

<script>
	//댓글삭제
	function fn_reply_delete(bd_rno,bd_reply_pw) {
		
		var result = confirm("정말 삭제 하시겠습니까?");
		
		var bd_reply_pw_ck = $("#reply_pw_ck_"+bd_rno).val();
		
		if(result){
			
			
			if(bd_reply_pw_ck==null || $.trim(bd_reply_pw_ck) == ""){
				alert("비밀번호를 입력하세요.");
				bd_reply_pw_ck.focus();
			
			}else if(bd_reply_pw != bd_reply_pw_ck){
					alert("비밀번호가 틀립니다.");
					bd_reply_pw_ck.focus();
			
			}else {
			
				$.ajax({
					url: '/reply/reply_delete',
					type: 'POST',
					data: {bd_rno : bd_rno},
					dataType: 'text',
					success: function(data){
						if(data == "SUCCESS"){
		                   
						   // 리스트 페이지 이동
							location.href = "/board/board_detail2?bd_num=" + $("#bd_num").val();
					   }
					}
				});
		  
			}
		}else {
			
		   /* location.href = "/board/board_detail2?bd_num=" + $("#bd_num").val(); */
		}
	}

	

</script>

<script type="text/javascript">
	<!--입력 글자수 제한 -->
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
	$("#bd_reply").keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅
	});
</script>

<script>
	$(document).ready(function(){
		
		// 상세정보 ajax로 가져오기
		fn_detail('${bd_num}');
		
		$("#btn_board_list").on("click", function(){
			
			location.href = "/board/board_list";
		});
		
		// 수정 버튼 클릭
	    $("#btn_board_update").on("click", function(){
	        
	    	var form = $("#boardUpdateFrom");
	    
	        var result = confirm("수정 하시겠습니까?");
			if(result){
				
				var bd_title = $("#bd_title");
				var bd_content = $("#bd_content");
				var mem_id = $("#mem_id");
				var mem_pw = $("#mem_pw");
				var mem_pw_ck = $("#mem_pw_ck");
				
				if(bd_title.val()==null || $.trim(bd_title.val()) == ""){
					alert("제목 입력하세요.");
					bd_title.focus();
					
				} else if(bd_content.val()==null || $.trim(bd_content.val()) == ""){
					alert("내용을 입력하세요.");
					bd_content.focus();
					
				} else if(mem_id.val()==null || $.trim(mem_id.val()) == ""){
					alert("작성자를 입력하세요.");
					mem_id.focus();
					
				} else if(mem_pw_ck.val()==null || $.trim(mem_pw_ck.val()) == ""){
					alert("비밀번호를 입력하세요.");
					mem_pw_ck.focus();
				
				} else if(mem_pw.val() != mem_pw_ck.val()){
					alert("비밀번호가 틀립니다.");
					mem_pw_ck.focus();

				} else {
					var bd_title = $.trim(bd_title);
					var bd_content = $.trim(bd_content);
					var mem_id = $.trim(mem_id);
					var mem_pw_ck = $.trim(mem_pw_ck);
					
					form.submit();
				}
			
			}else {
				
			}
			
	    });
	    
		// 게시글 삭제
	    $("#btn_board_delete").on("click", function(){
			
			var result = confirm("정말 삭제 하시겠습니까?");
			
			if(result){
					
				var mem_pw = $("#mem_pw");
				var mem_pw_ck = $("#mem_pw_ck");
				
				if(mem_pw_ck.val()==null || $.trim(mem_pw_ck.val()) == ""){
					alert("비밀번호를 입력하세요.");
					mem_pw_ck.focus();
				
				} else if(mem_pw.val() != mem_pw_ck.val()){
					alert("비밀번호가 틀립니다.");
					mem_pw_ck.focus();

				} else {
				
					$.ajax({
						url: '/board/board_delete',
						type: 'POST',
						data: {bd_num : $("#bd_num").val()},
						dataType: 'text',
						success: function(data){
							if(data == "SUCCESS"){
			                   
							   // 리스트 페이지 이동
							   location.href = "/board/board_list";
						   }
						}
					});
				}
			}	
		});
	
	});

	
	function fn_detail(bd_num){
		
		$.ajax({
			url : '/board/ajaxDetail',
			type : 'GET',
			data : {bd_num: $('#bd_num').val()},
			dataType : 'json',
			success : function(data){
				
				if(data != ""){
					$("#bd_num").val(data.bd_num);
					$("#bd_title").val(data.bd_title);
					$("#bd_content").val(data.bd_content);
					$("#mem_id").val(data.mem_id);
					$("#mem_pw").val(data.mem_pw);
					$("#bd_reply").val(data.bd_reply);
					$("#bd_replyer").val(data.bd_replyer);
					$("#bd_ref").val(data.bd_ref);
					$("#bd_parent").val(data.bd_parent);
					$("#bd_layer").val(data.bd_layer);
				}else{
					alert("게시글이 없습니다.");
				}
			}
		});
	}
</script>
<script>



$(document).ready(function(){
	// 댓글 쓰기
	$("#reply_insert").on("click",function(){
		
		var bd_reply = $("#bd_reply").val();
		var bd_replyer = $("#bd_replyer").val();
		var bd_reply_pw = $("#bd_reply_pw").val();
		
		var num = bd_reply_pw.search(/[0-9]/g);
		var eng = bd_reply_pw.search(/[a-z]/ig);
		/* var spe = bd_reply_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); */
		
		if(bd_reply==null || $.trim(bd_reply) == ""){
			alert("댓글 내용을 입력하세요.");
			bd_reply.focus();
			
		} else if(bd_replyer==null || $.trim(bd_replyer) == ""){
			alert("작성자를 입력하세요.");
			bd_replyer.focus();
			
		} else if(bd_reply_pw==null || $.trim(bd_reply_pw) == ""){
			alert("비밀번호를 입력하세요.");
			bd_reply_pw.focus();
		
		} else if(bd_reply_pw.length < 8 || bd_reply_pw.length > 20){
		    alert("8자리 ~ 15자리 이내로 입력해주세요.");
		    bd_reply_pw.focus();
		
		}else if(bd_reply_pw.search(/\s/) != -1){
		    alert("비밀번호는 공백 없이 입력해주세요.");
		    bd_reply_pw.focus();
		
		}else if(num < 0 || eng < 0){
		    alert("영문,숫자 를 혼합하여 입력해주세요.");
		    bd_reply_pw.focus();
	
		} else {
			var bd_reply = $.trim(bd_reply);
			var bd_replyer = $.trim(bd_replyer);
			var bd_reply_pw = $.trim(bd_reply_pw);
			
			
			
			
			$.ajax({
				url: '/reply/reply_insert',
				type: 'POST',
				data: {bd_num : $("#bd_num").val(), bd_reply : $("#bd_reply").val(), bd_replyer : $("#bd_replyer").val(), bd_reply_pw : $("#bd_reply_pw").val()},
				dataType: 'text',
				success: function(data){
					if(data == "SUCCESS"){
	                   
						// 리스트 페이지 이동
					   //location.href = "/board/board_list";
						
					   location.href = "/board/board_detail2?bd_num=" + $("#bd_num").val();
				   }
				}
			});
		}
		
		
	});
	
	
	
	
	// 답글 쓰기
	$("#board_reply_register").on("click",function(){
		
		$.ajax({
			url: '/reply/reply_register',
			type: 'get',
			data: {bd_num : $("#bd_num").val(), bd_ref : $("#bd_ref").val(), bd_title : $("#bd_title").val()},
			dataType: 'text',
			success: function(){
				//location.href = "/reply/reply_register";
				location.href = "/reply/reply_register?bd_num=" + $("#bd_num").val() + "&bd_parent=" + $("#bd_parent").val() + "&bd_ref=" + $("#bd_ref").val() + "&bd_layer=" + $("#bd_layer").val() + "&bd_title=" + $("#bd_title").val();
			}
		})
		
		//location.href = "/reply/reply_register?bd_num=" + $("#bd_num").val();
	});
	
	// 페이징 번호 클릭
 	var actionForm = $("#actionForm");

	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		/* location.href = "/board/board_detail2?bd_num=" + $("#bd_num").val(); */
		actionForm.submit();
	});
});
</script>

</html>