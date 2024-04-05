<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<link href="/focus-bootstrap-main/theme/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
<c:import url="../temp/css.jsp"></c:import> //bootstrap-template-css

<body>
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<div id="main-wrapper">

    <c:import url="../temp/header.jsp"></c:import> //nav-header
    <c:import url="../temp/sidebar.jsp"></c:import> //sidebar-menu

    <div class="content-body " style="min-height:900px;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">사원가입 요청 목록</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tempList" class="table table-hover" style="width: 98%">
                                    <tr>
                                        <th>가입요청 ID</th>
                                        <th>가입요청 사원</th>
                                        <th>부서</th>
                                        <th>직책</th>
                                        <th>직급</th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="../temp/footer.jsp"></c:import> //footer
</div>
<c:import url="../temp/js.jsp"></c:import> // bootstrap-template-js
<script src="/focus-bootstrap-main/theme/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/bugclean/js/dataTables-init.js"></script>

</body>
</html>