<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
                                        <h4 class="card-title" style="font-weight: bolder;">연락처로 확인</h4>
                                    </div>
                                    <div class="card-body">

                                        <form:form action="./idSearch" modelAttribute="employeeVO">
                                            <form:input path="employee_num" hidden="true"></form:input>
                                            <form:input path="phone" id="phone" value="" hidden="true"></form:input>
                                        </form:form>
                                        <div class="basic-form">
                                            <form>
                                                <div class="form-group row">
                                                    <label class="col-sm-2 col-form-label ">이름</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control col-5">
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group row">
                                                    <label class="col-sm-2 col-form-label">휴대전화 번호</label>
                                                    <div class="col">
                                                        <div class="form-row ml-3">
                                                            <div class="form-group row">
                                                                <select id="phoneStart" name="phoneStart"
                                                                    class="form-control col-3">
                                                                    <option selected="" value="">
                                                                        -선택-</option>
                                                                    <option value="010">010</option>
                                                                    <option value="011">011</option>
                                                                    <option value="016">016</option>
                                                                    <option value="017">017</option>
                                                                    <option value="018">018</option>
                                                                    <option value="019">019</option>
                                                                </select>&emsp;-&emsp;
                                                                <input type="text"
                                                                    class="form-control col-3"
                                                                    name="phoneMiddle" id="phoneMiddle"
                                                                    maxlength="4" minlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                                                &emsp;-&emsp;
                                                                <input type="text"
                                                                    class="form-control col-3"
                                                                    name="phoneEnd" id="phoneEnd" maxlength="4" minlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                                            </div>
                                                                <button type="button" class="btn-sm btn-light" style="height: 35px;">인증번호 받기</button>
                                                            </div>
                                                            <div class="form-group row col-sm-10">
                                                                <input type="text" class="form-control col-5" disabled>
                                                            </div>

                                                    </div>
                                                </div>

                                                <div class="col-sm-12 pb-1" style="text-align: center;">
                                                    <button type="submit"
                                                            class="btn btn-primary" style="height: 35px;">확인
                                                    </button>
                                                </div>

                                            </form>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title" style="font-weight: bolder;">사번으로 확인</h4>
                                    </div>
                                    <div class="card-body">

                                        <div class="basic-form">
                                            <form:form action="./idSearchNum" modelAttribute="employeeVO">
                                                <div class="form-group row">
                                                    <label class="col-sm-2 col-form-label">이름</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="name" cssClass="form-control col-5"></form:input>
                                                        <form:errors path="name" style="color: red;"></form:errors></br>
                                                        <!-- <input type="text" class="form-control col-5"> -->
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-2 col-form-label">사번</label>
                                                    <div class="col-sm-10">
                                                        <form:input path="employee_num" cssClass="form-control col-5"></form:input>
                                                        <form:errors path="employee_num" style="color: red;"></form:errors></br>
                                                        <!-- <input type="text" class="form-control col-5"> -->
                                                    </div>
                                                </div>

                                                <div class="col-sm-12 pt-4 pb-1" style="text-align: center;">
                                                    <button type="submit"
                                                            class="btn btn-primary" style="height: 35px;">확인
                                                    </button>
                                                </div>

                                            </form:form>
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