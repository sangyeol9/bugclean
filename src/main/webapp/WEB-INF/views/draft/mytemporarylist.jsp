<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bug Clean</title>
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
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">내 임시저장 문서</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table mb-0">
								<thead>
									<tr>
										<th>문서번호</th>
										<th>제목</th>
										<th>기안자</th>
										<th>기안일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<c:if test="${list.STATE eq 2}">
											<tr>
												<td>${list.DRAFT_NUM}</td>
												<td><a
													href="getdraftdetail?draft_num=${list.DRAFT_NUM}">${list.TITLE}</a></td>
												<td>${list.NAME}</td>
												<td>${list.DRAFT_DATE}</td>
												<td><span class="badge badge-primary">임시저장</span></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="dataTables_paginate paging_simple_numbers" id="example_paginate"><a class="paginate_button previous disabled" aria-controls="example" data-dt-idx="0" tabindex="0" id="example_previous">Previous</a><span><a class="paginate_button current" aria-controls="example" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="example" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="example" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="example" data-dt-idx="4" tabindex="0">4</a><a class="paginate_button " aria-controls="example" data-dt-idx="5" tabindex="0">5</a><a class="paginate_button " aria-controls="example" data-dt-idx="6" tabindex="0">6</a></span><a class="paginate_button next" aria-controls="example" data-dt-idx="7" tabindex="0" id="example_next">Next</a></div>
 					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<!-- 이전@@@@@@@@@@ -->
							<c:if test="${!pager.start}">
								<li class="page-item"><a class="page-link"
									href="./mytemporarylist?page=${pager.lastNum+1}">Previous</a></li>
							</c:if>


							<!-- 번호@@@@@@@@@@@@ -->
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li class="page-item"><a class="page-link"
									href="./mytemporarylist?page=${i}">${i}</a></li>
							</c:forEach>

							<!-- 다음@@@@@@@@@@@@@@@ -->
							<c:if test="${!pager.last}">
								<li class="page-item"><a class="page-link"
									href="./mytemporarylist?page=${pager.lastNum+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>

				<c:import url="../temp/messenger.jsp"></c:import>
			</div>

		</div>
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- //footer -->
		<c:import url="../temp/js.jsp"></c:import>
		<!-- // bootstrap-template-js -->
</body>
</html>
