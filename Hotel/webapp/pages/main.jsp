<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
	String contextPath = request.getContextPath();
%>
<head>
	<meta charset="UTF-8">
	<title>酒店订单管理系统</title>
	<link rel="stylesheet" type="text/css" href="../css/style1.css">
	<link rel="stylesheet" href="<%=contextPath%>/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/plugins/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" href="<%=contextPath%>/plugins/daterangepicker/daterangepicker.css">
	<style>
		.nav ul li:nth-of-type(3){
			background: rgb(255,255,86);
		}
		.bfenlei:nth-of-type(1){
			background: rgb(131,142,222);
		}
		#qtable{
			margin-top: 50px;
			margin-left: 180px;
		}
		#qtable td{
			height: 70px;
		}
		.bimg{
			margin-top: 20px;
			height: 400px;
			margin-left: 1px;
		}
	</style>
</head>
<body>
	<div class="bbox">

		<jsp:include page="aside.jsp"></jsp:include>

		<div class="bright">

			<jsp:include page="header.jsp"></jsp:include>
			<h2><center>晨住国际大酒店</center></h2>
			<img src="<%=contextPath%>/img/back.jpg" class="bimg">
		</div>
	</div>
	<script src="<%=contextPath%>/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=contextPath%>/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script src="<%=contextPath%>/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="<%=contextPath%>/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script>

		$()
        $(function() {

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true,
                format: 'yyyy/mm/dd'
            });
            $('#datepicker1').datepicker({
                autoclose: true,
                format: 'yyyy/mm/dd'
            });

        });

	</script>
</body>
</html>