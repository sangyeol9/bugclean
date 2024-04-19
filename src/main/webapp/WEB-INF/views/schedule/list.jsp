<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bugclean/css/scheduleList.css">
</head>
<c:import url="../temp/css.jsp"></c:import>
<!-- //bootstrap-template-css -->
<body>
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<div id="main-wrapper">

		<c:import url="../temp/header.jsp"></c:import>
		<!-- //nav-header -->
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!-- //sidebar-menu -->

		<div class="content-body " style="min-height: 900px;">
			<div id="sch_Color">
				<span style="color:black">&#x25CF; :  일반</span>  
				<span style="color : red; padding-left: 2ch;">&#x25CF; : 긴급</span>
				<span style="color: grey; padding-left: 2ch;">&#x25CF; :</span> <span style="text-decoration: line-through; "> 취소</span>
			</div>
			<div id='calendar'></div>


			<!-- 모달 창 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeModal()">&times;</span>
					<div id="title_div">
						<h2 id="modal-title"></h2>
					</div>
					<p id="modal-content"></p>
						<div class="input-group flex-nowrap mt-2">
							<input id="radioBase" type="radio" name="type" value="일반" class="inputRadio">
							<label for="radioBase">일반</label>
							<input id="radioEmer" type="radio" name="type" value="긴급" class="inputRadio">
							<label for="radioEmer">긴급</label>
						</div>
						<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="customer_Name">거래처명</span>
							<input id="inputTitle" type="hidden" class="form-control" placeholder="거래처명을 입력하세요." >
							<select id="inputSelectCustomerName" class="emp_choice">
								<option class="base_selected" id="emp_choice_base" value="" >거래처 선택</option>
							<c:forEach items="${customerList}" var="li">
								<option class="emp_choice_value" value="${li.customer_Num}">${li.business_Name} ${li.ceo_Name}</option>
							</c:forEach>	
						</select>
					  	</div>
					  	<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="manager_Name">영업 담당자명</span>
							<input id="inputSales" type="hidden" class="form-control" placeholder="담당자를 선택하세요." >
							<select id="inputSelect" class="emp_choice">
									<option class="base_selected" id="salse_choice_base" value="" >담당자 선택</option>
								<c:forEach items="${list}" var="li">
									<option class="sales_choice_value" value="${li.employee_num}">${li.employee_num} ${li.name}</option>
								</c:forEach>	
							</select>
					  	</div>
						<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="start_Time"></span>
							<input id="inputStart" type="text" class="form-control" placeholder="시작 시간을 입력하세요." > ~
							<input id="inputEnd" type="text" class="form-control" placeholder="종료 시간을 입력하세요." >
					  	</div>
						
						<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="employee_Num">현장 관리자</span>
						  	<input id="inputSiteManager" type="hidden" class="form-control"  >
							<select id="inputSelect_emp" class="emp_choice">
								<option class="base_selected" id="site_choice_base" value="">담당자 선택</option>
							<c:forEach items="${list_emp}" var="li">
								<option class="site_choice_value" value="${li.employee_num}">${li.employee_num} ${li.name}</option>
							</c:forEach>	
						</select>
						</div>
						<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="manage_Code">배차 정보</span>
						  	<input type="text" class="form-control" value="미정" id="input_carAllocation" >
						  	<select id="carAllocation" class="form-select" onchange="changeSelect()">
						  		<option value="">배차요청</option>
						  		<option value="28나 2033">28나 2033</option>
						  		<option value="03서 3002">03서 3002</option>
						  	</select>
						</div>
						<div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="address">주소</span>
							<input id="inputAddress"  type="text" class="form-control" placeholder="주소를 입력하세요." >
					  	</div>
						  <div class="input-group flex-nowrap mt-2">
							<span class="input-group-text" id="price">단가</span>
							<input id="inputPrice" type="text" class="form-control" placeholder="단가를 입력하세요." >
					  	</div>
					  	
							<button class="btn-rounded btn-dark create mt-3" id="create_sch_btn">등록하기</button>
						 <div> 
						  	<button type="button" class="btn-rounded btn-dark updel mt-3" id="update_sch_btn">수정하기</button>
							<button type="button" class="btn-rounded btn-dark updel mt-3" id="delete_sch_btn">삭제하기</button>
						</div>	
					</div>	
			</div>


			<c:import url="../temp/messenger.jsp"></c:import>
		</div>

	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- //footer -->
	<c:import url="../temp/js.jsp"></c:import>
	<!-- // bootstrap-template-js -->

	<!-- fullcalendar api cdn download -->
	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
	<script src="/bugclean/js/scheduleList.js"></script>
</body>
</html>