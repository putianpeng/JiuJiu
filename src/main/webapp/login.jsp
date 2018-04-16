<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>九九登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/loginstyle.css">
</head>
<body>
	<span id="action_url" action="${pageContext.request.contextPath }"></span>
	<div class="page-container">
		<h1>登录</h1>
		<form action="${pageContext.servletContext.contextPath }/login"
			method="post" id="login_from">
			<div id="">
				<input type="text" name="username" class="username" placeholder="账号"
				id="username" actionurl="${pageContext.servletContext.contextPath }">
				<span id="username_span"></span>
			</div>
			<div id="">
				<input type="password" name="password" class="password"
				placeholder="密码" id="password">
				<span id="password_span">${sessionScope.loginErrorMessage }</span>
			</div>
			<button type="button" id="submit_button">登录</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
		<div id="" style="width: 300px; margin: 10px auto;">
			<a href="regist.jsp" style="float: right; text-decoration: none;color: azure;margin-right: 15px;">立即注册</a>
		</div>
		<div class="connect">
			<p>其他登录方式</p>
			<p>
				<a class="tenlent_qq" href=""></a> <a class="twitter" href=""></a>
			</p>
		</div>
	</div>
</body>

<script src="${pageContext.request.contextPath }/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>

</html>