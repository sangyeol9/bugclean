<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.create {
	width: 100px;
	float: right;
}
</style>
</head>
<c:import url="../temp/css.jsp"></c:import>
<c:import url="./list_css.jsp"></c:import>
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
						<tr>
							<td><a href="./detail?business_Num=${li.business_Num}">
									${li.business_Name}</a></td>

							<td>${li.ceo_Name}</td>
							<td>${li.ceo_Phone}</td>
							<td>${li.manager_Name}</td>
							<td>${li.manager_Phone}</td>
							<td>${li.address}</td>
							<td>${li.sales_Manager}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- 리스트 끝 -->

			<!-- 수정 버튼 -->
			<button id="modi" class="btn-rounded btn-dark create">수정하기</button>

			<c:import url="../temp/messenger.jsp"></c:import>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>

	<c:import url="../temp/js.jsp"></c:import>
</body>
</html>