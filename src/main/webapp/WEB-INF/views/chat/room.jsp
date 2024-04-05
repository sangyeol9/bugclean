<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<c:import url="./room_css.jsp"></c:import>
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
    	<div id="room">
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="leftRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		<div class="rightRoomDiv"><h3>안녕하세요</h3></div><br><br>
    		
    		
			<input id="inputStart" type="text" class="form-control" placeholder="내용을 입력하세요." >
    		<button id="chatSendBtn" class="btn btn-outline-secondary" style="float : right">전송</button>
    	</div>
    
    <c:import url="../temp/messenger.jsp"></c:import>
    </div>

</div>
    <c:import url="../temp/footer.jsp"></c:import> <!-- //footer -->
<c:import url="../temp/js.jsp"></c:import> <!-- // bootstrap-template-js -->
</body>
</html>