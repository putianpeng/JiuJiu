<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>九九短视频</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/js/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/index.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/video.css">
	</head>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/main.js.jsp"></script>
	<style type="text/css">
		a {
			cursor: pointer;
		}
		
		#User_icon {
			cursor: pointer;
		}
		
		@media ( max-width: 767px) {
			#nav_buttons li {
				width: 60px;
			}
			#top_tittle {
				height: 55px;
			}
			#nav {
				width: 80%;
			}
			#nav_buttons li a {
				padding: 0px;
			}
			#nav_buttons {
				margin-top: 18px;
			}
			.books_iframe {
				width: 90%;
			}
			.center_left {
				width: 5%;
			}
			.center_right {
				width: 5%;
			}
			.center{
				width:100%;
			}
		}
	</style>
	<script type="text/javascript">
		$(function() {
				showShow();
				$("#User_register").click(function() {
							var htmlvalue = $(this).attr("value");
							if(htmlvalue == "注销") {
								$.post("${pageContext.servletContext.contextPath }/logout");
								window.location.href = "index.jsp"
							} else {
								window.location.href = "login.jsp";
							}
				})
				$("#Vedio_a").click(function() {
					var dispalystr = $("#Video").css("display");
					if(dispalystr!="block"){
						videoShow();
					}
					$("#Video").show().siblings(".books_iframe").hide();
				})
				$("#Photo_a").click(function() {
					var dispalystr = $("#Photo").css("display");
					if(dispalystr!="block"){
						photoShow();
					}
					$("#Photo").show().siblings(".books_iframe").hide();
				})
				$("#Music_a").click(function() {
					var dispalystr = $("#Music").css("display");
					if(dispalystr!="block"){
						musicShow();
					}
					$("#Music").show().siblings(".books_iframe").hide();
				})
				$("#Show_a").click(function() {
					var dispalystr = $("#Show").css("display");
					if(dispalystr!="block"){
						showShow();
					}
					$("#Show").show().siblings(".books_iframe").hide();
				})

				$("#User_icon").click(function() {
							console.log(0);
							window.location.href = "${pageContext.servletContext.contextPath }/jspSkip/userIndex";
				})

			})
	</script>
	<body>
		<div id="top_tittle">
			<div id="logo" class="hidden-xs logo"></div>
			<div id="nav">
				<ul class="nav nav-tabs" id="nav_buttons">
					<li role="presentation">
						<a href="javascript:void(0)" id="Show_a">首页</a>
					</li>
					<li role="presentation">
						<a href="javascript:void(0)" id="Vedio_a">视频</a>
					</li>
					<li role="presentation">
						<a href="javascript:void(0)" id="Photo_a">图片</a>
					</li>
					<li role="presentation">
						<a href="javascript:void(0)" id="Music_a">音乐</a>
					</li>
				</ul>
			</div>
			<div id="User">
				<div id="User_left" class="hidden-xs"></div>
				<div id="User_right">
					<c:if test="${empty sessionScope.user.username }">
						<img src="${pageContext.request.contextPath }/img/userHeaderdefault.jpg" id="User_icon" />
					</c:if>
					<c:if test="${!(empty sessionScope.user.username )}">
						<img src="${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/${sessionScope.user.username }/img/headImg.jpg" id="User_icon" />
					</c:if>
					<div id="User_name" class="hidden-xs">
						<c:if test="${empty sessionScope.user }">
							未登陆
						</c:if>
						<c:if test="${!(empty sessionScope.user )}">
							${sessionScope.user.nickName }
						</c:if>
					</div>
					<div id="User_reen">
						<c:if test="${empty sessionScope.user }">
							<a id="User_register" href="javascript:void(0)" value="登陆">登陆</a>
						</c:if>
						<c:if test="${!(empty sessionScope.user )}">
							<a id="User_register" href="javascript:void(0)" value="注销">注销</a>
						</c:if>
						<a id="User_enroll" href="regist.jsp">注册</a>
					</div>
				</div>
			</div>
		</div>
		<div id="center" style="width: 100%; overflow: hidden;">
			<div class="center_left"></div>
			<div class="books_iframe" id="Show" style="display: block;">
				<div id="Show_center" class="center">
				</div>
				<span  id="refreshVideo_show" class="glyphicon glyphicon-repeat open refreshVideo" onclick="refreshVideo(this,'Show')"></span >
			</div>
			<div class="books_iframe" id="Video">
				<div id="Video_center" class="center">
				</div>
				<span id="refreshVideo_video" class="glyphicon glyphicon-repeat open refreshVideo" onclick="refreshVideo(this,'Video')"></span >
				<c:if test="${!empty sessionScope.user }">
						<span  class="glyphicon glyphicon-plus addVideo" onclick="addVideo(this,'Video')"></span >
				</c:if>
			</div>
			<div class="books_iframe" id="Photo">
				<div id="Photo_center" class="center">
				</div>
				<span id="refreshVideo_photo" class="glyphicon glyphicon-repeat open refreshVideo" onclick="refreshVideo(this,'Photo')"></span >
				<c:if test="${!empty sessionScope.user }">
						<span  class="glyphicon glyphicon-plus addVideo" onclick="addVideo(this,'Photo')"></span >
				</c:if>
			</div>
			<div class="books_iframe" id="Music">
				<div id="Music_center" class="center">
				</div>
				<span id="refreshVideo_music" class="glyphicon glyphicon-repeat open refreshVideo" onclick="refreshVideo(this,'Music')"></span >
				<c:if test="${!empty sessionScope.user }">
						<span class="glyphicon glyphicon-plus addVideo" onclick="addVideo(this,'Music')"></span >
				</c:if>
			</div>
			<div class="books_iframe" id="addvpm">
				<div class="avpm_center">
					<img class="avpm_back" src="${pageContext.request.contextPath }/img/go-back.png" onclick="back()"></img>
					<form action="${pageContext.request.contextPath }/addVpm/${vpmCategory}" method="post" enctype="multipart/form-data" class="avpm_from" id="avpm_from">
						<span style="margin-left: 18px;">请输入标题</span>
				<textarea class="avpm_vpmtext" id="avpm_vpmtextarea"></textarea>
				<input type="text" id="avpm_vpmTestInput" name="vpmContext" />
				<input type="button" value="上传" class="avpm_submit_input" onclick="submitForm()" />
				</form>
			</div>
		</div>
		<div class="center_right"></div>
		</div>
		<div id="bottom" style="width: 100%; height: 200px;"></div>
	</body>

</html>