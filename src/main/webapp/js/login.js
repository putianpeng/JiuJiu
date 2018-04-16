	$(function() {
		var name = $("#username").attr("value");
		var pass= $("#password").attr("value");
		if ("" == name || name == null) {
						document.getElementById("username").setCustomValidity("请输入账号");
				}
		if ("" == pass || pass == null) {
						document.getElementById("password").setCustomValidity("请输入密码");
				}
		var actionurl = $("#username").attr("actionurl");
		$("#username").change(
				function() {
					var name = $("#username").attr("value");
					console.log(name);
					if ("" == name || name == null) {
						document.getElementById("username").setCustomValidity("请输入账号");
					} else {
						$.post(actionurl+"/isHaveUsername",{"username" : name},function(data){
								var jsonData = JSON.parse(data);
								console.log(jsonData);
								if (jsonData.username == "true") {
									document.getElementById("username").setCustomValidity("");
									$("#username_span").html("");
								} else {
									console.log("账号未注册");
									$("#username_span").html("*账号未注册");
									document.getElementById("username").setCustomValidity("账号未注册");
								}
						})
					}
				})
		$("#password").change(function() {
			var name = $("#password").attr("value");
			if ("" == name || name == null) {
				document.getElementById("password").setCustomValidity("请输入密码");
			} else {
				document.getElementById("password").setCustomValidity("");
			}
		})
		
		$("#submit_button").click(function(){
			$("#login_from").submit();
		})
	})