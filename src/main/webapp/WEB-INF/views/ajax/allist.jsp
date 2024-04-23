			<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


							<select id="select">
								<option>자주쓰는결재선</option>
							<c:forEach items="${allist}" var="allist">
							<option value="${allist.approval_line_code}">${allist.line_name}</option>
							</c:forEach>
							</select>
							
							
<script src="/bugclean/js/draft/basisdraftmodal.js"></script>
	