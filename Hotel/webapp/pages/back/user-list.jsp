<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>数据 - AdminLTE2定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="/pages/back/admin_header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="/pages/back/admin_aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>全部用户</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/pages/back/admin_main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/userInfo/findAll.do">用户管理</a></li>

				<li class="active">全部用户</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/pages/back/user-add.jsp'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										
										<button type="button" class="btn btn-default" title="刷新" id="shuaxin">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<form action="${pageContext.request.contextPath}/userInfo/findUserByName" method="post">
										<input type="text" name="username" placeholder="搜索">
										<input type="submit" value="搜索" >
										<input type="button" value="查看全部" onclick="location.href='${pageContext.request.contextPath}/userInfo/findAll.do'">
									</form>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">用户名</th>
										<th class="sorting_asc sorting_asc_disabled">邮箱</th>
										<th class="sorting_desc sorting_desc_disabled">联系电话</th>
										<th class="sorting">状态</th>
										<th class="sorting">职位</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${info.list}" var="user">
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>${user.id }</td>
											<td>${user.username }</td>
											<td>${user.email }</td>
											<td>${user.phoneNum }</td>
											<c:if test="${user.status == 1}">
												<td>在职</td>
											</c:if>
											<c:if test="${user.status == 0}">
												<td>离职</td>
											</c:if>
											<td>${user.position}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/userInfo/findUserById?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
												<a href="${pageContext.request.contextPath}/userInfo/findUserByIdToUpdate?id=${user.id}" class="btn bg-olive btn-xs">修改</a>
												<a href="${pageContext.request.contextPath}/userInfo/findRoleByUserId?id=${user.id}" class="btn bg-olive btn-xs">添加权限</a>
												<c:if test="${user.position != '管理员'}">
												<c:if test="${user.status == 1}">
<%--													<a href="${pageContext.request.contextPath}/userInfo/upUserStatus?status=0&id=${user.id}" class="btn bg-olive btn-xs">炒鱿鱼</a>--%>
													<a href="javascript:del('${user.id}')" class="btn bg-olive btn-xs">炒鱿鱼</a>

												</c:if>
												<c:if test="${user.status == 0}">
													<a href="${pageContext.request.contextPath}/userInfo/upUserStatus?status=1&id=${user.id}" class="btn bg-olive btn-xs">上任</a>
												</c:if>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<!--
                            <tfoot>
                            <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            </tr>
                            </tfoot>-->
							</table>
							<!--数据列表/-->

							<!--分页栏-->
							<div id="bottom">
								<div>
									<nav aria-label="..." style="text-align:center;">
										<ul class="pagination">
											<!--利用运用ajax异步翻页 上一页-->
											<c:if test="${info.pageNum == 1}">
											<li class="disabled">
											</c:if>

											<c:if test="${info.pageNum != 1}">
												<li>
											</c:if>
												<a href="${pageContext.request.contextPath}/userInfo/findAll.do?page=${info.pageNum - 1}" aria-label="Previous">
													<span aria-hidden="true">«</span></a>

												<!--利用运用ajax异步翻页 对应页码-->
											</li>
											<!--当前页加深颜色-->
											<c:forEach begin="1" end="${info.pages}" var="i">
												<c:if test="${info.pageNum==i}">
													<li>

														<a href="${pageContext.request.contextPath}/userInfo/findAll.do?page=${i}"
														   style="background-color: grey">${i}</a>
													</li>
												</c:if>
												<c:if test="${info.pageNum!=i}">
													<li>

														<a href="${pageContext.request.contextPath}/userInfo/findAll.do?page=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>
											<!--利用运用ajax异步翻页 下一页-->
											<c:if test="${info.pageNum == info.pages}">
												<li class="disabled">
											</c:if>
											<c:if test="${info.pageNum != info.pages}">
												<li>
											</c:if>

												<a href="${pageContext.request.contextPath}/userInfo/findAll.do?page=${info.pageNum + 1}" aria-label="Next">
													<span aria-hidden="true">»</span></a>
											</li>
											<!--总页数-->
											<li style=" margin-left:150px;color: #0e90d2;height: 35px; line-height: 35px;">总共&nbsp;&nbsp;&nbsp;<font style="color:orange;">${info.pages}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<!--当前页-->
												<c:if test="${info.pageNum!=0}">
													当前&nbsp;&nbsp;&nbsp;<font style="color:orange;">${info.pageNum}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
												<!-- PageInfo的最后一页下一页是0页，手动设置为一页-->
												<c:if test="${info.pageNum==0}"> 当前&nbsp;&nbsp;&nbsp;<font style="color:orange;">1</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</li>
										</ul>
									</nav>
								</div>
							</div>

						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->

					<!-- /.box-footer-->

				</div>

				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2014-2017 <a
				href="http://www.itcast.cn">研究院研发部</a>.
			</strong> All rights reserved. </footer>
			<!-- 底部导航 /-->

		</div>

		<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script>

			//刷新
			$("#shuaxin").click(function () {
				$("#dataList").load("${pageContext.request.contextPath}/userInfo/findAll.do?page=${info.pageNum} #dataList");
			});


			$(document).ready(function() {
				// 选择框
				$(".select2").select2();

				// WYSIHTML5编辑器
				$(".textarea").wysihtml5({
					locale : 'zh-CN'
				});
			});

			// 设置激活菜单
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if (liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}

			$(document)
					.ready(
							function() {

								// 激活导航位置
								setSidebarActive("admin-datalist");

								// 列表按钮 
								$("#dataList td input[type='checkbox']")
										.iCheck(
												{
													checkboxClass : 'icheckbox_square-blue',
													increaseArea : '20%'
												});
								// 全选操作 
								$("#selall")
										.click(
												function() {
													var clicks = $(this).is(
															':checked');
													if (!clicks) {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck(
																		"uncheck");
													} else {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck("check");
													}
													$(this).data("clicks",
															!clicks);
												});
							});


			function del(id) {
				if (confirm("确认炒了该员工吗?")){
					location.href="${pageContext.request.contextPath}/userInfo/upUserStatus?status=0&id="+id;
				}
			}


		</script>
</body>

</html>