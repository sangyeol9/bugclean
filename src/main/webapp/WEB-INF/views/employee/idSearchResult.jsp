<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BugClean</title>
</head>
<c:import url="../temp/css.jsp"></c:import> <!-- //bootstrap-template-css -->

<body>

<div class="authincation mt-5">
    <div class="container-fluid h-100 mx-5">
        <div class="row justify-content-center h-100 align-items-center"></div>
        <div class="col-md-10">
            <div class="row no-gutters">
                <div class="col-xl-12">
                    <div class="auth-form">


                        <div class="row page-titles mx-0"
                             style="background-color: rgb(243, 243, 255);">
                            <div class="col-sm-6 p-md-0">
                                <div class="welcome-text">
                                    <h4 style="font-weight: bolder;"> &nbsp; 아이디 찾기</h4>
                                    <span class="ml-1"></span>
                                </div>
                            </div>
                            <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="./login">Login</a></li>
                                    <li class="breadcrumb-item active">아이디 찾기</li>
                                </ol>
                            </div>
                        </div>
                        <!-- row -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title" style="font-weight: bolder;">현재 정보와 일치하는 아이디 입니다.</h4>
                                    </div>
                                    <div class="card-body">

                                        
                                        <div class="basic-form my-3">
                                            <h3 class="text-primary mb-3" style="text-align: center;"><i class="fa-solid fa-check" style="color: #74C0FC;"></i>&nbsp; sbugclean1@gmail.com </h3>
                                            <h5 style="color: darkgray; text-align: center;">입사일 : 2023-01-01</h5>

                                            
                                        </div>
                                        <div class="col-sm-12 pt-4 pb-1" style="text-align: center;">
                                            <a href="./login" type="button" class="btn btn-primary mr-1" style="height: 35px;">로그인하기</a>
                                            <a href="./pwSearch" type="button" class="btn btn-light" style="height: 35px;">비밀번호 찾기</a>
                                        </div>

          
                                    </div>
                                </div>
                            
                            
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<c:import url="../temp/js.jsp"></c:import> <!-- // bootstrap-template-js -->
<script src="/bugclean/js/employee/idSearch.js"></script>
</body>

</html>