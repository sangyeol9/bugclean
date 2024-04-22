<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bug Clean</title>
    <style>
        .table-hover thead th,
        .table-hover tbody td {
            text-align: center;
        }

        .table-hover thead th:nth-child(2),
        .table-hover tbody td:nth-child(2) {
            width: 45%;
        }

        .table-hover thead th:nth-child(1),
        .table-hover thead th:nth-child(5),
        .table-hover tbody td:nth-child(1),
        .table-hover tbody td:nth-child(5) {
            width: 7%;
        }


        .table-hover thead th:nth-child(4),
        .table-hover tbody td:nth-child(4) {
            width: 25%;
        }

        .d-flex {
            display: flex;
            align-items: start;
            padding-right: 0 !important;
        }

    </style>
</head>
<c:import url="../temp/css.jsp"></c:import> <!-- //bootstrap-template-css -->
<link href="/focus-bootstrap-main/theme/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="/focus-bootstrap-main/theme/css/style.css" rel="stylesheet">
<link href="/focus-bootstrap-main/theme/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
<link href="/bugclean/css/MemberAgree-datatables.css" rel="stylesheet">
<link href="/focus-bootstrap-main/theme/vendor/summernote/summernote.css" rel="stylesheet">
<body>
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<div id="main-wrapper">

    <c:import url="../temp/header.jsp"></c:import> <!-- //nav-header-->
    <c:import url="../temp/sidebar.jsp"></c:import> <!-- //sidebar-menu-->

    <div class="content-body " style="min-height:900px;">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <c:forEach var="index" begin="0" end="${fn:length(sessionScope.name) - 1}" varStatus="loop">
                            <c:if test="${active == sessionScope.code[index]}">
                                <h4 id="page-title" data-target="${sessionScope.code[index]}" style="font-weight: bolder;">&ensp;${sessionScope.name[index]}</h4>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item">게시판</li>
                        <c:forEach var="index" begin="0" end="${fn:length(sessionScope.name) - 1}" varStatus="loop">
                            <c:if test="${active == sessionScope.code[index]}">
                                <li class="breadcrumb-item">
                                    <a id="title-a"
                                       href="http://localhost/board?code=${sessionScope.code[index]}">${sessionScope.name[index]}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    <c:import url="../temp/messenger.jsp"></c:import>--%>
</div>

</div>
<c:import url="../temp/footer.jsp"></c:import> <%--footer--%>
<c:import url="../temp/js.jsp"></c:import> <%--bootstrap-template-js--%>
<script src="/focus-bootstrap-main/theme/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/focus-bootstrap-main/theme/vendor/summernote/js/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/bugclean/js/board/board.js"></script>

</body>
</html>