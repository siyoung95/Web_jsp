<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩에서 반응형 웹을 위한 메타태그 -->
<meta name="viewport" content="widdth=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="login.jsp">JSP 게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active">
					<a class="nav-link" href="main.jsp">메인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">게시판</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="login.jsp">로그인</a> 
						<a class="dropdown-item" href="join.jsp">가입하기</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row"> <!-- ? -->
			<div class="col-lg-5 col-md-7 mx-auto"> <!-- 가로 길이 줄임 -->
				<div class="bg-light p-5 mt-5"> <!-- 폼 전체 이동 -->
					<form action="loginAction.jsp" method="post">
						<h3 class="text-center mb-3">로그인 화면</h3>
						<input type="text" class="form-control mb-3" name="userID" placeholder="아이디" maxlength="20" required>
						<input type="password" class="form-control mb-3" name="userPassword" placeholder="패스워드" maxlength="20" required>
						<input type="submit" class="btn btn-primary form-control mb-3" value="로그인">			
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>