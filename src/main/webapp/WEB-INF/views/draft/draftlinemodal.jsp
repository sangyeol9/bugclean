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
        *0**********************************-->

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
#modal {
	display: inline-block;
	position: relative;
	left: 20px;
	width: 900px;
	height: 600px;
}

#selete1 {
	display: inline-block;
	position: relative;
	left: 850px;
	bottom: 250px;
}

#title {
	display: inline-block;
	position: relative;
	left: 280px;
	bottom: 250px;
}

#draftBox {
	display: inline-block;
	position: relative;
	left: 200px;
	top: 90px;
}

#draftTitle {
	display: inline-block;
	position: relative;
	left: 500px;
	bottom: 200px;
}

#draftBtn {
	position: relative;
	left: 150px;
	bottom: 55px;
	display: inline-block;
}

#ref {
	position: relative;
	left: 20px;
	top: 130px;
	display: inline-block;
}

#refBox {
	position: relative;
	left: 682px;
	top: 130px;
	display: inline-block;
}
</style>
	<div class="content-body" style="min-height: 877px;">
		<div id="modal">
			<div>
				<!-- 셀렉트 시작 -->
				<select id="selete1">
					<option>자주쓰는결재선</option>
					<option>박성제1</option>
					<option>박성제2</option>
				</select>
				<!-- 셀렉트 끝 -->

				<!-- 제목 시작 -->
				<div id="title">
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
				<!-- 결재선 버튼 시작 -->

				<!-- 결재선 박스 시작 -->
				<div id="draftBox">
					<table border="1">
						<tr style="height: 270px;">
							<td style="width: 300px">ddd</td>
						</tr>
					</table>
				</div>
				<!-- 결재선 박스 끝 -->

				<!-- 참조 제목 시작 -->
				<div id="ref">
					<h3>참조</h3>
				</div>
				<!-- 참조 제목 시작 -->

				<!-- 참조 박스 시작 -->

				<div id="refBox">
					<table border="1">
						<tr style="height: 270px;">
							<td style="width: 300px;">dd</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!--**********************************
            Content body end
        ***********************************-->


	<!--**********************************
            Footer start
        ***********************************-->
	<c:import url="../temp/css.jsp"></c:import>
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