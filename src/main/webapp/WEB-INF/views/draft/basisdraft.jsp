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
		<style>
#draftLine {
	position: absolute;
	display: inline-block;
	right: 65px;
	top: 10px;
	right: 65px;
}

td {
	width: 50px;
	height: 35px;
}

.date {
	width: 20px;
	height: 20px;
}

table {
	color: black;
}

#lineBtnDiv {
	position: absolute;
	display: inline-block;
	left: 750px;
	top: 30px;
}

#title {
	position: absolute;
	display: inline-block;
	left: 250px;
	top: 60px;
}

#basisDraft {
	position: absolute;
	display: inline-block;
	left: 110px;
	top: 200px;
	text-align: center;
}

.basisTd {
	height: 50px;
	width: 400px;
}

.basisTitleTd {
	height: 50px;
	width: 100px;
}

.basisContentsTd {
	height: 50px;
	width: 300px;
}

#btn {
	position: absolute;
	left: 380px;
	bottom: 150px;
}

.inp {
	border: none;
	background-color: transparent;
	height: 100%;
	width: 100%;
}

#standardDraftDiv {
	position: relative;
	width: 1100px;
	height: 1100px;
}
</style>
		<div class="content-body" style="min-height: 877px;">
			<!-- 기안서 제목 시작 -->
			<div id="standardDraftDiv">
				<div>
					<h1 id="title">기안서</h1>
				</div>
				<!-- 기안서 제목 끝 -->

				<!--  결재선 편집버튼 시작 -->
				<div id="lineBtnDiv">
					<button id="lineBtn">
						편<br>집<br>하<br>기
					</button>
				</div>
				<!-- 결재선 편집버튼 끝 -->

				<!-- 결재선 시작 -->
				<div id="draftLine">
					<table border="1">
						<tr>
							<td rowspan="4">결재선</td>
							<td>기안자</td>
							<td>팀장</td>
							<td>부장</td>
							<td>사장</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td class="date"></td>
							<td class="date"></td>
							<td class="date"></td>
							<td class="date"></td>
						</tr>
					</table>
				</div>
				<!-- 결재선 끝 -->

				<!-- 모달창 css 시작 -->
				<style>
.noshow {
	display: none;
}

#selete1 {
	position: absolute;
	left: 15px;
	top: 10px;
}

#draftLineTitle {
	position: absolute;
	left: 290px;
	top: 30px;
}

#draftBox {
	position: absolute;
	right: 25px;
	top: 100px;
}

#draftTitle {
	position: absolute;
	right: 95px;
	top: 60px;
}

#draftBtnDiv {
	position: absolute;
	left: 305px;
	top: 160px;
	display: inline-block;
}

#refBtn {
	position: absolute;
	left: 305px;
	bottom: 110px;
}

#refTitle {
	position: absolute;
	right: 105px;
	bottom: 200px;
	display: inline-block;
}

#refBox {
	position: absolute;
	right: 25px;
	bottom: 55px;
	display: inline-block;
}

#modal {
	position: relative;
	left: 210px;
	top: 30px;
	width: 700px;
	height: 500px;
	background-color: white;
	z-index: 101;
}

#modalBack {
	width: 2000px;
	height: 900px;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 100;
}

#modalCreateBtn {
	position: absolute;
	bottom: 50px;
	left: 300px;
	z-index: 200;
}

#modalCloseBtn {
	position: absolute;
	top: 20px;
	right: 35px;
	z-index: 200;
}

#modalResetBtn {
	position: absolute;
	bottom: 50px;
	left: 370px;
	z-index: 200;
}

#draftBtnMinus {
	z-index: 300;
}

#draftBtnPlus {
	z-index: 300;
}
</style>
				<!-- 모달창 css 끝 -->

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
							<i class="fa-solid fa-square-caret-left fa-2x"></i>
							<h3 style="display: inline-block;">참조</h3>
							<i class="fa-solid fa-square-caret-right fa-2x"
								style="display: inline-block;"></i>
						</div>
						<!-- 참조 버튼 끝 -->

						<!-- 결재선 박스 시작 -->
						<div id="draftBox">
							<table border="1">
								<tr style="height: 140px;">
									<td style="width: 200px; vertical-align: top;'" id="draftBoxTd"></td>
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
									<td style="width: 200px;"></td>
								</tr>
							</table>
						</div>
						<!-- 닫기 버튼 시작 -->
						<div id="modalCloseBtn">
							<button>닫기</button>
						</div>
						<!-- 닫기 버튼 끝 -->

						<!-- 등록 버튼 시작 -->
						<div id="modalCreateBtn">
							<button>등록</button>
						</div>
						<!-- 등록 버튼 끝 -->

						<!-- 초기화 버튼 시작 -->
						<div id="modalResetBtn">
							<button>초기화</button>
						</div>
						<!-- 초기화 버튼 끝 -->

						<!-- 모달창 자바 스크립트 시작 -->
						<script type="text/javascript">
							let linebtn = document.getElementById("lineBtn");
							let modal = document.getElementById("modal");
							let modalBack = document
									.getElementById("modalBack");
							let modalCloseBtn = document
									.getElementById("modalCloseBtn");

							linebtn.addEventListener("click", function() {
								console.log("여기는 모달 여기는 모달")
								modalBack.classList.remove("noshow")
								modal.classList.remove("noshow")
							})

							modalCloseBtn.addEventListener("click", function() {
								console.log("여기는 닫기버튼 여기는 닫기버튼")
								modalBack.classList.add("noshow")
								modal.classList.add("noshow")
							})
						</script>
						<!-- 모달창 자바 스크립트 끝 -->

						<!-- 조직도 스타일 시작 -->
						<style>
#orgDiv {
	position: absolute;
	top: 100px;
	left: 40px;
}

#orgTitle {
	position: absolute;
	left: 110px;
	top: 60px;
}

#orgTeamDiv {
	z-index: 150;
}

#orgTeamDiv2 {
	z-index: 150;
}

#orgTeamDiv3 {
	z-index: 150;
}

#orgTeamDiv4 {
	z-index: 150;
}

#minusIcon {
	display: none;
	z-index: 151;
}

#minusIcon2 {
	display: none;
	z-index: 151;
}

#minusIcon3 {
	display: none;
	z-index: 151;
}

#minusIcon4 {
	display: none;
	z-index: 151;
}

#plusIcon {
	display: inline-block;
	z-index: 151;
}

#plusIcon2 {
	display: inline-block;
	z-index: 151;
}

#plusIcon3 {
	display: inline-block;
	z-index: 151;
}

#plusIcon4 {
	display: inline-block;
	z-index: 151;
}

#orgTeamTitle {
	z-index: 151;
}

#orgTeamTitle2 {
	z-index: 151;
}

#orgTeamTitle3 {
	z-index: 151;
}

#orgTeamTitle4 {
	z-index: 151;
}

#orgPepleDiv {
	z-index: 151;
	display: none;
}
</style>

						<!-- 조직도 스타일 끝 -->

						<!-- 조직도 제목 시작 -->
						<div id="orgTitle">
							<h4>조직도</h4>
						</div>
						<!-- 조직도 제목 끝-->

						<!-- 조직도 시작 -->
						<div id="orgDiv">
							<table border="1">
								<tr style="height: 350px;">
									<td style="width: 200px; vertical-align: top;">
										<!-- 조직도 플러스 아이콘 시작 -->
										<div id="orgTeamDiv">
											<i id="minusIcon" class="fa-solid fa-minus"></i> <i
												id="plusIcon" class="fa-solid fa-plus"
												style="display: inline-block;"></i> <i
												class="fa-solid fa-users"></i>
											<h5 style="display: inline-block;">현장팀</h5>
											<br>
											<div id="orgPepleDiv">
												&emsp;&emsp; <span class="orgPepleSpan"><i
													class="fa-solid fa-user"></i>
													<h6 style="display: inline-block;">현장팀 사원 박성제</h6></span> <br>
												&emsp;&emsp; <Span class="orgPepleSpan"><i
													class="fa-solid fa-user"></i>
													<h6 style="display: inline-block;">현장팀 팀장 윤상얼</h6></Span> <br>
												&emsp;&emsp; <span class="orgPepleSpan"><i
													class="fa-solid fa-user"></i>
													<h6 style="display: inline-block;">현장팀 부장 허석훈</h6></span> <Br>
												&emsp;&emsp; <span class="orgPepleSpan"><i
													class="fa-solid fa-user"></i>
													<h6 style="display: inline-block;">현장팀 사장 노지언</h6></span>
											</div>
										</div>
										<div id="orgTeamDiv2">
											<i id="minusIcon2" class="fa-solid fa-minus"></i> <i
												id="plusIcon2" class="fa-solid fa-plus"
												style="display: inline-block;"></i> <i
												class="fa-solid fa-users"></i>
											<h5 style="display: inline-block;">총무팀</h5>
										</div> <!-- ㅡㅡㅡㅡㅡㅡㅡㅡ -->
										<div id="orgTeamDiv3">
											<i id="minusIcon" class="fa-solid fa-minus"></i> <i
												id="plusIcon3" class="fa-solid fa-plus"
												style="display: inline-block;"></i> <i
												class="fa-solid fa-users"></i>
											<h5 style="display: inline-block;">인사팀</h5>
										</div> <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
										<div id="orgTeamDiv4">
											<i id="minusIcon" class="fa-solid fa-minus"></i> <i
												id="plusIcon4" class="fa-solid fa-plus"
												style="display: inline-block;"></i> <i
												class="fa-solid fa-users"></i>
											<h5 style="display: inline-block;">영업팀</h5>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- 조직도 끝 -->

					</div>
				</div>
				<!-- 모달창 끝 -->

				<!-- 조직도 스크립트 시작 -->
				<script type="text/javascript">
					let plusIcon = document.getElementById("plusIcon");
					let plusIcon2 = document.getElementById("plusIcon2");
					let plusIcon3 = document.getElementById("plusIcon3");
					let plusIcon4 = document.getElementById("plusIcon4");
					let minusIcon = document.getElementById("minusIcon");
					let minusIcon2 = document.getElementById("minusIcon2");
					let minusIcon3 = document.getElementById("minusIcon3");
					let minusIcon4 = document.getElementById("minusIcon4");
					let orgPepleDiv = document.getElementById("orgPepleDiv");
					let orgPepleSpan = document
							.getElementsByClassName("orgPepleSpan");
					let draftBtnMinus = document
							.getElementById("draftBtnMinus");
					let draftBtnPlus = document.getElementById("draftBtnPlus");
					let draftBoxTd = document.getElementById("draftBoxTd");

					plusIcon.addEventListener("click", function() {
						console.log("여기는 조직도 여기는 조직도")
						if (plusIcon.style.display != "none") {
							plusIcon.style.setProperty("display", "none");
							minusIcon.style.display = "inline-block";
							orgPepleDiv.style.display = "inline-block";
						} else {
							plusIcon.style.display = "inline-block";
							minusIcon.style.display = "none";
							orgPepleDiv.style.display = "inline-block";
						}

					})
					minusIcon.addEventListener("click", function() {
						console.log("여기는 조직도 여기는 조직도")
						if (plusIcon.style.display != "none") {
							plusIcon.style.setProperty("display", "none");
							minusIcon.style.display = "inline-block";
							orgPepleDiv.style.display = "none";
						} else {
							plusIcon.style.display = "inline-block";
							minusIcon.style.display = "none";
							orgPepleDiv.style.display = "none";
						}

					})

					for (let i = 0; i < orgPepleSpan.length; i++) {
						orgPepleSpan[i]
								.addEventListener(
										"click",
										function() {
											if (orgPepleSpan[i].style.backgroundColor != "rgb(196, 232, 230)") {
												orgPepleSpan[i].style.backgroundColor = "#C4E8E6";
											} else {
												orgPepleSpan[i].style.backgroundColor = "white";
											}
										})

						draftBtnPlus
								.addEventListener(
										"click",
										function() {
											console.log("여기는 플러스비티엔")
											console
													.log("orgPepleSpan : "
															+ orgPepleSpan[i].style.backgroundColor)
											if (orgPepleSpan[i].style.backgroundColor == "rgb(196, 232, 230)") {
												let moveOps;
												moveOps = orgPepleSpan[i].innerHTML
														+ "<br>"
												console.log(moveOps);
												console.log("box to "
														+ draftBoxTd)
												draftBoxTd.innerHTML += moveOps;

											}
										})

					}
				</script>
				<!-- 조직도 스크립트 끝 -->

				<!-- 기안서양식 시작 -->
				<div id="basisDraft">
					<table border="1">
						<tr>
							<td class="basisTitleTd">기안자</td>
							<td class="basisTd"><input class="inp" type="text"></td>
							<td class="basisTitleTd">소속부서</td>
							<td class="basisTd"><input class="inp" type="text"></td>
						</tr>

						<tr>
							<td class="basisTitleTd">기안일자</td>
							<td class="basisTd"><input class="inp" type="text"></td>
							<td class="basisTitleTd" rowspan="4">첨부파일</td>
							<td class="basisTd" rowspan="4" colspan="2"></td>
						</tr>
						<tr>
							<td class="basisTitleTd">문서번호</td>
							<td class="basisTd"><input class="inp" type="text"></td>
						</tr>
						<tr>
							<td class="basisTitleTd">제목</td>
							<td class="basisTd"><input class="inp" type="text"></td>
						</tr>
						<tr>
							<td class="basisTitleTd">참조</td>
							<td class="basisTd"><input class="inp" type="text"></td>
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
</body>