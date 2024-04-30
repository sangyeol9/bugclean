<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BugClean</title>
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
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <h4 style="font-weight: bolder;">&ensp; 수신문서함</h4>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active">문서함</li>
                        <li class="breadcrumb-item active"><a href="./">Inbox</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->


            <div class="row">
                
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title" style="font-weight: bold;">문서 목록</h4>
                        </div>

                        <div class="card-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#all8">
                                        <span>
                                            전체
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#wait8">
                                        <span>
                                            대기
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#ing8">
                                        <span>
                                            진행
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#okay8">
                                        <span>
                                            완료
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#refer8">
                                        <span>
                                            참조
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content tabcontent-border">

                                <!-- 전체 -->
                                <div class="tab-pane fade active show" id="all8" role="tabpanel">
                                    
                                    <table class="table header-border table-hover verticle-middle">
                                        <thead>
                                            <tr>
                                                <th class="col-2" style="text-align: center;">문서번호</th>
                                                <th class="col-6" style="text-align: center;">제목</th>
                                                <th class="col-1" style="text-align: center;">기안자</th>
                                                <th class="col-2" style="text-align: center;">기안날짜</th>
                                                <th class="col-1" style="text-align: center;">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${allList}" var="list">

                                            
                                                <tr style="text-align: center;">
                                                    <th>${list.DRAFT_NUM}</th>
                                                    <td ><a href="/draft/getdraftdetail?draft_num=${list.DRAFT_NUM}" style="font-weight: bold;">${list.TITLE}</a></td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                            <div class="progress-bar" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>${list.DRAFT_DATE}</td>
                                                    <td><span class="badge badge-primary">70%</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                        
                                    
                                </div>

                                <!-- 대기 -->
                                <div class="tab-pane fade" id="wait8" role="tabpanel">
                                    <div class="table-responsive">
                                        <table id="inbox" class="table-hover table" style="width: 98%">
                                            <tr>
                                                <th>문서번호</th>
                                                <th>제목</th>
                                                <th>기안자</th>
                                                <th>기안날짜</th>
                                                <th>상태</th>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <!-- 진행 -->
                                <div class="tab-pane fade" id="ing8" role="tabpanel">
                                    <div class="table-responsive">
                                        <table id="inbox" class="table-hover table" style="width: 98%">
                                            <tr>
                                                <th>문서번호</th>
                                                <th>제목</th>
                                                <th>기안자</th>
                                                <th>기안날짜</th>
                                                <th>상태</th>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-- 완료 -->
                                <div class="tab-pane fade" id="okay8" role="tabpanel">
                                    <div class="table-responsive">
                                        <table id="inbox" class="table-hover table" style="width: 98%">
                                            <tr>
                                                <th>문서번호</th>
                                                <th>제목</th>
                                                <th>기안자</th>
                                                <th>기안날짜</th>
                                                <th>상태</th>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="refer8" role="tabpanel">
                                    <div class="table-responsive">
                                        <table class="table header-border table-hover verticle-middle">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Product</th>
                                                    <th scope="col">Popularity</th>
                                                    <th scope="col">Sales</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th>1</th>
                                                    <td>Air Conditioner</td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                            <div class="progress-bar" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-primary">70%</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>2</th>
                                                    <td>Textiles</td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(76, 175, 80, .1)">
                                                            <div class="progress-bar bg-success" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-success">70%</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>3</th>
                                                    <td>Milk Powder</td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(70, 74, 83, .1)">
                                                            <div class="progress-bar bg-dark" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-dark">70%</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>4</th>
                                                    <td>Vehicles</td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(255, 87, 34, .1)">
                                                            <div class="progress-bar bg-danger" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-danger">70%</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>5</th>
                                                    <td>Boats</td>
                                                    <td>
                                                        <div class="progress" style="background: rgba(255, 193, 7, .1)">
                                                            <div class="progress-bar bg-warning" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-warning">70%</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                               

                                


                            </div>
                        </div>



                        
                    </div>
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