<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

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
					
	       		</div>
	       		<div id="messenger_msg_list" class="display_none">
	       			<div><a href="/chat/room" onclick="openPopup(); return false;">메시지 목록 1</a></div>
	       			<div>메시지 목록 2</div>
	       		</div>
	       	</div>
        </div> 
        <img id="messenger_img" src="/focus-bootstrap-main/theme/images/messenger.png" onclick="messenger_toggle()">
        <script src="/bugclean/js/messenger.js"></script>   