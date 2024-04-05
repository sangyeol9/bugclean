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
		<div class="content-body" style="min-height: 877px;">
			<table border="1">
				<tr>
					<td><a href="./basisdraft">기본기안서 양식</a></td>
					<td><a href="./basisdraft">현장보고서 양식</a></td>
					<td><a href="./basisdraft">매출보고서 양식</a></td>
					<td><a href="./basisdraft">구매신청서 양식</a></td>
				</tr>
			</table>
			
			
			
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
        </div>
        <c:import url="../temp/messenger.jsp"></c:import>
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