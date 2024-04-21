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
                                <h4 id="page-title" style="font-weight: bolder;">&ensp;${sessionScope.name[index]}</h4>
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
                            <div class="default-tab">
                                <ul id="board-tabs" class="nav nav-tabs" role="tablist">
                                    <c:forEach var="index" begin="0" end="${fn:length(name) - 1}" varStatus="loop">
                                        <li class="nav-item">
                                            <a class="nav-link${active == code[index] ? ' active' : ''}"
                                               data-toggle="tab" data-source="${code[index]}"
                                               href="#list-${code[index]}">${name[index]}</a>
                                        </li>
                                    </c:forEach>
                                    <div class="col-auto d-flex justify-content-end ml-auto">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <select id="kind" style="font-size: 12px; border-color: #eaeaea">
                                                    <option value="1">제목</option>
                                                    <option value="2">작성자</option>
                                                </select>
                                            </div>
                                            <input id="search" type="text" class="form-control"
                                                   style="width: 50%; border-color: #eaeaea"/>
                                            <div class="input-group-append">
                                                <button id="search-btn" class="btn btn-primary">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="list-1" role="tabpanel">
                                        <div class="pt-4">
                                            <div class="table-responsive">
                                                <table class="table-responsive-sm table table-hover align-text-center">
                                                    <thead>
                                                    <tr>
                                                        <th>
                                                            글번호
                                                        </th>
                                                        <th>
                                                            글제목
                                                        </th>
                                                        <th>
                                                            작성자
                                                        </th>
                                                        <th>
                                                            작성일자
                                                        </th>
                                                        <th>
                                                            조회수
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="board-body">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="list-2">
                                        <div class="pt-4">
                                            <div class="table-responsive">
                                                <table class="table-responsive-sm table table-hover align-text-center">
                                                    <thead>
                                                    <tr>
                                                        <th>
                                                            글번호
                                                        </th>
                                                        <th>
                                                            글제목
                                                        </th>
                                                        <th>
                                                            작성자
                                                        </th>
                                                        <th>
                                                            작성일자
                                                        </th>
                                                        <th>
                                                            조회수
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <div class="col-4">
                                </div>
                                <nav>
                                    <ul class="pagination pagination-xs">
                                        <li class="page-item page-indicator">
                                            <a class="page-link">
                                                <i class="icon-arrow-left"></i>
                                            </a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link">3</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link">4</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link">5</a>
                                        </li>
                                        <li class="page-item page-indicator">
                                            <a class="page-link">
                                                <i class="icon-arrow-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                                <div class="col-4 d-flex justify-content-end">
                                    <button id="creat-board" class="btn btn-xs btn-primary">글작성</button>
                                </div>
                            </div>
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
<script src="/bugclean/js/board/board.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>