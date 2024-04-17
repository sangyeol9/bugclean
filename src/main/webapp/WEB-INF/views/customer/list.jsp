<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/bugclean/css/customerList.css" type="text/css" />
</head>
<c:import url="../temp/css.jsp"></c:import>
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

		<c:import url="../temp/sidebar.jsp"></c:import>

		<div class="content-body " style="min-height: 900px;">
			<b>거래처 목록</b>

			<!-- 거래처 추가 버튼 -->
			<a href="./create">
				<button class="btn-rounded btn-dark create">등록하기</button>
			</a>
			<!-- 리스트 시작 -->
			<table class="table customer_list" >
				<tr>
					<th>사업자명</th>
					<th>대표자명</th>
					<th>대표자 번호</th>
					<th>거래처 담당자명</th>
					<th>거래처 담당자 번호</th>
					<th>주소</th>
					<th>영업 담당자명</th>
				</tr>
				<tbody>
					<c:forEach items="${list}" var="li">
						<tr class="list_tr modi_tr">
							<td class="display_none td_customer_num" data-customernum="${li.customer_Num}"></td>
							<td class="display_none td_customer_type" data-customertype="${li.customer_Type}"></td>
							<td class="display_none modi_checkbox" ><input type="checkbox" class="td_checkbox"></td>
							<td>
								<a href="./detail?customer_Num=${li.customer_Num}" class="td_business_name">
									${li.business_Name}
								</a>
							</td>
							<td class="td_ceo_name">${li.ceo_Name}</td>
							<td class="td_ceo_phone">${li.ceo_Phone}</td>
							<td class="td_mng_name">${li.manager_Name}</td>
							<td class="td_mng_phone">${li.manager_Phone}</td>
							<td class="td_address">${li.address}</td>
							<td class="td_sales_mng">${li.sales_Manager}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- 리스트 끝 -->

			<!-- 수정 모달 -->
			<form method="post">
				<div id="modal_myModal" class="modal">
					  <div class="modal-content" style="width : 30%;">
					    <span class="close">&times;</span>
					    <div id="modal_company">
						<input type="hidden" id="type" value="">
						
						<div class="input-group flex-nowrap mt-2" id="modal_bn_name">
							<span class="input-group-text left-div" id="customer_Name">사업자 명</span>
							<input id="modal_bn_name_in" type="text" class="form-control right-div" placeholder="사업자명을 입력하세요." >
					  	</div>
						<div class="input-group flex-nowrap mt-2" id="modal_ceo_name">
							<span class="input-group-text left-div" >대표자 명</span>
							<input id="modal_ceo_name_in" type="text" class="form-control right-div" placeholder="대표자명을 입력하세요." >
					  	</div>
						<div class="input-group flex-nowrap mt-2" id="modal_ceo_phone">
							<span class="input-group-text left-div" >대표 전화번호</span>
							<input id="modal_ceo_phone_in" type="text" class="form-control right-div" placeholder="대표자 전화번호를 입력하세요." >
					  	</div>						
						<div class="input-group flex-nowrap mt-2" id="modal_addr">
							<span class="input-group-text left-div" >주소</span>
							<input id="modal_addr_in" type="text" class="form-control right-div" placeholder="사업자 주소를 입력하세요." >
					  	</div>						
						<div class="input-group flex-nowrap mt-2" id="modal_manager_name">
							<span class="input-group-text left-div" >담당자 명</span>
							<input id="modal_manager_name_in" type="text" class="form-control right-div" placeholder="거래처 담당자명을 입력하세요." >
					  	</div>						
						<div class="input-group flex-nowrap mt-2" id="modal_manager_phone">
							<span class="input-group-text left-div" >담당자 전화번호</span>
							<input id="modal_manager_phone_in" type="text" class="form-control right-div" placeholder="거래처 담당자 전화번호를 입력하세요." >
					  	</div>	 
						<div class="input-group flex-nowrap mt-2" id="modal_sales_name">
							<span class="input-group-text left-div" >영업 담당자 명</span>
							<input id="modal_sales_name_in" type="text" class="form-control right-div" placeholder="영업 담당자명을 입력하세요." >
							
						</div>	 
					     
					    </div>
					      <button id="modi_com" type="button" class="btn-rounded btn-dark create" onclick="modiComplate()">수정 완료</button>
					  </div>
					</div>
				</form>	
			<!-- 수정 모달 끝 -->
			
			

			<c:import url="../temp/messenger.jsp"></c:import>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/js.jsp"></c:import>
	<script src="/bugclean/js/customerList.js"></script>
</body>
</html>