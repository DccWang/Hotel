<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="../css/bootstrap.css" />
		<link rel="stylesheet" href="../css/register.css" />
		<link rel="stylesheet" href="../css/footer&cbl.css" />
		<link rel="stylesheet" href="../css/daohang.css" />
		<script type="text/javascript" src="../js/jquery-1.11.3.js" ></script>
		<script type="text/javascript" src="../js/bootstrap.js" ></script>
		<script type="text/javascript" src="../js/templet.js" ></script>
		<title>注册界面</title>
	</head>
	<style>
		.main{
			margin-top: 100px;
		}
	</style>
	<body>
	<div id="main">
		<div class="main">
			<div class="container  ">
				<div class="c2">
					<a href=""></a><span>
						<img src="../img/logo.png" />
					</span></a>
					<p>注册界面</p>
				</div>
				<div class="c3">
					<form method="post" action="${pageContext.request.contextPath}/login/register">
						<div class="form-group">
							<label for="username">用户名</label>
							<input type="text" class="form-control" id="username" name="userName">
<%--							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_username"></span>
						</div>
  						<div class="form-group">
    						<label for="password">密码 </label>
    						<input type="password" class="form-control" id="password" name="passWord">
<%--  							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_password"></span>
  						</div>
  						<div class="form-group">
    						<label for="repassword">再次输入密码 </label>
    						<input type="password" class="form-control" id="repassword">
<%--							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_repassword"></span>
  						</div>
						<div class="form-group">
							<label for="email">手机号 </label>
							<input type="text" class="form-control" id="email" name="telephone">
<%--							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_email"></span>
						</div>
						<div class="form-group">
							<label for="realName">姓名 </label>
							<input type="text" class="form-control" id="realName" name="realName">
<%--							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_realName"></span>
						</div>
						<div class="form-group">
							<label for="identificationNum">身份证号 </label>
							<input type="text" class="form-control" id="identificationNum" name="identificationNum">
<%--							<span class="pp hide">此项必须填写</span>--%>
							<span id="mes_identificationNum"></span>
						</div>
  						<div class="c3-1">
							<button type="submit" onClick="return check()" id="sub_btn" class="btn btn-default btn1">注册</button>
							<a href="${pageContext.request.contextPath}/pages/login.jsp" type="button" class="btn btn-default btn2">已经有账号了?请登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</body>
	<script type="text/javascript" src="../js/hp.js" ></script>
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.js"></script>
	<script type="text/javascript">
		function check() {
			var username = document.getElementById("username");
			var password = document.getElementById("password");
			var repassword = document.getElementById("repassword");
			var email = document.getElementById("email");
			var realName = document.getElementById("realName");
			var identificationNum = document.getElementById("identificationNum");
			if (username.value==""){
				alert("请输入用户名！");
				return false;
			}else if(password.value==""){
				alert("请输入密码！");
				return false;
			}else if(repassword.value==""){
				alert("请确认密码！");
				return false;
			}else if(email.value==""){
				alert("请输入电话号码！");
				return false;
			}else if(realName.value==""){
				alert("请确认姓名！");
				return false;
			}else if(identificationNum.value==""){
				alert("请确认身份证号！");
				return false;
			}else if (password.value!=repassword.value){
				alert("两次密码输入不一致，请重新输入！");
				return false;
			}
		}



		$(function () {
			$("#username").blur(function () {
				regUserName();
			})
			$("#password").blur(function () {
				regPassword();
			})
			$("#repassword").blur(function () {
				regRepassword();
			})
			$("#email").blur(function () {
				regEmail();
			})
			$("#realName").blur(function () {
				regRealName();
			})
			$("#identificationNum").blur(function () {
				regIdentificationNum();
			})
			$("#repassword").blur(function () {
				mm();
			})

		})

		//用户名（ajax）
		function regUserName() {
			var  userName= $("#username").val();
			var reg = /^\w{2,10}$/;
			var flag = reg.test(userName);
			if (flag){
				$.post("${pageContext.request.contextPath}/regUserName",{"userName":userName,"smg":"register"},function (data) {
					for(var key in data){
						if (data[key]==""){
							$("#mes_username").html("");
							$("#sub_btn").prop("disabled","");
							// alert(1)
							if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_password").html()=="只能为3-11位的字母或数字"|$("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_email").html()=="只能为以1开头的11位数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_identificationNum").html()=="只能为18位的数字"){
								$("#sub_btn").prop("disabled","disabled");
							}
						}else {
							$("#mes_username").html(data[key]).css("color","red");
							$("#sub_btn").prop("disabled","disabled");
						}
					}
				},"json")
			}else {
				$("#mes_username").html("只能为2-10位的字母或数字").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}




		//密码
		function regPassword() {
			var  password= $("#password").val();
			var reg = /^\w{3,11}$/;
			var flag = reg.test(password);
			if (flag){
				$("#mes_password").html("");
				$("#sub_btn").prop("disabled","");
				// alert(2)
				if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_identificationNum").html()=="只能为18位的数字"|$("#mes_email").html()=="只能为以1开头的11位数字"){
					$("#sub_btn").prop("disabled","disabled");
				}
			}else {
				$("#mes_password").html("只能为3-11位的字母或数字").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}

		function regRepassword() {
			var  repassword= $("#repassword").val();
			var reg = /^\w{3,11}$/;
			var flag = reg.test(repassword);
			if (flag){
				$("#mes_repassword").html("");
				$("#sub_btn").prop("disabled","");
				// alert(3)
				if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_password").html()=="只能为3-11位的字母或数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_identificationNum").html()=="只能为18位的数字"|$("#mes_email").html()=="只能为以1开头的11位数字"){
					$("#sub_btn").prop("disabled","disabled");
				}
			}else {
				$("#mes_repassword").html("只能为3-11位的字母或数字").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}


		function mm() {
			var password = document.getElementById("password");
			var repassword = document.getElementById("repassword");
			if (password.value==repassword.value){
				$("#mes_repassword").html("");
				$("#sub_btn").prop("disabled","");
				if ($("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_password").html()=="只能为3-11位的字母或数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_identificationNum").html()=="只能为18位的数字"|$("#mes_email").html()=="只能为以1开头的11位数字"){
					$("#sub_btn").prop("disabled","disabled");
				}
			}else {
				$("#mes_repassword").html("两次输入的密码不一致").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}


		}


		//电话号码
		function regEmail() {
			var  email= $("#email").val();
			var reg = /^[1][0-9][0-9]{9}$/;
			var flag = reg.test(email);
			if (flag){
				$("#mes_email").html("");
				$("#sub_btn").prop("disabled","");
				// alert(4)
				if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_password").html()=="只能为3-11位的字母或数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_identificationNum").html()=="只能为18位的数字"|$("#mes_email").html()=="只能为以1开头的11位数字"){
					$("#sub_btn").prop("disabled","disabled");
				}
			}else {
				$("#mes_email").html("只能为以1开头的11位数字").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}

		//姓名
		function regRealName() {
			var  realName= $("#realName").val();
			var reg = /^[\u4e00-\u9fa5]{2,4}$/;
			var flag = reg.test(realName);
			if (flag){
				// alert(5)
				$("#mes_realName").html("");
				$("#sub_btn").prop("disabled","");
				if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_identificationNum").html()=="该身份证已被注册"|$("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_password").html()=="只能为3-11位的字母或数字"||$("#mes_email").html()=="只能为以1开头的11位数字"|$("#mes_identificationNum").html()=="只能为18位的数字"){
					$("#sub_btn").prop("disabled","disabled");
				}
			}else {
				$("#mes_realName").html("只能为2-4位的中文").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}

		//身份证
		function regIdentificationNum() {
			var  identificationNum= $("#identificationNum").val();
			var reg = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			var flag = reg.test(identificationNum);
			if (flag){

				$.post("${pageContext.request.contextPath}/regIdentificationNum",{"identificationNum":identificationNum,"smg":"register"},function (data) {
					for(var key in data){
						if (data[key]==""){
							// alert(6)
							$("#mes_identificationNum").html("");
							$("#sub_btn").prop("disabled","");
							if ($("#mes_repassword").html()=="两次输入的密码不一致"|$("#mes_username").html()=="只能为2-10位的字母或数字"|$("#mes_username").html()=="该用户名已存在"|$("#mes_password").html()=="只能为3-11位的字母或数字"|$("#mes_repassword").html()=="只能为3-11位的字母或数字"|$("#mes_realName").html()=="只能为2-4位的中文"|$("#mes_email").html()=="只能为以1开头的11位数字"){
								$("#sub_btn").prop("disabled","disabled");
							}
						}else {
							$("#mes_identificationNum").html(data[key]).css("color","red");
							$("#sub_btn").prop("disabled","disabled");
						}
					}
				},"json")
			}else {
				$("#mes_identificationNum").html("只能为18位的数字").css("color","red");
				$("#sub_btn").prop("disabled","disabled");
			}
		}


	</script>
	
</html>
