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

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">거래처 목록</h4>
								<!-- 거래처 추가 버튼 -->
								<a href="./create">
									<button class="btn btn-light create">등록하기</button>
								</a>
							</div>
							<div class="card-body">
								<ul class="nav nav-tabs" role = "tablist">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#company">
											<span>사업자</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#person">
											<span>개인</span>
										</a>
									</li>
								</ul>
								<div class="table-responsive">
									<div id="example_wrapper" class="dataTables_wrapper">
										<!-- 리스트 시작 -->
										<div class="tab-content tabcontent-border">
											<!-- 법인 거래처 -->
											<div class="tab-pane fade active show" id="company" role="tabpanel">
												<table id="example" role="grid" class="table customer_list display dataTable" >
													<thead>
														<tr role="row">
															<th>구분</th>
															<th>사업자명</th>
															<th>대표자명</th>
															<th>대표자 번호</th>
															<th>거래처 담당자</th>
															<th>담당자 번호</th>
															<th>주소</th>
															<th>영업 담당자</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${companyList}" var="li">
															<tr class="list_tr modi_tr odd">
																<td class="display_none td_customer_num" data-customernum="${li.customer_Num}"></td>
																<td class="display_none td_customer_type" data-customertype="${li.customer_Type}"></td>
																<td class="display_none modi_checkbox" ><input type="checkbox" class="td_checkbox"></td>
																<td class="td_customer_kind">${li.customer_Kind}</td>
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
																<td class="td_sales_mng">${li.employee_Name}</td>
																<td class="real_sales_mng display_none">${li.employee_Num}</td>
															</tr>
														</c:forEach>
													</tbody>
	
												</table>
											</div>		
											<!-- 법인 거래처 끝 -->
											<!-- 개인 거래처 시작 -->
											<div class="tab-pane fade" id="person" role="tabpanel">
												<div class="tab-pane fade active show" id="person" role="tabpanel">
													<table id="example2" role="grid" class="table customer_list display dataTable" >
														<thead>
															<tr role="row">
																<th>고객 명</th>
																<th>고객 전화번호</th>
																<th>주소</th>
																<th>영업 담당자명</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${personList}" var="li">
																<tr class="list_tr modi_tr odd">
																	<td class="display_none td_customer_num" data-customernum="${li.customer_Num}"></td>
																	<td class="display_none td_customer_type" data-customertype="${li.customer_Type}"></td>
																	<td class="display_none modi_checkbox" ><input type="checkbox" class="td_checkbox"></td>
																	<td class="td_ceo_name">
																		<a href="./detail?customer_Num=${li.customer_Num}" class="td_business_name">
																			${li.ceo_Name}	
																		</a>
																	</td>
																	<td class="td_ceo_phone">${li.ceo_Phone}</td>
																	<td class="td_address">${li.address}</td>
																	<td class="td_sales_mng">${li.employee_Name}</td>
																	<td class="real_sales_mng display_none">${li.employee_Num}</td>
																</tr>
															</c:forEach>
														</tbody>
		
													</table>
												</div>		
											</div>
											<!-- 개인 리스트 끝 -->
										</div>

										<!-- 리스트 끝 -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			
			

			<!-- 수정 모달 -->
			<form method="post">
				<div id="modal_myModal" class="modal">
						
					  <div class="modal-content" style="width : 30%;">
						<span class="close">&times;</span>
						<div class="modal-head-tool">
							<h4><b>거래처 정보 수정</b></h4>
						</div>
						<div id="modal_company">
						<input type="hidden" id="type" value="">
						
						<div class="input-group flex-nowrap mt-2" id="modal_bn_name">
							<span class="input-group-text left-div" id="customer_Name">사업자 명</span>
							<input id="modal_bn_name_in" type="text" class="form-control right-div" placeholder="사업자명을 입력하세요." >
						  </div>
						<div class="input-group flex-nowrap mt-2" id="modal_ceo_name">
							<span id="modal_ce_name_span" class="input-group-text left-div" >대표자 명</span>
							<input id="modal_ceo_name_in" type="text" class="form-control right-div" placeholder="대표자명을 입력하세요." >
						  </div>
						<div class="input-group flex-nowrap mt-2" id="modal_ceo_phone">
							<span id="modal_ce_phone_span" class="input-group-text left-div" >대표 전화번호</span>
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
							<input id="modal_sales_name_in" type="hidden" class="form-control right-div" placeholder="영업 담당자명을 입력하세요." >
							<select id="inputSelect" class="emp_choice right-div" style="width: 37%;">
								<option class="base_selected" id="salse_choice_base" value="" >담당자 선택</option>
							<c:forEach items="${sales_List}" var="li">
								<option class="sales_choice_value" value="${li.employee_num}">${li.employee_num} ${li.name}</option>
							</c:forEach>	
						</select>
						</div>	 
						 
						</div>
						  <button id="modi_com" type="button" class="btn btn-primary create" onclick="modiComplate()">수정</button>
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