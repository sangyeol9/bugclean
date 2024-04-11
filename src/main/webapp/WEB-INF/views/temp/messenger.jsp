<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link ref="stylesheet" href="/bugclean/css/messenger.css">	

<div id="messenger_div" class="display_none">
	        <div class="left_messenger" >
	        	<div id="messenger_Kind"> 
	        		<div >
	        			<i class="fa-regular fa-user fa-2x" onclick="change_emp_list()" id="messenger_list_icon" class="msg_icon"></i>
	        		</div>
	        		<div >
	        			<i class="fa-regular fa-comment fa-2x"  id="messenger_msg_icon" onclick="change_msg_list()"></i>
	        		</div>
	        	</div>
	        </div>
	        <div class="right_messenger" id="messenger_list">
	       		<div id="messenger_emp_list">
					<div id="affairs_team">
						<div id="affairs_team_div"><b><span class="span_icon" id="affairs_team_span">+</span><i class="fa-solid fa-users"></i>총무팀</b></div>
						<div id="affairs_team_list" class="display_none">
							<div>&emsp;<i class="fa-solid fa-user"></i>박성제</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>허석훈</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>노지언</div>
							<div>&emsp;<i class="fa-solid fa-user"></i>윤상열</div>
						
						</div>
					</div>
						
	       			<div id="sales_team">영업팀</div>
					<div id="personal_team">인사팀</div>
					<div id="field_team">현장팀</div>
	       		</div>
	       		<div id="messenger_msg_list" class="display_none">
	       			<div><a href="/chat/room" onclick="openPopup(); return false;">메시지 목록 1</a></div>
	       			<div>메시지 목록 2</div>
	       		</div>
	       	</div>
        </div> 
        <img id="messenger_img" src="/focus-bootstrap-main/theme/images/messenger.png" onclick="messenger_toggle()">
        <script src="/bugclean/js/messenger.js"></script>   