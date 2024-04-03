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

#standard {
	position: relative;
	width: 1100px;
	height: 1100px;
}
</style>
	<div class="content-body" style="min-height: 877px;">
		<!-- 기안서 제목 시작 -->
		<div id="standard">
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
#modal {
	position: relative;
	left: 210px;
	top: 50px;
	width: 800px;
	height: 600px;
	background-color: white;
	z-index: 100;
}

.noshow {
	display: none;
}

#selete1 {
	position: absolute;
	left: 330px;
	bottom: 280px;
}

#draftLineTitle {
	position: absolute;
	left: 280px;
	bottom: 500px;
}

#draftBox {
	position: absolute;
	right: 25px;
	top: 110px;
}

#draftTitle {
	position: absolute;
	right: 90px;
	top: 75px;
}

#draftBtn {
	position: absolute;
	left: 320px;
	top: 180px;
	display: inline-block;
}

#refBtn {
	position: absolute;
	left: 320px;
	bottom: 165px;
}

#refTitle {
	position: absolute;
	right: 105px;
	bottom: 260px;
	display: inline-block;
}

#refBox {
	position: absolute;
	right: 25px;
	bottom: 90px;
	display: inline-block;
}
</style>
			<!-- 모달창 css 끝 -->

			<!-- 모달창 시작 -->
			<div id="modal" class="noshow" style="opacity: 1">
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
					<h2>결재선 설정</h2>
				</div>
				<!-- 제목 끝 -->

				<!-- 결재선 제목 시작 -->
				<div id="draftTitle">
					<h3>결재선</h3>
				</div>
				<!-- 결재선 제목 끝 -->

				<!-- 결재선 버튼 시작 -->
				<div id="draftBtn">
					<button style="display: inline-block;">빼기</button>
					<h3 style="display: inline-block;">결재</h3>
					<button style="display: inline-block;">넣기</button>
				</div>
				<!-- 결재선 버튼 끝 -->

				<!-- 참조 버튼 시작 -->
				<div id="refBtn">
					<button style="display: inline-block;">빼기</button>
					<h3 style="display: inline-block;">결재</h3>
					<button style="display: inline-block;">넣기</button>
				</div>
				<!-- 참조 버튼 끝 -->

				<!-- 결재선 박스 시작 -->
				<div id="draftBox">
					<table border="1">
						<tr style="height: 170px;">
							<td style="width: 200px"></td>
						</tr>
					</table>
				</div>
				<!-- 결재선 박스 끝 -->

				<!-- 참조 제목 시작 -->
				<div id="refTitle">
					<h3>참조</h3>
				</div>
				<!-- 참조 제목 시작 -->

				<!-- 참조 박스 시작 -->

				<div id="refBox">
					<table border="1">
						<tr style="height: 170px">
							<td style="width: 200px;"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 모달창 끝 -->

			<!-- 모달창 자바 스크립트 시작 -->
			<script type="text/javascript">
				let linebtn = document.getElementById("lineBtn")
				let modal = document.getElementById("modal")
				linebtn.addEventListener("click", function() {
					console.log("여기는 모달 여기는 모달")
					modal.classList.remove("noshow")

				})
			</script>
			<!-- 모달창 자바 스크립트 끝 -->

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

		<c:import url="../temp/js.jsp"></c:import>
</body>