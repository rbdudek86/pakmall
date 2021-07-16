<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 숫자,통화,날짜 통화 값 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<!-- css file -->
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%@include file="/WEB-INF/views/common/config.jsp"%>
<!-- nav.jsp -->
	<%@include file="/WEB-INF/views/common/nav.jsp"%>

</head>


			<!-- Main content -->
			<section class="content container-fluid">
			
			<div class="row" >
				<div class="col-lg-12">
					<form id="searchForm" action="/member/order/order_list" method="get" style="padding:60px 30px">
						<select name="type" id="type">
							<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
							<option value="N" <c:out value="${pageMaker.cri.type == 'N' ? 'selected':'' }" />>상품명</option>
							<option value="D" <c:out value="${pageMaker.cri.type == 'D' ? 'selected':'' }" />>상품설명</option>
							<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>상품회사</option>
							<option value="ND" <c:out value="${pageMaker.cri.type == 'ND' ? 'selected':'' }" />>상품명 or 상품설명</option>
							<option value="NC" <c:out value="${pageMaker.cri.type == 'NC' ? 'selected':'' }" />>상품명 or 상품회사</option>
							<option value="NDC" <c:out value="${pageMaker.cri.type == 'NDC' ? 'selected':'' }" />>상품명 or 내용 or 상품회사</option>
						</select>
						<input type="text" name="keyword" value="${ pageMaker.cri.keyword}">
						<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${ pageMaker.cri.amount}">
						<button id="btnSearch" type="button" class="btn btn-primary">검색</button>
						<!-- Criteria로 보냄 -->
						
					</form>
				</div>
			</div>
			
			<!-- 상품리스트 -->
			<div class="row">
		    	<div class="col-lg-12">
		    		<div class="panel panel-default">
		    			
		    			<div class="panel-body">
		    			 <!-- 리스트 -->
		    			 <table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">선택</th>
						      <th scope="col">번호</th>
						      <th scope="col">주문일시</th>
						      <th scope="col">주문번호</th>
						      <th scope="col">주문자</th>
						      <th scope="col">받는분</th>
						      <th scope="col">금액</th>
						      <th scope="col">처리상태</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						  <c:forEach items="${order_list }" var="orderVO" varStatus="status" >
						    <tr>
						      <th scope="row"><input type="checkbox" value="${orderVO.odr_code }"></th>
						      <td>
						      	${(cri.pageNum - 1) * cri.amount + status.count}
						      </td>
						      
						      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderVO.odr_date }"/></td>
						      
						      <td>
						      	${orderVO.odr_code }
						      	<button type="button" name="btn_order_detail" data-odr-code="${orderVO.odr_code }" class="btn btn-link">Order Detail</button>
						      </td>
						      
						      <td>
						     	${orderVO.mem_id }
						      </td>
						      
						      <td>
						      	${orderVO.odr_name }
						      </td>
						      
						      <td>
						      	<fmt:formatNumber type="currency" value="${orderVO.odr_total_price }"></fmt:formatNumber>
						      </td>
						      <td>
						      	처리상태
						      </td>
						      <td>
						      
						      
						    </tr>
						   </c:forEach>
						   
						   </tbody>
						</table>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		   
		    <!-- 페이징 표시 --> 
		    <div class="row">
		    	<div class="col-lg-12">
		    	<!-- 페이징 표시 -->
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
			    				${pageMaker }
	    			</div>
		    	</div>
		    </div>
		    
		    <!-- 페이지번호클릭시, 수정클릭시, 삭제클릭시 상품코드정보 추가 -->
		    <form id="actionForm" action="/member/order/order_list" method="get">
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
				<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
			</form>

			</section>
			<!-- /.content -->

		<!-- Main Footer -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active">
					<a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a>
				</li>
				<li>
					<a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>

							</a>
						</li>
					</ul>

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	<!-- REQUIRED JS SCRIPTS -->

	<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>

<script>
// 주문상세 ajax작업 
$(document).ready(function(){

	//<button type="button" name="btn_order_detail" data-odr-code="${orderVO.odr_code }"
	$("button[name='btn_order_detail']").on("click", function(){

		console.log("상품상세");

		//주문번호 확보
		var odr_code = $(this).attr("data-odr-code");

		console.log(odr_code);

		var current_tr = $(this).parents("tr");
		
		//var odrDetailList = $(this);
		//var url = "/order/orderDetailList/" + odr_code;

		//ajax호출작업 : url? 컨트롤러 매핑주소 생성하고, Postman 테스트
		$.ajax({
			url : "/admin/order/order_detail_list", // 주문번호에 해당하는 주문상세내역 주소
			type : 'get',
			data : {odr_code : odr_code}, // <input type="text" name="odr_code" value="20"
			dataType : 'json', // 서버로부터 받아오는 데이터 형태
			success : function(data){
				
				//alert(data.length);
				// 함수호출 subCategoryList
				orderDetailView(data,current_tr,$("#orderDetailTemplate"));
			}
		});				
	});
});

		var orderDetailView = function(orderDetailData, orderDetailTarget, orderDetailTemplate){
		var detailTemplate = Handlebars.compile(orderDetailTemplate.html());
		var details = detailTemplate(orderDetailData);

		console.log(details);

		$(".dy_order_detail").remove(); //기존 option태그 제거
		orderDetailTarget.after(details); // 새로운 2차카테고리 option태그 추가
	}
</script>

<!--주문상세 데이터와 결합될 태그를 구성 (핸들바)-->
<script id="orderDetailTemplate" type="text/x-handlebars-template">
	
	<tr class="dy_order_detail"><td colspan="8">주문상세내역</td></tr>
	<tr class="dy_order_detail">
		<th>선택</th><th>번호</th><th>상품명</th><th>수량</th><th>상품가격</th><th>소계</th><th colspan="2">비고</th>
	</tr>
	{{#each .}}
	<tr class="dy_order_detail">
		<td>선택</td>
		<td>번호</td>
		<td>
			<img src="/admin/order//displayFile?fileName={{pdt_img}}">
			{{pdt_name}}
		</td>
		<td>{{odr_amount}}</td>
		<td>{{odr_price }}</td>
		<td>{{total_price odr_price odr_amount}}</td>
		<td colspan="2">비고</td>
	</tr>
	{{/each}}
</script>

<script>
// 핸들바의 사용자정의 함수

Handlebars.registerHelper("total_price", function(odr_price, odr_amount){
	
	return odr_price * odr_amount;
});

</script>


<script src="/js/admin/product/insert.js"></script>

<script>
	$(document).ready(function(){

		// 페이징 번호 클릭
		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e){
			e.preventDefault();

			console.log("click");

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));			
			actionForm.submit();

		});

		// 검색버튼 클릭 
		var searchForm = $("#searchForm");

		$("#searchForm #btnSearch").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}

			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		// 수정버튼 클릭 (table태그 아래 td)
		$("table td .btn-edit").on("click", function(){
			console.log('수정');

			// actionForm 아래 input태그 넣기
			actionForm.append("<input type='hidden' name='pdt_num' value='" + $(this).attr("data-pdt_num") + "'>");
			
			actionForm.attr("action", "/admin/product/modify");
			actionForm.submit();
		});

		// 삭제버튼 클릭
		$("table td .btn-del").on("click", function(){
			console.log('수정');

			// actionForm 아래 input태그 넣기
			
			actionForm.append("<input type='hidden' name='pdt_num' value='" + $(this).attr("data-pdt_num") + "'>");
			actionForm.append("<input type='hidden' name='pdt_img' value='" + $(this).attr("data-pdt_img") + "'>");
			
			actionForm.attr("action", "/admin/product/delete");
			actionForm.submit();
		});

	});
</script>
</body>
</html>