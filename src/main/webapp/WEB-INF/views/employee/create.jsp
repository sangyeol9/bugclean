<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bugclean-create</title>
</head>
<c:import url="../temp/css.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
	
	

	<div class="authincation mt-5">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-7">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">Sign up your account</h4>
									
									
									<form:form modelAttribute="employeeVO">

										<div class="form-group">
											<label><strong>아이디</strong></label>
											<div style="display: flex;">
												<div class="input-group mb-3">
													<form:input path="username"  cssClass="form-control" id="username"></form:input>
													<div class="input-group-append">
														<span class="input-group-text">@gmail.com</span>
													</div>
												</div>
												<div class="card-action mx-1 mt-1" style="height: 35px; display: table;">
													<div id="mailCheckBtn" type="button" class="dropdown custom-dropdown" style="width: 80px; display: table-cell; vertical-align: middle;">
														인증 요청
													</div>
												</div>
											</div>
											<form:errors path="username"></form:errors>   
										</div>

										<div id="mail_number" class="form-group mb-4" style="display: none;">
											<label><strong>인증번호</strong></label>
											<div style="display: flex;">
												<input type="text" name="number" id="number" class="form-control col-6 mailCheckInput" disabled="disabled" maxlength="6" placeholder="인증번호 6자리를 입력해주세요.">
												<input type="text" id="Confirm" name="Confirm" style="display: none" value="">
												<button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()" class="btn btn-light mx-1" style="height: 35px;">확인</button>
											</div>
											<span id="mailCheckWarn"></span>
										</div>

										<!-- dsfasdfsdf -->
										<!-- <div layout:fragment="content">
											<form role="form" method="post" th:object="${memberFormDto}">
											<div class="form-group">
												
												<button type="button" id="sendBtn" name="sendBtn" onclick="sendNumber()">인증번호</button>
											</div>
											<br>
											<div id="mail_number" name="mail_number" style="display: none">
												<input type="text" name="number" id="number" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
												<button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
											</div>
										</form> -->





										<div class="form-group">
											<label><strong>비밀번호</strong></label>
											<form:password path="password" cssClass="form-control" id="password"></form:password>
											<form:errors path="password"></form:errors>
										</div>

										<div class="form-group">
											<label><strong>비밀번호 확인</strong></label>
											<form:password path="passwordCheck" cssClass="form-control" id="passwordCheck"></form:password>
											<form:errors path="passwordCheck"></form:errors>
										</div>

										<div class="form-group">
											<label><strong>이름</strong></label>
											<form:input path="name" id="name" cssClass="form-control col-6"></form:input>
											<form:errors path="name"></form:errors>
										</div>
										<div class="form-group">
											<label><strong>휴대전화번호</strong></label>

											


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
															maxlength="4" minlength="4">
														&emsp;-&emsp;
														<input type="text"
															class="form-control col-3"
															name="phoneEnd" id="phoneEnd" maxlength="4" minlength="4">
													</div>
													<!-- <input type="text" id="phone" name="phone" style="display: none" value=""> -->
													<form:input path="phone" id="phone" cssClass="form-control" style="display: none" value=""></form:input>
												</div>
												<form:errors path="phone"></form:errors>

											


										</div>



										<div class="text-center mt-5">
											<button type="submit" id="submit" class="btn btn-primary btn-block">가입 신청</button>
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

	<c:import url="../temp/js.jsp"></c:import>
	<script src="/bugclean/js/employee/create.js"></script>
	
</body>
</html>