<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入失败</title>
<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href=<%=basePath%>>
<link rel="stylesheet" href="backend/css/style.default.css" type="text/css" />

<script type="text/javascript" src="backend/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="backend/js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="backend/js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="backend/js/modernizr.min.js"></script>
<script type="text/javascript" src="backend/js/bootstrap.min.js"></script>
<script type="text/javascript" src="backend/js/jquery.cookie.js"></script>
<script type="text/javascript" src="backend/js/custom.js"></script>
</head>
<body class="errorpage" style="background-color: white">

<div class="mainwrapper">
    <div class="errortitle" align="center">
        <h1 class="animate0 fadeInUp" style="color: #00a7d0">亲！</h1>
		<h1 class="animate0 fadeInUp" style="color: red">您的账号已被禁用</h1>
        <h1 class="animate0 fadeInUp" style="color: red">有问题请联系工作人员</h1>
        <h1 class="animate0 fadeInUp" style="color: #8a6d3b">...</h1>
        <div class="errorbtns animate4 fadeInUp">
            <a onclick="history.back()" class="btn btn-primary btn-large" style="color: white">请</a>
            <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-large">重新登入</a>
        </div>
    </div>


</div>

</body>
</html>