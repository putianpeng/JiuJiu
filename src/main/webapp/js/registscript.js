window.onload = function() {
	document.getElementById("password1").onchange = validatePassword;
	document.getElementById("password2").onchange = validatePassword;
	document.getElementById("Vcode").setCustomValidity("请输入验证码");
}

function validatePassword() {
	var pass2 = document.getElementById("password2").value;
	var pass1 = document.getElementById("password1").value;
	if(pass1 != pass2)
		document.getElementById("password2").setCustomValidity(
			"密码不一样");
	else
		document.getElementById("password2").setCustomValidity('');
	// empty string means no validation error
}
$(function() {

	var actionurl = $("#username").attr("action");
	$("#username").focusout(function() {
		var username = $("#username").attr("value");
		console.log(username);
		if(""!=username){
				$.post(actionurl + "/isHaveUsername",{"username": username},function(data){
					if(data.username == "true") {
						document.getElementById("username").setCustomValidity("账号已被注册");
					} else {
						console.log("账号可用");
						document.getElementById("username").setCustomValidity("");
					}
				})
			}
		})
	})
	$("#vcode_img").click(function() {
		$("#vcode_img").attr("src", $("#vcode_img").attr("src") + "?");
	})
	$("#Vcode").change(function() {
		var value = $("#Vcode").attr("value");
		if("" == value || value == null) {
			document.getElementById("Vcode").setCustomValidity("请输入验证码");
		} else {
			document.getElementById("Vcode").setCustomValidity("");
		}
	})
	$("#tel").change(function() {
		var isPhone = /^1[34578]\d{9}$/;
		var telvalue = $("#tel").attr("value");
		console.log(telvalue);
		console.log("电话格式"+isPhone.test(telvalue));
		if(isPhone.test(telvalue)){
			document.getElementById("tel").setCustomValidity("");
		}else{
			document.getElementById("tel").setCustomValidity("电话号码格式不正确");
		}
	})