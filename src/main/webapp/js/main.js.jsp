<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	/* 点赞事件 */
	function clickGood(obj){
		var colorstr = $(obj).siblings(".clickBadNum_span").css("color");
		var colorstr2 = $(obj).css("color");
		var vpmId = $(obj).parent().parent(".Video").attr("vpmId");
		if(colorstr!="rgb(255, 0, 0)"&&colorstr2!="rgb(255, 0, 0)"){
			var clickGoodNum = parseInt($(obj).children("font").html());
			$(obj).children("font").html(clickGoodNum+1);
			$(obj).css("color","red");
			$.post("${pageContext.request.contextPath }/vpmClickGood",{"vpmId":vpmId});
		}
	}
	/* 点踩事件 */
	function clickBadNum(obj){
				var colorstr = $(obj).siblings(".clickGoodNum_span").css("color");
				var colorstr2 = $(obj).css("color");
				var vpmId = $(obj).parent().parent(".Video").attr("vpmId");
				if(colorstr!="rgb(255, 0, 0)"&&colorstr2!="rgb(255, 0, 0)"){
					var clickGoodNum = parseInt($(obj).children("font").html());
					$(obj).children("font").html(clickGoodNum+1);
					$(obj).css("color","red");
					$.post("${pageContext.request.contextPath }/vpmClickBad",{"vpmId":vpmId});
				}
	}
	
	/* 回复评论事件 */
	function clickCommentn(obj){
				var thisNode = $(obj);
				var dispalystr = $(obj).parent().siblings(".comment").css("display");
				var vpmId = $(obj).attr("vpmId");
				if(dispalystr!="block"){
					$.post("${pageContext.request.contextPath }/getComment",{"vpmId":vpmId},function(data){
						$(thisNode).parent().siblings(".comment").children(".comment_top").children().remove();
						for(var i=data.length-1;i>=0;i--){
							$(thisNode).parent().siblings(".comment").children(".comment_top").append("<div class='comment_body' userId='"+data[i].userId+"' replyCommentId='"+data[i].commentId+"'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/"+data[i].userHeadImg+"'></img><span class='comment_userName'>"+data[i].userNickName+"</span><span class='comment_clickGood glyphicon glyphicon-thumbs-up' onclick='commentClickGood(this)'><font class='comment_clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span></div><p class='comment_user_content'>"+data[i].commentContext+"</p><span class='comment_comment_onoff glyphicon glyphicon-comment' onclick='onoffComments(this)'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span><div class='comment_comment'><div class='comment_comment_top'></div><div class='comment_comment_bottom'><input class='comment_comment_input' type='text' /><span class='comment_comment_submit' onclick='replyComment(this)'>发送</span></div></div></div>");
						}
					})
					
					$(obj).parent().siblings(".comment").show();
				}else{
					$(obj).parent().siblings(".comment").hide();
				}
	}
	
	/* 重新加载评论函数 */
		function clickComment(obj){
				var thisNode = $(obj);
				var vpmId = $(obj).attr("vpmId");
				$.post("${pageContext.request.contextPath }/getComment",{"vpmId":vpmId},function(data){
					$(thisNode).parent().siblings(".comment").children(".comment_top").children().remove();
					for(var i=data.length-1;i>=0;i--){
						$(thisNode).parent().siblings(".comment").children(".comment_top").append("<div class='comment_body' userId='"+data[i].userId+"' replyCommentId='"+data[i].commentId+"'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/"+data[i].userHeadImg+"'></img><span class='comment_userName'>"+data[i].userNickName+"</span><span class='comment_clickGood glyphicon glyphicon-thumbs-up' onclick='commentClickGood(this)'><font class='comment_clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span></div><p class='comment_user_content'>"+data[i].commentContext+"</p><span class='comment_comment_onoff glyphicon glyphicon-comment' onclick='onoffComments(this)'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span><div class='comment_comment'><div class='comment_comment_top'></div><div class='comment_comment_bottom'><input class='comment_comment_input' type='text' /><span class='comment_comment_submit' onclick='replyComment(this)'>发送</span></div></div></div>");
					}
				})
		}
	
	/* 发送评论事件 */
	function sendComment(obj){
		var vpmId = $(obj).attr("vpmId");
				if(${empty sessionScope.user}){
					$(obj).parent().siblings(".error_message_wring").remove();
					$(obj).parent().parent().append("<span class='error_message_wring'>请先登录<span>");
 					$(obj).parent().siblings(".error_message_wring").fadeIn(1000);
					$(obj).parent().siblings(".error_message_wring").fadeOut(3000);
				}else{
					var commentTxt = $(obj).siblings("input").val();
					var commentTxts = commentTxt.replace(/ /g,"");
					var thisValue = $(obj).html();
					
					var commentButton = $(obj).parent().parent().siblings(".Video_bottom").children(".comment_span");
					if(commentTxts!=""&&thisValue=="发送"){
						$.post("${pageContext.request.contextPath }/addComment",{"vpmId":vpmId,"commentContext":commentTxts},function(data){
							var jsonObj=JSON.parse(data);
							if(jsonObj.state=="true"){
								clickComment(commentButton);
							}
						});
						/* 前段事件 */
						var commentNum = parseInt($(obj).parent().parent().siblings(".Video_bottom").children(".comment_span").children("font").html());
						$(obj).parent().parent().siblings(".Video_bottom").children(".comment_span").children("font").html(commentNum+1);
						$.post("${pageContext.request.contextPath }/addVideoCommentNum",{"vpmId":vpmId});
						
						$(obj).html("50");
						var thisspan = $(obj);
						var s = setInterval(commentCoolingTimeless,1000);
						function commentCoolingTimeless(){
							var beforNum = parseInt($(thisspan).html());
							if(beforNum==0){
								clearInterval(s);
								$(thisspan).html("发送");
							}else{
								$(thisspan).html(beforNum-1);
							}
						}
					}
				}
	}
	
	
		
	function commentClickGood(obj){
				var commentId =$(obj).parent().parent(".comment_body").attr("replyCommentId");
				var colorstr = $(obj).css("color");
				if(colorstr!="rgb(255, 0, 0)"){
					var clickGoodNum = parseInt($(obj).children("font").html());
					$(obj).children("font").html(clickGoodNum+1);
				}
				$(obj).css("color","red");
				$.post("${pageContext.request.contextPath }/commentClickGood",{"commentId":commentId});
		}
	function userCommentClickGood(obj){
		var commentId =$(obj).parent().parent(".comment_comment_body").attr("commentId");
		var colorstr = $(obj).css("color");
		if(colorstr!="rgb(255, 0, 0)"){
			var clickGoodNum = parseInt($(obj).children("font").html());
			$(obj).children("font").html(clickGoodNum+1);
		}
		$(obj).css("color","red");
		$.post("${pageContext.request.contextPath }/userCommentClickGood",{"commentId":commentId});
	}
	
	function onoffComments(obj){
		var dispalystr = $(obj).siblings(".comment_comment").css("display");
		var commentUserId = $(obj).parent(".comment_body").attr("userId");
		var replyCommentId=$(obj).parent(".comment_body").attr("replyCommentId");
		var vpmId = $(obj).parent().parent().parent().parent(".Video").attr("vpmId");
		var thisNode = $(obj);
		if(dispalystr!="block"){
			$.post("${pageContext.request.contextPath }/getUserComment",{"vpmId":vpmId,"commentUserId":commentUserId,"replyCommentId":replyCommentId},function(data){
						$(thisNode).parent().children(".comment_comment").children(".comment_comment_top").children().remove();
						for(var i=0;i < data.length;i++){
							$(thisNode).parent().children(".comment_comment").children(".comment_comment_top").append("<div class='comment_comment_body' commentId='"+data[i].commentId+"'><div class='comment_comment_user'><img class='comment_comment_userHeaderImg' src='${pageContext.request.contextPath }/"+data[i].userHeadImg+"'></img><span class='comment_comment_userName'>"+data[i].userNickName+"</span><span class='comment_comment_clickGood glyphicon glyphicon-thumbs-up' onclick='userCommentClickGood(this)'><font class='comment_comment_clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span></div><p class='comment_comment_user_content'>"+data[i].commentContext+"</p></div>")
						}
					})
			$(obj).siblings(".comment_comment").show();
		}else{
			$(obj).siblings(".comment_comment").hide();
		}
	}
	
	/* 重新加载二级评论 */
	function clickUserComment(obj){
		var commentUserId = $(obj).parent(".comment_body").attr("userId");
		var replyCommentId=$(obj).parent(".comment_body").attr("replyCommentId");
		var vpmId = $(obj).parent().parent().parent().parent(".Video").attr("vpmId");
		var thisNode = $(obj);
			$.post("${pageContext.request.contextPath }/getUserComment",{"vpmId":vpmId,"commentUserId":commentUserId,"replyCommentId":replyCommentId},function(data){
						$(thisNode).parent().children(".comment_comment").children(".comment_comment_top").children().remove();
						for(var i=data.length-1;i>=0;i--){
							$(thisNode).parent().children(".comment_comment").children(".comment_comment_top").append("<div class='comment_comment_body' commentId='"+data[i].commentId+"'><div class='comment_comment_user'><img class='comment_comment_userHeaderImg' src='${pageContext.request.contextPath }/"+data[i].userHeadImg+"'></img><span class='comment_comment_userName'>"+data[i].userNickName+"</span><span class='comment_comment_clickGood glyphicon glyphicon-thumbs-up' onclick='userCommentClickGood(this)'><font class='comment_comment_clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span></div><p class='comment_comment_user_content'>"+data[i].commentContext+"</p></div>")
						}
					})
	}
	
	function replyComment(obj){
				if(${empty sessionScope.user}){
					$(obj).parent().siblings(".error_message_wring").remove();
					$(obj).parent().parent().parent().parent().append("<span class='error_message_wring'>请先登录<span>");
 					$(obj).parent().parent().parent().siblings(".error_message_wring").fadeIn(1000);
					$(obj).parent().parent().parent().siblings(".error_message_wring").fadeOut(3000);
				}else{
					var vpmId=$(obj).parent().parent().parent().parent().parent().parent(".Video").attr("vpmId");
					var commentUserId=$(obj).parent().parent().parent(".comment_body").attr("userId");
					var replyCommentId=$(obj).parent().parent().parent(".comment_body").attr("replyCommentId");
					var commentTxt = $(obj).siblings("input").val();
					var commentTxts = commentTxt.replace(/ /g,"");
					var thisValue = $(obj).html();
					var userCommentButton=$(obj).parent().parent().siblings(".comment_comment_onoff");
					if(commentTxts!=""&&thisValue=="发送"){
						$.post("${pageContext.request.contextPath }/addUserComment",{"vpmId":vpmId,"commentUserId":commentUserId,"commentContext":commentTxts,"replyCommentId":replyCommentId},function(data){
							var jsonObj=JSON.parse(data);
							if(jsonObj.state=="true"){
								clickUserComment(userCommentButton);
							}
						})
						var commentNum = parseInt($(obj).parent().parent().siblings(".comment_comment_onoff").children("font").html());
						$(obj).parent().parent().siblings(".comment_comment_onoff").children("font").html(commentNum+1);
						$.post("${pageContext.request.contextPath }/addUserCommentNum",{"commentId":replyCommentId});
						
						$(obj).html("50");
						var thisspan = $(obj);
						var s = setInterval(commentCoolingTimeless,1000);
						function commentCoolingTimeless(){
							var beforNum = parseInt($(thisspan).html());
							if(beforNum==0){
								clearInterval(s);
								$(thisspan).html("发送");
							}else{
								$(thisspan).html(beforNum-1);
							}
						}
					}
				}
}


	function refreshVideo(obj,vpmCategory){
			console.log(vpmCategory);
			var thisNode = $(obj);
			var s = setInterval(refreshButtonCoolingTimeless,10);
			var sstop = setTimeout(sstop,3000);
			var initNum =-90;
			function refreshButtonCoolingTimeless(){
				$(thisNode).css("-webkit-transform","rotate("+(initNum++)+"deg)")
			}
			function sstop(){
				clearInterval(s);
			}
			if(vpmCategory=="Video"){
				videoShow();
			}else if(vpmCategory=="Music"){
				musicShow();
			}else if(vpmCategory=="Photo"){
				photoShow();
			}else if(vpmCategory=="Show"){
				showShow();
			}
	}
	function addVideo(obj,vpmCategory){
			if(vpmCategory == "Video"){
				$("#avpm_select_img").remove();
				$("#avpm_fileinput").remove();
				$("#avpm_from").append("<video controls src='' id='avpm_select_img'></video><input type='file' name='vpmSource' id='avpm_fileinput' onchange='onloadSourcePath()' accept='video/mp4' />");
			}else if(vpmCategory == "Photo"){
				$("#avpm_select_img").remove();
				$("#avpm_fileinput").remove();
				$("#avpm_from").append("<img alt='' src='' id='avpm_select_img'><input type='file' name='vpmSource' id='avpm_fileinput' onchange='onloadSourcePath()' accept='image/jpeg,image/gif,image/x-png,image/x-MS-bmp' />");
			}else if(vpmCategory == "Music"){
				$("#avpm_select_img").remove();
				$("#avpm_fileinput").remove();
				$("#avpm_from").append("<audio controls src='' id='avpm_select_img'></audio><input type='file' name='vpmSource' id='avpm_fileinput' onchange='onloadSourcePath()' accept='audio/x-mpeg' />");
			}
			$("#addvpm").siblings(".books_iframe").hide();
			$("#addvpm").show();
	}
	function coverClick(obj){
		var vpmPath = $(obj).attr("vpmPath");
		$(obj).hide();
		$(obj).siblings("#video_iframe").attr("src",vpmPath);
		$(obj).siblings("#video_iframe").show();
	}
	
	
	  function videoShow(){
			$.post("${pageContext.servletContext.contextPath }/getVideoData",function(data){
				for(var i=0;i < data.length;i++){
					var vpmPath = data[i].vpmPath;
					var videoDom;
					videoDom = "<Video controls autoplay poster='"+data[i].coverPath+"' src='' class='Video_video' style='display:none;' id='video_iframe'></Video><img controls src='"+data[i].coverPath+"' class='Video_video' onclick='coverClick(this)' vpmPath='"+data[i].vpmPath+"'></img>";
					$("#Video_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div>"+videoDom+"<div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' style='border:none;' vpmId='"+data[i].vpmId+"' onclick='clickCommentn(this)'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
				}
			})
		}
		function musicShow(){
			$.post("${pageContext.servletContext.contextPath }/getMusicData",function(data){
				for(var i=0;i < data.length;i++){
					$("#Music_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div><audio controls src='" +data[i].vpmPath+"' class='Video_video Music_music'></audio><div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' onclick='clickCommentn(this)' style='border:none;' vpmId='"+data[i].vpmId+"'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
				}
			})
		}
		function photoShow(){
			$.post("${pageContext.servletContext.contextPath }/getPhotoData",function(data){
				for(var i=0;i < data.length;i++){
					$("#Photo_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div><img src='"+data[i].vpmPath+"' class='Video_video Photo_photo'></img><div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' onclick='clickCommentn(this)' style='border:none;' vpmId='"+data[i].vpmId+"'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
				}
			})
		}
		function showShow(){
			$.post("${pageContext.servletContext.contextPath }/getShowData",function(data){
				for(var i=0;i < data.length;i++){
					if(data[i].vpmCategory == "Video"){
						var vpmPath = data[i].vpmPath;
						var videoDom;
						videoDom = "<Video controls autoplay poster='"+data[i].coverPath+"' src='' class='Video_video' style='display:none;' id='video_iframe'></Video><img src='"+data[i].coverPath+"' class='Video_video' onclick='coverClick(this)' vpmPath='"+data[i].vpmPath+"'></img>";
						$("#Show_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div>"+videoDom+"<div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' onclick='clickCommentn(this)' style='border:none;' vpmId='"+data[i].vpmId+"'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
					}else if(data[i].vpmCategory == "Music"){
						$("#Music_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div><audio controls src='" +data[i].vpmPath+"' class='Video_video Music_music'></audio><div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' onclick='clickCommentn(this)' style='border:none;' vpmId='"+data[i].vpmId+"'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
					}else if(data[i].vpmCategory == "Photo"){
						$("#Photo_center").append("<div class='Video' vpmId='"+data[i].vpmId+"'><div class='Video_title'><div class='comment_body'><div class='comment_user'><img class='comment_userHeaderImg' src='${pageContext.request.contextPath }/resource/javaweb/JiuJiu/userData/"+data[i].userName+"/img/headImg.jpg'></img><span class='comment_userName'>"+data[i].userNickName+"</span></div><p class='comment_user_content'>"+data[i].vpmContext+"</p></div></div><img src='"+data[i].vpmPath+"' class='Video_video Photo_photo'></img><div class='Video_bottom'><span class='glyphicon glyphicon-thumbs-up clickGoodNum_span' onclick='clickGood(this)'><font class='clickGoodNum_font'>"+data[i].clickGoodNum+"</font></span><span class='glyphicon glyphicon-thumbs-down clickBadNum_span' onclick='clickBadNum(this)'><font class='clickGoodNum_font'>"+data[i].clickBadNum+"</font></span><span class='glyphicon glyphicon-comment comment_span' onclick='clickCommentn(this)' style='border:none;' vpmId='"+data[i].vpmId+"'><font class='clickGoodNum_font'>"+data[i].commentNum+"</font></span></div><div class='comment'><div class='comment_top'></div><div class='comment_bottom'><input class='comment_input' type='text' /><span class='comment_submit' onclick='sendComment(this)' vpmId='"+data[i].vpmId+"'>发送</span></div></div></div>");
					}
				}
			})
		}
	
	
	
	
	<!-- 添加内容js -->
		function back(vpmCategory){
			$("#addvpm").hide();
			if(vpmCategory == "Show"){
				$("#Video").hide();
				$("#Music").hide();
				$("#Photo").hide();
				$("#Show").show();
			}else if(vpmCategory == "Video"){
				$("#Show").hide();
				$("#Music").hide();
				$("#Photo").hide();
				$("#Video").show();
			}else if(vpmCategory == "Photo"){
				$("#Video").hide();
				$("#Music").hide();
				$("#Show").hide();
				$("#Photo").show();
			}else if(vpmCategory == "Music"){
				$("#Video").hide();
				$("#Music").hide();
				$("#Photo").hide();
				$("#Music").show();
			}
    		
    	}
		function onloadSourcePath(){
			var sourceDataSize = document.getElementById("avpm_fileinput").files[0].size;
			var sourceDataType = document.getElementById("avpm_fileinput").files[0].type;
			var maxDataSize;
			if(sourceDataType=="video/mp4"||sourceDataType=="video/x-msvideo"){
				maxDataSize = 20971520;
			}else if(sourceDataType=="image/jpeg"||sourceDataType=="image/gif"||sourceDataType=="image/bmp"){
				maxDataSize = 2097152;
			}else if(sourceDataType=="audio/mp3"){
				maxDataSize = 5242880;
			}else{
				alert("文件格式错误");
				return 0;
			}
			if(sourceDataSize>maxDataSize){
				alert("文件过大");
			}else if(sourceDataSize>10485760){
			}else{
	    		var inputObj = document.getElementById("avpm_fileinput");
				// 获取img的dom元素
				var imgObj = document.getElementById("avpm_select_img");
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
			}
    	}
		function submitForm(){
			var sourceDataSize = document.getElementById("avpm_fileinput").files[0].size;
			var sourceDataType = document.getElementById("avpm_fileinput").files[0].type;
			var maxDataSize;
			if(sourceDataType=="video/mp4"||sourceDataType=="video/x-msvideo"){
				maxDataSize = 20971520;
			}else if(sourceDataType=="image/jpeg"||sourceDataType=="image/gif"||sourceDataType=="image/bmp"){
				maxDataSize = 2097152;
			}else if(sourceDataType=="audio/mp3"){
				maxDataSize = 5242880;
			}else{
				alert("文件格式错误");
				return 0;
			}
			if(sourceDataSize>maxDataSize){
				alert("文件过大");
			}else{
				var vpmContext = document.getElementById("avpm_vpmtextarea").value;
				var vpmContextInput = document.getElementById("avpm_vpmTestInput");
				var from = document.getElementById("avpm_from");
				if(vpmContext.length>100){
					alert("字数太多");
				}else if(vpmContext.length==0){
					alert("标题不能为空");
				}else{
					vpmContextInput.value = vpmContext;
					from.submit();
				}
			}
		}
