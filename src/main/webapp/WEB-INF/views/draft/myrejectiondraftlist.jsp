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
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">내 기안문서</h4>
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
                                <tr>
                                    <td>1</td>
                                    <td>현장보고서</td>
                                    <td><span>허석훈</span></td>
                                    <td><span>2024.01.03</span></td>
                                    <td><span class="badge badge-danger">반려</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>
    
    <c:import url="../temp/messenger.jsp"></c:import>
    </div>

</div>
    <c:import url="../temp/footer.jsp"></c:import> <!-- //footer -->
<c:import url="../temp/js.jsp"></c:import> <!-- // bootstrap-template-js -->
</body>
</html>
