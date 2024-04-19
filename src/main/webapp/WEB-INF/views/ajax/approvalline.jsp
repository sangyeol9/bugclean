			<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				<div id="lineBtnDiv">
					<button id="lineBtn" class="lineBtnDiv" >
						편<br>집<br>하<br>기
					</button>
				</div>
					<table border="1">
						<tr id="input_grade">
							<td rowspan="4">결재선</td>
							<td>기안자</td>
							<c:forEach items="${aplvdep}" var="dep">
							<td>${dep}</td>
							</c:forEach>
						</tr>
						<tr id="input_blank">
							<td></td>
							<c:forEach items="${aplvdep}" var="dep">
							<td></td>
							</c:forEach>
						</tr>
						<tr id="input_name">
							<td>${empMap.NAME}</td>
							<c:forEach items="${aplvname}" var="name">
							<td>${name}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="date"></td>
							<c:forEach items="${aplvname}" var="name">
							<td class="date"></td>
							</c:forEach>
						</tr>
					</table>
<script src="/bugclean/js/draft/basisdraftmodal.js"></script>
	