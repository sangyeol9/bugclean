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
										<div >
											<div class="form-group ">
												<label><strong>ID</strong></label>
												<div class="input-group mb-3">
													<input type="text" class="form-control" placeholder="username">
													<div class="input-group-append">
														<span class="input-group-text">@gmail.com</span>
													</div>
												</div>

												<div class="card-action" style="display: table;">
													<div class="dropdown custom-dropdown" style="width: 70px; display: table-cell; vertical-align: middle;">
														인증 요청
													</div>
												</div>
											</div>

										</div>

										<div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Recipient's username">
                                            <div class="input-group-append">
                                                <span class="input-group-text">@example.com</span>
                                            </div>
                                        </div>

										<div class="form-group">
											<label><strong>인증번호</strong></label>
											<input type="email" class="form-control" placeholder="hello@example.com">
										</div>

										<div class="form-group">
											<label><strong>Password</strong></label>
											<input type="password" class="form-control" value="Password">
										</div>
										<div class="form-group">
											<label><strong>이름</strong></label>
											<input type="text" class="form-control">
										</div>
										<div class="form-group">
											<label><strong>휴대전화번호</strong></label>
											<input type="text" class="form-control">
										</div>



										<div class="text-center mt-4">
											<button type="submit" class="btn btn-primary btn-block">Sign me up</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>Already have an account? <a class="text-primary" href="./login">Sign in</a></p>
									</div>


									<div class="col-md-6 col-xl-3 col-xxl-6 mt-4 mt-lg-0">
                                        <label>Now time</label>
                                        <div class="input-group">
                                            <input class="form-control" id="single-input" value="" placeholder="Now">
                                            <span class="input-group-btn"><button type="button" id="check-minutes"
                                                    class="btn waves-effect waves-light btn-ft btn-success">Check the
                                                    minutes</button></span>
                                        </div>
                                    </div>
									
									<div class="card-body">
										<div class="basic-form">
											<form class="form-valide-with-icon" action="#" method="post">
												<div class="form-group">
													<label class="text-label">Username</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"> <i class="fa fa-user"></i> </span>
														</div>
														<input type="text" class="form-control" id="val-username1" name="val-username" placeholder="Enter a username..">
													</div>
												</div>
												<div class="form-group">
													<label class="text-label">Password *</label>
													<div class="input-group transparent-append">
														<div class="input-group-prepend">
															<span class="input-group-text"> <i class="fa fa-lock"></i> </span>
														</div>
														<input type="password" class="form-control" id="val-password1" name="val-password" placeholder="Choose a safe one..">
														<div class="input-group-append show-pass">
															<span class="input-group-text"> <i class="fa fa-eye-slash"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="form-check">
														<input id="checkbox1" class="form-check-input" type="checkbox">
														<label for="checkbox1" class="form-check-label">Check me out</label>
													</div>
												</div>
												<button type="submit" class="btn btn-primary">Submit</button>
												<button type="submit" class="btn btn-light">cencel</button>
											</form>
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

	<c:import url="../temp/js.jsp"></c:import>
</body>
</html>