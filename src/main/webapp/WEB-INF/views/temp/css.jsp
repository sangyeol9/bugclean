<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <link rel="icon" type="image/png" sizes="16x16" href="/focus-bootstrap-main/theme/images/favicon.png">
    <link rel="stylesheet" href="/focus-bootstrap-main/theme/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/focus-bootstrap-main/theme/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/focus-bootstrap-main/theme/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/focus-bootstrap-main/theme/css/style.css" rel="stylesheet">
 <style>
 	#bugclean{
 		width: 100%;
 		height: 100%;
 	}
 	#messenger_img{
 		width:3%;
 		left:83%;
 		top:90%;
 		position: fixed;
 		z-index: 300;
 	}
 	.messenger_circle{
 		border : 1px solid black;
 		border-radius: 50%;
 		margin-top : 19.5%;
 		width: 50px;
 		height: 50px;
 		margin-left:19.8%;
 		background-color: white;
 		display: flex;
 		text-align: center;
 		justify-content: center;
 		align-items: center;
 		color: black;
 		
 	}
 	.left_messenger{
 		background-color: #E2E1EE;
 		border : 1px solid black;
		float:left;
		width:30%;
 		height: 100%;
 	}
 	.right_messenger{
 		background-color: white;
 		border-bottom :1px solid black;
 		border-right : 1px solid black;
 		border-top : 1px solid black;
		float:left;
		width: 70%;
 		height: 100%;
 	}
 	#messenger_div{
 		position:fixed;
 		top: 40%;
 		left:82%;
 		width : 15%;
 		float: right;
 		height:50%;
 		display: inline_block;
		z-index: 300;
 	}
 	#messenger_list_icon{
 		border-radius: 50%;
 		margin-top : 19.5%;
 		width: 50px;
 		height: 50px;
 		margin-left:19.8%;
 		display: flex;
 		text-align: center;
 		justify-content: center;
 		align-items: center;
 		color: black;
 	}
 	#messenger_msg_icon{
 		border-radius: 50%;
 		margin-top : 22.5%;
 		width: 100%;
 		height: 100%;
 		margin-left:1.8%;
 		display: flex;
 		text-align: center;
 		justify-content: center;
 		align-items: center;
 		color: black;
 	}
 	.display_none{
 		display:none;
 	}
 </style>