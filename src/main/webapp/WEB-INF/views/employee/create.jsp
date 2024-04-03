<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
</head>
<c:import url="../temp/css.jsp"></c:import>
<body>
	
	

	<div class="authincation mt-5">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">Sign up your account</h4>
									<form action="index.html">
										<div class="form-group">
											<label><strong>ID</strong></label>
											<input type="text" class="form-control" placeholder="username">
										</div>
										<div class="card-action">
											<div class="dropdown custom-dropdown" style="width: 70px;">
												인증 요청
											</div>
										</div>
										<div class="form-group">
											<label><strong>인증번호</strong></label>
											<input type="email" class="form-control" placeholder="hello@example.com">
										</div>

										<div class="form-group">
											<label><strong>Email</strong></label>
											<input type="email" class="form-control" placeholder="hello@example.com">
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label>
											<input type="password" class="form-control" value="Password">
										</div>
										<div class="form-group">
											<label><strong>이름</strong></label>
											<input type="text" class="form-control" placeholder="username">
										</div>
										<div class="form-group">
											<label><strong>휴대전화번호</strong></label>
											<input type="text" class="form-control" placeholder="username">
										</div>



										<div class="text-center mt-4">
											<button type="submit" class="btn btn-primary btn-block">Sign me up</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>Already have an account? <a class="text-primary" href="./login">Sign in</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="form_list">
		<div class="form_item user error" id="divId">
			<input type="text" id="id" name="id" placeholder="아이디" class="input" value="" maxlength="20" autocapitalize="off">
			<div class="id_naver">@naver.com</div>
		</div>
		<div class="form_item lock password error" id="divPasswd">
			<input type="password" id="pswd1" name="pswd1" placeholder="비밀번호" class="input" value="" maxlength="20" autocomplete="new-password" aria-autocomplete="list">
			<div class="password_info">
				<em class="how_secure" id="secureLevel"></em>
				<button type="button" class="btn_show hide">
					<span class="blind">비밀번호 보기</span>
				</button>
			</div>
		</div>
		<div class="form_item email" id="divEmail">
			<span class="placeholder_prefix">[선택]</span>
			<input type="email" id="email" name="email" placeholder="[선택] 이메일주소 (비밀번호 찾기 등 본인 확인용)" class="input" value="" maxlength="100">
		</div>
	</div>
	


	<c:import url="../temp/js.jsp"></c:import>
</body>
</html>