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
#flex {
	position: relative;
	left: 850px;
	bottom: 100px;
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

#line {
	position: relative;
	left: 820px;
	top: 10px;
}

#title {
	position: relative;
	left: 300px;
	top: 50px;
}

#basisDraft {
	position: relative;
	left: 150px;
	bottom: 70px;
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
</style>

	<div class="content-body" style="min-height: 877px;">
		<h3 id="title">기안서</h3>
		<button id="line">
			편<br>집<br>하<br>기
		</button>
		<div id="flex">
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
		<div id="basisDraft">
			<table border="1">
				<tr>
					<td class="basisTitleTd">기안자</td>
					<td class="basisTd"></td>
					<td class="basisTitleTd">소속부서</td>
					<td class="basisTd"></td>
				</tr>
				<tr>
					<td class="basisTitleTd">기안일자</td>
					<td class="basisTd"></td>
					<td class="basisTitleTd" rowspan="4">첨부파일</td>
					<td class="basisTd" rowspan="4" colspan="2"></td>
				</tr>
				<tr>
					<td class="basisTitleTd">문서번호</td>
					<td class="basisTd"></td>
				</tr>
				<tr>
					<td class="basisTitleTd">제목</td>
					<td class="basisTd"></td>
				</tr>
				<tr>
					<td class="basisTitleTd">참조</td>
					<td class="basisTd"></td>
				</tr>
				<tr style="height: 300px;">
					<td class="basisTitleTd" >내용</td>
					<td class="basisTitleTd" colspan="4"></td>
				</tr>
				<tr style="height: 130px;">
					<td class="basisTitleTd" >의견</td>
					<td class="basisTitleTd" colspan="4"></td>
				</tr>




			</table>
		</div>
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