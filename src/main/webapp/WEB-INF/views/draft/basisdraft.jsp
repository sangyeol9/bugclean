<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Focus - Bootstrap Admin Dashboard</title>
<!-- Favicon icon -->
<c:import url="../temp/css.jsp"></c:import>
<link rel="stylesheet" href="/bugclean/css/draft/basisdraftmodal.css">
<link rel="stylesheet" href="/bugclean/css/draft/basisdraftorg.css">
<link rel="stylesheet" href="/bugclean/css/draft/basisdraft.css">
</head>

<body>
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<!--*******************
        Preloader start
    ********************-->

		<!--*******************
        Preloader end
    ********************-->


		<!--**********************************
        Main wrapper start
    ***********************************-->


		<!--**********************************
            Nav header start
        ***********************************-->

		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<c:import url="../temp/header.jsp"></c:import>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<c:import url="../temp/sidebar.jsp"></c:import>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body" style="min-height: 877px;">
			<!-- 기안서 제목 시작 -->
			<div id="standardDraftDiv">
				<div>
					<h1 id="title">기안서</h1>
				</div>
				<!-- 기안서 제목 끝 -->

				<!--  결재선 편집버튼 시작 -->

				<!-- 결재선 편집버튼 끝 -->

				<!-- 결재선 시작 -->
				<div id="draftLine">
				
					<div id="lineBtnDiv">
						<button id="lineBtn" class="lineBtnDiv">
							편<br>집<br>하<br>기
						</button>
					</div>
					
					<div id="saveBtnDiv">
						<button id="saveBtn">
							결<br>재<br>선<br>저<br>장
						</button>
					</div>
					
					<table border="1">
						<tr id="input_grade">
							<td rowspan="4">결재선</td>
							<td>기안자</td>
						</tr>
						<tr id="input_blank">
							<td></td>
						</tr>
						<tr id="input_name">
							<td>${empMap.NAME}</td>
						</tr>
						<tr>
							<td class="date"></td>
						</tr>
					</table>

				</div>

				<!-- 결재선 끝 -->

				<!-- 모달창 css 시작 -->
				<!-- 모달창 css 끝 -->




				<!-- 기안서양식 시작 -->
				<div id="basisDraft">
					<table border="1">
						<tr>
							<td class="basisTitleTd">기안자</td>

							<td class="basisTd"><input class="inp" type="text"
								value="${empMap.NAME}" disabled></td>
							<td class="basisTitleTd">소속부서</td>
							<td class="basisTd"><input class="inp" type="text"
								value="${empMap.DEP_NAME }" disabled></td>
						</tr>

						<tr>
							<td class="basisTitleTd">기안일자</td>
							<td class="basisTd"><input class="inp" type="text"
								value="${draftVO.draft_date}" disabled></td>
							<td class="basisTitleTd" rowspan="4">첨부파일</td>
							<td class="basisTd" rowspan="4" colspan="2"></td>
						</tr>
						<tr>
							<td class="basisTitleTd">문서번호</td>
							<td class="basisTd"><input class="inp" type="text"
								value="${draftVO.draft_num}" disabled></td>
						</tr>
						<tr>
							<td class="basisTitleTd">제목</td>
							<td class="basisTd"><input class="inp" type="text"></td>
						</tr>
						<tr>
							<td class="basisTitleTd">참조</td>
							<td class="basisTd"><input id="refInp" class="inp" type="text" disabled></td>
						</tr>
						<tr style="height: 300px;">
							<td class="basisTitleTd">내용</td>
							<td class="basisTitleTd" colspan="4"><input class="inp"
								type="text"></td>
						</tr>
						<tr style="height: 130px;">
							<td class="basisTitleTd">의견</td>
							<td class="basisTitleTd" colspan="4"><input class="inp"
								type="text"></td>
						</tr>
					</table>
				</div>
				<!-- 기안서양식 끝 -->

				<!-- 버튼모음 시작 -->
				<div id="btn">
					<button>승인하기</button>
					&nbsp;&nbsp;&nbsp;
					<button>반려하기</button>
					&nbsp;&nbsp;&nbsp;
					<button>임시저장</button>
					&nbsp;&nbsp;&nbsp;
					<button>삭제하기</button>
					&nbsp;&nbsp;&nbsp;
					<button>파일첨부</button>
				</div>
				<!-- 버튼모음 끝 -->

				<!-- 모달창 시작 -->
				<div id="modalBack" class="noshow">
					<div id="modal" class="noshow">
						<!-- 셀렉트 시작 -->
						<div id="selete1">
							<select id="selete1">
								<option>자주쓰는결재선</option>
								<option>박성제1</option>
								<option>박성제2</option>
							</select>
						</div>
						<!-- 셀렉트 끝 -->

						<!-- 제목 시작 -->
						<div id="draftLineTitle">
							<h3>결재선 설정</h3>
						</div>
						<!-- 제목 끝 -->

						<!-- 결재선 제목 시작 -->
						<div id="draftTitle">
							<h4>결재선</h4>
						</div>
						<!-- 결재선 제목 끝 -->

						<!-- 결재선 버튼 시작 -->
						<div id="draftBtnDiv">
							<i id="draftBtnMinus" class="fa-solid fa-square-caret-left fa-2x"
								style="display: inline-block;"></i>
							<h3 style="display: inline-block;">결재</h3>
							<i id="draftBtnPlus" class="fa-solid fa-square-caret-right fa-2x"
								style="display: inline-block;"></i>
						</div>
						<!-- 결재선 버튼 끝 -->

						<!-- 참조 버튼 시작 -->
						<div id="refBtn">
							<i id="refMinusBtn" class="fa-solid fa-square-caret-left fa-2x"></i>
							<h3 style="display: inline-block;">참조</h3>
							<i id="refPlusBtn" class="fa-solid fa-square-caret-right fa-2x"
								style="display: inline-block;"></i>
						</div>
						<!-- 참조 버튼 끝 -->

						<!-- 결재선 박스 시작 -->
						<div id="draftBox">
							<table border="1">
								<tr style="height: 140px;" id="draftBoxTr">
									<td style="width: 200px; vertical-align: top;" id="draftBoxTd">
									</td>
								</tr>
							</table>
						</div>
						<!-- 결재선 박스 끝 -->
						<!-- 참조 제목 시작 -->
						<div id="refTitle">
							<h4>참조</h4>
						</div>
						<!-- 참조 제목 시작 -->

						<!-- 참조 박스 시작 -->

						<div id="refBox">
							<table border="1">
								<tr style="height: 140px">
									<td style="width: 200px; vertical-align: top;" id="refBoxTd"></td>
								</tr>
							</table>
						</div>
						<!-- 닫기 버튼 시작 -->
						<div id="modalCloseBtn">
							<span class="close">&times;</span>
						</div>
						<!-- 닫기 버튼 끝 -->

						<!-- 등록 버튼 시작 -->
						<div id="modalCreateBtnDiv">
							<button id="modalCreateBtn">등록</button>
						</div>
						<!-- 등록 버튼 끝 -->

						<!-- 초기화 버튼 시작 -->
						<div id="modalResetBtn">
							<button>초기화</button>
						</div>
						<!-- 초기화 버튼 끝 -->


						<!-- 조직도 제목 시작 -->
						<div id="orgTitle">
							<h4>조직도</h4>
						</div>
						<!-- 조직도 제목 끝-->

						<!-- 조직도 시작 -->
						<div id="orgDiv">

							<table border="1">
								<tr style="height: 350px;">
									<td style="width: 200px; vertical-align: top;" id="orgBoxTd">
										<!-- 부서 리스트 시작--> <c:forEach items="${dep}" var="dep">
											<div class="orgTeamDiv">
												<c:if test="${dep.dep_name ne '사장'}">
													<i class="fa-solid fa-minus minusIcon"
														style="display: none;"></i>
													<i class="fa-solid fa-plus plusIcon"
														style="display: inline-block;"></i>
													<i class="fa-solid fa-users"></i>
													<h5 style="display: inline-block;" class="orgDep">${dep.dep_name}</h5>
												</c:if>
												<br>
												<!-- 사원리스트 시작 -->
												<div data-dep-name="${dep.dep_name}" class="orgPepleDiv">
													<c:forEach items="${list}" var="list">
														<c:if test="${list.DEP_NAME eq dep.dep_name}">
															<div class="orgPepleSpan"
																style="display: inline-block; padding-left: 20px">
																<i class="fa-solid fa-user"
																	style="display: inline-block;"></i>
																<h6 style="display: inline-block;" class="orgAll"
																	data-emp-num="${list.EMPLOYEE_NUM}"
																	data-dep-name="${list.DEP_NAME}"
																	data-pp-name="${list.NAME }">${list.DEP_NAME}
																	${list.POS_NAME} ${list.NAME}</h6>
															</div>
														</c:if>
													</c:forEach>
												</div>
												<!-- 사원 리스트 끝 -->
											</div>
										</c:forEach> <!-- 부서리스트 끝 -->
									</td>
								</tr>
							</table>
						</div>

						<!-- 조직도 끝 -->

					</div>
				</div>
				<!-- 모달창 끝 -->
			</div>
			<!--**********************************
            Content body end
        ***********************************-->


			<!--**********************************
            Footer start
        ***********************************-->
		</div>
		<c:import url="../temp/footer.jsp"></c:import>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


		<%-- 			<!-- 부서 리스트 시작-->
										<c:forEach items="${dep}"
											var="dep">
											<div class="orgTeamDiv">
													<c:if test="${dep.dep_name ne '사장'}">
												<i class="fa-solid fa-minus minusIcon" style="display: none;"></i> <i
													class="fa-solid fa-plus plusIcon"
													style="display: inline-block;"></i> <i
													class="fa-solid fa-users"></i>
												<h5 style="display: inline-block;" class="orgDep">${dep.dep_name}</h5>
												</c:if>
												<br>
												<!-- 사원리스트 시작 -->
											 <div data-dep-name="${dep.dep_name}" class="orgPepleDiv">
												<c:forEach items="${list}" var="list">
												<c:if test="${list.DEP_NAME eq dep.dep_name}">
												<div class="orgPepleSpan"
													style="display: inline-block; padding-left: 20px">
													<i class="fa-solid fa-user" style="display: inline-block;"></i>
													<h6 style="display: inline-block;" class="orgAll" data-dep-name="${list.DEP_NAME}">${list.DEP_NAME} ${list.POS_NAME} ${list.NAME}</h6>
												</div>
											</c:if>
											</c:forEach>
											</div>
											<!-- 사원 리스트 끝 -->
										</div>
										</c:forEach>
										<!-- 부서리스트 끝 -->  --%>


		<!-- ////////////////////////////////////////////// -->



		<%-- 									<c:forEach items="${depHighAr}" var="dephighar">
									<div class="orgHighTeamDiv">
										<i class="fa-solid fa-minus highMinusIcon" style="display: none;"></i> <i
												class="fa-solid fa-plus highPlusIcon"
												style="display: inline-block;"></i> <i
												class="fa-solid fa-users"></i>
											<h5 style="display: inline-block;" class="orgDep">${dephighar.dep_name}</h5>											
											<br>
									<!-- 부서 리스트 시작-->	
										<div class="orgTeamBigDiv">
										<c:forEach items="${dep}"
											var="dep">
											<c:if test="${dep.upper_dep_code eq dephighar.dep_code }">
											<div class="orgTeamDiv">
												<i class="fa-solid fa-minus minusIcon" style="display: none;"></i> <i
													class="fa-solid fa-plus plusIcon"
													style="display: inline-block;"></i> <i
													class="fa-solid fa-users"></i>
												<h5 style="display: inline-block;" class="orgDep">${dep.dep_name}</h5>											
												<br>
												</c:if>
												<!-- 사원리스트 시작 -->
											 <div data-dep-name="${dep.dep_name}" class="orgPepleDiv">
												<c:forEach items="${list}" var="list">
												<c:if test="${list.DEP_NAME eq dep.dep_name}">
												<div class="orgPepleSpan"
													style="display: inline-block; padding-left: 20px">
													<i class="fa-solid fa-user" style="display: inline-block;"></i>
													<h6 style="display: inline-block;" class="orgAll" data-dep-name="${list.DEP_NAME}">${list.DEP_NAME} ${list.POS_NAME} ${list.NAME}</h6>
												</div>
											</c:if>
											</c:forEach>
											</div>
											<!-- 사원 리스트 끝 -->
										</div>
										</c:forEach>
										</div>
										<!-- 부서리스트 끝 -->
										
										</div>
										</c:forEach> --%>

		<!--**********************************
        Main wrapper end
    ***********************************-->


		<!--**********************************
        Scripts
    ***********************************-->
		<!-- Required vendors -->
		<script src="https://kit.fontawesome.com/17a98cc585.js"
			crossorigin="anonymous"></script>
		<c:import url="../temp/js.jsp"></c:import>

		<script src="/bugclean/js/draft/basisdraftorg.js"></script>
		<script src="/bugclean/js/draft/basisdraftmodal.js"></script>
</body>