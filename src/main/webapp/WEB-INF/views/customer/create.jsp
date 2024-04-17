<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/bugclean/css/customerCreate.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<form method="post">
				<!-- 법인, 개인 체크 박스 -->
				<div id="check">
					<input type="checkbox" id="ck_company" class="ck" onclick="company()" checked="checked"> 
					<label for="ck_company">법인</label> 
					<input type="checkbox" id="ck_person" class="ck" onclick="person()">
					<label for="ck_person">개인</label>
					<input type="hidden" name="customer_Type" id="submit_check" value="법인">
				</div>
				<!-- 체크박스 끝 -->

				<!-- 법인 체크시 노출 시작 -->
				<div id="company">
					<div id="bn_num">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">사업자 번호</button>
						<input class="right-div" id="bn_num_in" type="text"
							placeholder="사업자 번호를 입력하세요." name="business_Num">
					</div>
					<div id="bn_name">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">사업자 명</button>
						<input class="right-div" id="bn_name_in" type="text"
							placeholder="사업자 명을 입력하세요." name="business_Name">
					</div>
					<div id="ceo_name">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">대표자 명</button>
						<input class="right-div" id="ceo_name_in" type="text"
							placeholder="대표자 이름을 입력하세요." name="ceo_Name">
					</div>
					<div id="ceo_phone">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">대표 전화번호</button>
						<input class="right-div" id="ceo_phone_in" type="text"
							placeholder="대표자 전화번호를 입력하세요." name="ceo_Phone">
					</div>
					<div id="addr">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">주소</button>
						<input class="right-div" id="addr_in" type="text"
							placeholder="사업자 주소를 입력하세요." name="address">
					</div>
					<div id="manager_name">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">매니저 명</button>
						<input class="right-div" id="manager_name_in" type="text"
							placeholder="거래처 담당자 명을 입력하세요." name="manager_Name">
					</div>
					<div id="manager_phone">
						<button disabled="disabled"
							class=" btn-square btn-outline-dark left-div">매니저 전화번호</button>
						<input class="right-div" id="manager_phone_in" type="text"
							placeholder="거래처 담당자 전화번호를 입력하세요." name="manager_Phone">
					</div>
					<div id="sales_name">
						<button disabled="disabled"
							class=" btn-square btn-outline-dark left-div">영업 담당자 명</button>
						<input class="right-div" id="sales_name_in" type="hidden"
							placeholder="영업 담당자명을 입력하세요." name="employee_Num">
						<select id="inputSelect" class="emp_choice right-div" >
								<option value="" >담당자 선택</option>
							<c:forEach items="${list}" var="li">
								<option value="${li.employee_num}">${li.employee_num} ${li.name}</option>
							</c:forEach>	
						</select>
					</div>

				</div>
				<!-- 법인 체크시 노출 끝 -->

				<!-- 개인 체크시 노출 시작 -->
				<div id="person1" class="none">

					<div id="addr_person">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">주소</button>
						<input class="right-div" id="addr_person_in" type="text"
							placeholder="고객 주소를 입력하세요." name="address">
					</div>
					<div id="person_name">
						<button disabled="disabled"
							class="btn-square btn-outline-dark left-div">고객명</button>
						<input class="right-div" id="person_name_in" type="text"
							placeholder="고객명을 입력하세요." name="ceo_Name">
					</div>
					<div id="person_phone">
						<button disabled="disabled"
							class=" btn-square btn-outline-dark left-div">고객 전화번호</button>
						<input class="right-div" id="person_phone_in" type="text"
							placeholder="고객 전화번호를 입력하세요." name="ceo_Phone">
					</div>
					<div id="person_sales_name">
						<button disabled="disabled"
							class=" btn-square btn-outline-dark left-div">영업 담당자 명</button>
						<input class="right-div" id="person_sales_name_in" type="hidden"
							placeholder="영업 담당자명을 입력하세요." name="employee_Num">
						<select id="inputSelectPerson" class="emp_choice right-div">
								<option value="" >담당자 선택</option>
							<c:forEach items="${list}" var="li">
								<option value="${li.employee_num}">${li.employee_num} ${li.name}</option>
							</c:forEach>	
						</select>	
					</div>

				</div>
				<!-- 개인 체크시 노출 끝 -->
				
				
				
				
				<!-- 작성완료 후 등록하기 버튼  -->
				<button class="btn-rounded btn-dark create">등록하기</button>
			</form>
			<c:import url="../temp/messenger.jsp"></c:import>
		</div>
	</div>


	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/js.jsp"></c:import>
	<script src="/bugclean/js/customerCreate.js"></script>
</body>
</html>