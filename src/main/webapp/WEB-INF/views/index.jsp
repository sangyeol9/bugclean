<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bug Clean</title>
    <!-- Favicon icon -->
	<c:import url="./temp/css.jsp"></c:import>

    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-straight/css/uicons-regular-straight.css'>

    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s6s3pnbbrh&submodules=geocoder"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s6s3pnbbrh&submodules=geocoder"></script>
    
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
        <c:import url="./temp/header.jsp"></c:import>
        <c:import url="./temp/sidebar.jsp"></c:import>
        
        <div class="content-body">
            <div class="container-fluid mb-5">

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal" var="employeeVO"/>
                    <h3 style="font-weight: bold;" class="mb-2">
                        <spring:message code="welcome" arguments="${employeeVO.name}" text="안녕하세요!"></spring:message>  
                    </h3>
                </sec:authorize>



               
                <div class="row">
                    <!-- 출퇴 -->
                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">T&A</h4>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-media">
                                    <div class="media">
                                        
                                        <div class="media-body">


                                            <div class="card-body" style="text-align: center;">
                                                <h2 id="clock">00:00:00</h2>
                                            </div>
                                            
                                                
                                                <div class="text-center mt-4 mx-3">
                                                    <button type="submit" class="btn btn-light btn-block" style="font-weight: bold;">출근</button>
                                                    <button type="submit" class="btn btn-dark btn-block" style="font-weight: bold;">퇴근</button>
                                                </div>

                                                <div class="text-center mt-4 mx-3">
                                                    <table class="col-12">
                                                        <tbody>
                                                            <tr>
                                                                <td class="col-6">출근 시간</th>
                                                                <td id="goTime" class="col-6" style="font-size: large; color: darkgray;">07:35:12</th>
                                                            </tr>
                                                            <tr>
                                                                <td>퇴근 시간</td>
                                                                <td id="leaveTime" style="font-size: large; color: darkgray;">-</td>
                                                            </tr>

                                                    </table>

                                                </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 공지사항 -->
                    <div class="col-lg-7">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Notice</h4>
                            </div>
                            <div class="card-body py-2">
                                <div class="bootstrap-media">

                                    <table class="table header-border table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th class="col-2">No.</th>
                                                <th class="col-6">Title</th>
                                                <th class="col-4">Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)" style="font-weight: bold;">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)" style="font-weight: bold;">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)" style="font-weight: bold;">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)" style="font-weight: bold;">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            <tr>
                                                <td>217</td>
                                                <td><a href="javascript:void(0)" style="font-weight: bold;">공지입니당!</a></td>
                                                <td>2024-04-05</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 일정확인 -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Individual</h4>
                            </div>

                            <div class="card-body">
                                <!-- Nav-->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#home8">
                                            <span>
                                                <i class="fi fi-rs-calendar"></i>
                                            </span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#profile8">
                                            <span>
                                                <i class="fi fi-rs-map-marker"></i>
                                            </span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#messages8">
                                            <span>
                                                <i class="ti-email"></i>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- Tab -->
                                <div class="tab-content tabcontent-border">
                                    <!-- 일정 -->
                                    <div class="tab-pane fade active show" id="home8" role="tabpanel">
                                        <div class="pt-4">
                                            <h4>This is icon title</h4>
                                            <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.
                                            </p>
                                            <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.
                                            </p>
                                        </div>
                                    </div>
                                    <!-- 지도 -->
                                    <div class="tab-pane fade" id="profile8" role="tabpanel">
                                        <div class="pt-4">
                                            <div id="map" style="width:1000px;height:500px;"></div>
                                        </div>
                                    </div>
                                    <!-- ??? -->
                                    <div class="tab-pane fade" id="messages8" role="tabpanel">
                                        <div class="pt-4">
                                            <h4>This is icon title</h4>
                                            <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.
                                            </p>
                                            <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>






                <c:import url="./temp/messenger.jsp"></c:import>
                
            </div>
        </div>
    </div>
    
        
        
        <c:import url="./temp/footer.jsp"></c:import>
        <c:import url="./temp/js.jsp"></c:import>
        <c:import url="./index_js.jsp"></c:import>
</body>
    
    