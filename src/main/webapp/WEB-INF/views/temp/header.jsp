<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="nav-header">
	<a href="/" class="brand-logo">
		<img class="logo-abbr" src="/focus-bootstrap-main/theme/images/logo.png" alt="">
		<img class="logo-compact" src="/focus-bootstrap-main/theme/images/logo-text.png">
		<img class="brand-title" src="/focus-bootstrap-main/theme/images/logo-text.png">
	</a>

	<div class="nav-control">
		<div class="hamburger">
			<span class="line"></span><span class="line"></span><span
				class="line"></span>
		</div>
	</div>
</div>
<style>
.header{
z-index: 110;
}
.nav-header{
z-index: 116;
}
</style>
<div class="header">
	<div class="header-content">
		<nav class="navbar navbar-expand">
			<div class="collapse navbar-collapse justify-content-between">
				<div class="header-left">
					
				</div>

				<ul class="navbar-nav header-right">
					
					<li class="nav-item dropdown header-profile"><a
						class="nav-link" href="#" role="button" data-toggle="dropdown">
							<i class="mdi mdi-account"></i>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="/employee/mypage" class="dropdown-item"> <i
								class="icon-user"></i> <span class="ml-2">Profile </span>
							</a> <a href="/receive/inbox" class="dropdown-item"> <i
								class="icon-envelope-open"></i> <span class="ml-2">Inbox
							</span>
							</a> <a href="/employee/logout" class="dropdown-item"> <i
								class="icon-key"></i> <span class="ml-2">Logout </span>
							</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
</div>
