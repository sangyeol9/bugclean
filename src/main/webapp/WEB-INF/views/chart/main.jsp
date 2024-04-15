<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bug Clean</title>
</head>
<c:import url="../temp/css.jsp"></c:import> <!-- //bootstrap-template-css -->
<body>
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<div id="main-wrapper">

    <c:import url="../temp/header.jsp"></c:import> <!-- //nav-header -->
    <c:import url="../temp/sidebar.jsp"></c:import> <!-- //sidebar-menu -->

    <div class="content-body " style="min-height:900px;">
    
    	                    <div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Gradient Bar Chart</h4>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="barChart_2"></canvas>
                                    </div>
                                </div>
                            </div>
    
    
    <c:import url="../temp/messenger.jsp"></c:import>
    </div>

</div>
    <script src="./vendor/chart.js/Chart.bundle.min.js"></script>   
    <script src="/bugclean/js/chartMain.js"></script>
    <c:import url="../temp/footer.jsp"></c:import> <!-- //footer -->
	<c:import url="../temp/js.jsp"></c:import> <!-- // bootstrap-template-js -->
</body>
</html>
