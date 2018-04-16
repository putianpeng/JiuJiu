<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人主页</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/js/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/video.css">
 <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/profile-less.css" type="text/css" />
</head>
<style type="text/css">
a {
	cursor: pointer;
}

#user {
	width: 100%;
	height: 20px;
}

#user a {
	float: right;
}

#user_p {
	text-align: center;
	font-size: xx-large;
}

#herder {
	width: 100%;
	height: 50px;
	background-color: #1DA1F2;
}

#herder_left {
	width: 15%;
	height: 100%;
	float: left;
	text-align: center;
}

.userIcon {
	width: 30px;
	height: 30px;
	display: block;
	border: solid 1px #122B40;
	border-radius: 50%;
	margin: 0 auto;
}

.userNickName {
	position: absolute;
	right: 20px;
	top: 16px;
}

#center_left {
	height: 100%;
	float: left;
	background-color: #DADADA;
}

#center_right {
	width: 80%;
	height: 800px;
	float: right;
}

.rifhtifame {
	width: 100%;
	height: 800px;
}

@media ( max-width : 767px) {
	#center_left {
		width: 100%;
	}
	.page-settings .setting .contentBox{
		width:100%;
	}
	.page-settings .setting{
		width:100%;
	}
}

.Photo_div {
	overflow: scroll;
}

.Photo_photo {
	width: 100%;
	height: 400px;
}

.deleteVpm_span {
	position: absolute;
	right: 0px;
	color: crimson;
	font-size: 20px;
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js.jsp"></script>
<script type="text/javascript">
	$(function() {
		/* 点击用户信息修改后的 操作*/
		$("#userMessage_li").click(function() {
			$("#myVpm").hide();
			$("#myComment").hide();
			$("#alterUserMessage").show();
		})

		/*点击我的评论过后的操作*/
		$("#myComment_li").click(function() {
			$("#alterUserMessage").hide();
			$("#myVpm").hide();
			$("#myComment").show();
		})

		$("#MyContributions").click(function() {
			$("#alterUserMessage").hide();
			$("#myVpm").show();
			$("#myComment").hide();
		})
		
		$("#select_img").change(function(){
			var inputObj = document.getElementById("select_img");
			// 获取img的dom元素
			var imgObj = document.getElementById("user_header_img");
			// 获取上传的文件信息
			var pic = inputObj.files[0];

			// 创建FileReader对象
			var reader = new FileReader();

			// 编码成Data URL (这一步最为关键)
			reader.readAsDataURL(pic);

			// 监听上传完成
			reader.onload = function() {
				// 拿到base64的路径
				var src = reader.result;
				// 改变img的src属性值
				imgObj.src = src;
			}
		})
		
		$("#aboutme").change(function(){
			var value = $(this).attr("value");
			console.log(value.length);
			if(value.length==100){
				alter("超出字数限制");
			}
		})
		$("#profile-submit").click(function(){
			$("#profile_form").submit();
		})

	})

	function pageChange(obj) {
		var value = obj.value;
		var actionurl = "${pageContext.servletContext.contextPath }"
				+ "/ReturnBookListServlet?method=onlyRequestUserData&pageNow="
				+ value
				+ "&pageShowNumber=${sessionScope.Pagination2.pageShowNumber}"
				+ "&dataShowNumber=${sessionScope.Pagination2.dataShowNumber}";
		$
				.post(
						actionurl,
						function(data) {
							if (data == "true") {
								window.location.href = "${pageContext.servletContext.contextPath }/userBookList.html";
							}
						})
	}
	function delVpm(obj) {
		var vpmId = $(obj).parent().attr("vpmId");
		$.post("${pageContext.request.contextPath }/delVpm", {
			"vpmId" : vpmId
		});
		$(obj).parent().remove();
	}
</script>

<body>
	<c:if test="${empty sessionScope.user }">
		<c:redirect url="/login.jsp"></c:redirect>
	</c:if>
	<div id="herder">
		<div id="herder_left">
			<img
				src="${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/${sessionScope.user.username }/img/headImg.jpg"
				class="userIcon" /> <a href="${pageContext.request.contextPath }/">返回首页</a>
			<span class="userNickName">${sessionScope.user.nickName}</span>
		</div>
		<div id="center_left">
			<ul class="nav nav-pills" style="height: 100%;">
				<li role="presentation" class="active"
					style="background-color: #337ab7; height: 100%;"><a>菜单</a></li>
				<li role="presentation" id="MyContributions"><a href="#">我的发稿</a></li>
				<li role="presentation" id="userMessage_li"><a>个人信息修改</a></li>
				<li role="presentation" id="myComment_li"><a href="#">我的评论</a></li>
			</ul>
		</div>
	</div>
	<div id="center">
		<div style="display: none;" id="myVpm" class="rifhtifame">
			<c:if test="${empty myVpmList }">
				<c:redirect url="/getMyVpmData"></c:redirect>
			</c:if>
			<div id="center" class="center">
				<c:forEach items="${myVpmList }" var="video">
					<div class="Video" vpmId="${video.vpmId}">
						<div class="Video_title">
							<div class="comment_body">
								<div class="comment_user">
									<img class="comment_userHeaderImg"
										src="${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/${video.userName }/img/headImg.jpg"></img>
									<span class="comment_userName">${video.userNickName }</span>
								</div>
								<p class="comment_user_content">${video.vpmContext }</p>
							</div>
						</div>
						<span class="glyphicon glyphicon-remove deleteVpm_span"
							onclick="delVpm(this)"></span>
						<c:choose>
							<c:when test="${video.vpmCategory == 'Video'}">
								<Video src="" class="Video_video" style="display: none;"
									id="video_iframe"></Video>
								<img controls src="${video.coverPath }" class="Video_video"
									onclick="coverClick(this)" vpmPath="${video.vpmPath }"></img>
							</c:when>
							<c:when test="${video.vpmCategory == 'Music'}">
								<audio controls src="${video.vpmPath }"
									class="Video_video Music_music"></audio>
							</c:when>
							<c:when test="${video.vpmCategory == 'Photo'}">
								<div class="Video_video Photo_div">
									<img src="${video.vpmPath }" class="Photo_photo"></img>
								</div>
							</c:when>
						</c:choose>

						<div class="Video_bottom">
							<span class="glyphicon glyphicon-thumbs-up clickGoodNum_span"
								onclick="clickGood(this)"><font class="clickGoodNum_font">${video.clickGoodNum }</font></span>
							<span class="glyphicon glyphicon-thumbs-down clickBadNum_span"
								onclick="clickBadNum(this)"><font
								class="clickGoodNum_font">${video.clickBadNum }</font></span> <span
								class="glyphicon glyphicon-comment comment_span"
								style="border: none;" vpmId="${video.vpmId}"
								onclick="clickCommentn(this)"><font
								class="clickGoodNum_font">${video.commentNum }</font></span>
						</div>
						<div class="comment">
							<div class="comment_top"></div>
							<div class="comment_bottom">
								<input class="comment_input" type="text" /><span
									class="comment_submit" vpmId=${video.vpmId }
									onclick="sendComment(this)">发送</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="display: none;" id="alterUserMessage" class="rifhtifame">
			<div id="main">

				<div class="page-settings">
					<div class="top">
						<div class="w960 mauto top_title">
							<p>个人设置</p>
						</div>
					</div>
					<div class="setting">
						<div class="nav-tabs pa">
							<h class="baseinfo fl active">基本信息</h>
							<a href="" class="countinfo fl">帐户信息</a> <a
								href="" class="countinfo fl">收货地址</a>
							<div class="cb"></div>
						</div>
						<div class="contentBox">
							<div class="formBox">
								<div id="setting-profile" class="setting-wrap setting-profile">
									<form id="profile_form"
										action="${pageContext.request.contextPath }/alterUserMessage"
										method="post" enctype="multipart/form-data">
										<div class="wlfg-wrap clearfix ">
											<label class="label-name" for="job">头像：</label>
											<div class="rlf-group" style="height: 218px;">
												<img class="fl avator-img" width="180" height="180"
													id="user_header_img">
												<div class="fl ml20 pr">
													<div id="avator-btns">
														<div class="avator-btn-wrap">
															<input type="file" title="上传头像" name="herder_img"
																id="select_img" accept="image/*">
														</div>
													</div>
												</div>
												<div class="cb"></div>
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>

										<div class="wlfg-wrap clearfix">
											<label class="label-name" for="nick">昵称：</label>
											<div class="rlf-group">
												<input type="text" name="nickName" id="nick"
													autocomplete="off" data-validate="require-nick"
													class="moco-form-control"
													value="${sessionScope.user.nickName }" placeholder="请输入昵称."
													style="margin-top: 10px;" />
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>
										<div class="wlfg-wrap clearfix">
											<label class="label-name" for="age">年龄：</label>
											<div class="rlf-group">
												<input type="text" name="age" id="age" autocomplete="off"
													data-validate="require-nick" class="moco-form-control"
													value="${sessionScope.user.age }" placeholder="请输入年龄."
													style="margin-top: 10px;" />
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>
										<div class="wlfg-wrap clearfix">
											<label class="label-name" for="birth">生日：</label>
											<div class="rlf-group">
												<input type="text" name="birth" id="birth"
													autocomplete="off" data-validate="require-nick"
													class="moco-form-control"
													value="${sessionScope.user.birth }" placeholder="请输入生日."
													style="margin-top: 10px;" />
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>
										<div class="wlfg-wrap clearfix">
											<label class="label-name" for="tel">电话：</label>
											<div class="rlf-group">
												<input type="text" name="tel" id="tel" autocomplete="off"
													data-validate="require-nick" class="moco-form-control"
													value="${sessionScope.user.tel }" placeholder="请输入电话."
													style="margin-top: 10px;" />
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>


										<div class="wlfg-wrap clearfix">
											<label class="label-name h16 lh16" style="margin-top: 5px;">性别：</label>
											<div class="rlf-group rlf-radio-group">
												<label class="lh16"><input type="radio"
													hidefocus="true" value="男" name="gender">男</label> <label
													class="lh16"><input type="radio" hidefocus="true"
													value="女" name="gender">女</label>
												<p class="rlf-tip-wrap errorHint color-red"></p>
											</div>
										</div>
										<div class="wlfg-wrap clearfix">
											<label class="label-name" for="profile-submit"></label>
											<div class="rlf-group">
												<span id="profile-submit" hidefocus="true"
													aria-role="button"
													class="rlf-btn-green btn-block profile-btn">保存</span>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div style="display: none;" id="myComment" class="rifhtifame"></div>
	</div>
</body>
</html>