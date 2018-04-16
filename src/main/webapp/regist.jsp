<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>九九注册</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
		
		<!-- css -->
		<link href="${pageContext.request.contextPath }/css/registstyle.css" rel='stylesheet' type='text/css' media="all" />
		<!-- /css -->
	</head>

	<body>
		<h1 class="w3ls">JiuJiu</h1>
		<div class="content-w3ls">
			<div class="content-agile1">
				<!--<h2 class="agileits1"></h2>
				<p class="agileits2"></p>-->
			</div>
			<div class="content-agile2">
				<form action="${pageContext.servletContext.contextPath }/regist" method="post" id="regist_form">
					<div class="form-control w3layouts">
						<input type="text" id="username" name="username" placeholder="账号" title="请输入你的账号" required="" action="${pageContext.servletContext.contextPath }">
						<span class="error_hint">*账号已被注册</span>
					</div>

					<div class="form-control w3layouts">
						<input type="tel" id="tel" name="tel" placeholder="电话" title="请输入你的电话号码" required="">
						<span class="error_hint">*电话号码格式错误</span>
					</div>

					<div class="form-control agileinfo">
						<input type="password" class="lock" name="password" placeholder="密码" id="password1" required="">
						<span class="error_hint">*密码错误</span>
					</div>

					<div class="form-control agileinfo">
						<input type="password" class="lock" name="confirm-password" placeholder="确认密码" id="password2" required="">
						<span class="error_hint">*两次密码不一致</span>
					</div>
					<div id="vcode" class="form-control agileinfo">
						<span class="Vcode_span">验证码:</span>
						<input type="text"  class="lock" name="Vcode" id="Vcode">
						<img alt="" src="${pageContext.servletContext.contextPath }/AuthImage" id="vcode_img"/>
						<span class="error_hint" style="display: -webkit-inline-box;margin-left: 0;display: none;">*验证码错误</span>
					</div>
					<input type="submit" class="register" value="注册" id="submit_button">
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
	
		<script src="${pageContext.request.contextPath }/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/registscript.js" type="text/javascript" charset="utf-8"></script>

</html>