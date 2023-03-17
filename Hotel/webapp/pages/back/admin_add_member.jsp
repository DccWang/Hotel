<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html><!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">

</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="admin_header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="admin_aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                会员信息管理
                <small>会员信息添加</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/back/admin_main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/member/findPage">会员信息管理</a></li>
                <li class="active">会员信息添加</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">

            <form action="${pageContext.request.contextPath}/member/addMember" method="post">
                <div class="panel panel-default mytab">
                    <div class="panel-heading">添加会员信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">会员号</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="userName" name="userName">
                            <span id="userNameSmg"></span>
                        </div>

                        <div class="col-md-2 title">密码:</div>
                        <div class="col-md-10 data">
                            <input type="password" id="password" name="passWord">
                            <span id="passWordSmg"></span>
                        </div>

                        <div class="col-md-2 title">昵称:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="nickName" name="nickName">
                            <span id="nickNameSmg"></span>
                        </div>

                        <div class="col-md-2 title">姓名:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="realName" name="realName">
                            <span id="realNameSmg"></span>
                        </div>



                        <div class="col-md-2 title">性别:</div>
                        <div class="col-md-10 data line-height36">
                            <div class="form-group form-inline">
                                <select name="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-2 title">联系手机:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="phone" name="telephone">
                            <span id="phoneSmg"></span>
                        </div>

                        <div class="col-md-2 title">身份证号:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="identificationNum" name="identificationNum">
                            <span id="ifNSmg"></span>
                        </div>


                        <div class="col-md-2 title">电子邮箱:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="email" name="email">
                            <span id="emailSmg"></span>
                        </div>

                        <div class="col-md-2 title"></div>
                        <div class="col-md-10 data line-height36">
                            <input value="提交" disabled="disabled" id="btn" type="submit" class="btn btn-info" ></input>
                            <input value="重置" type="reset" class="btn btn-info" ></input>
                        </div>

                    </div>
                </div>
            </form>
        </section>
    </div>

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2014-2017 <a href="">Diesel_晨研发部</a>.</strong> All rights reserved.
    </footer>
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
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
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
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script>

    $(function () {
        $("#userName").blur(function () {
            userNameSmg();
        });

        $("#password").blur(function () {
            passWordSmg();
        });

        $("#phone").blur(function () {
            phoneSmg();
        });

        $("#realName").blur(function () {
            realNameSmg();
        });

        $("#identificationNum").blur(function () {
            ifNSmg();
        });

        $("#email").blur(function () {
            emailSmg();
        });

        $("#nickName").blur(function () {
            nickNameSmg();
        });
    })

    function userNameSmg() {
        var userName = $("#userName").val();
        var reg = /^[a-zA-Z0-9_-]{2,16}$|(^[\u2E80-\u9FFF]{2,5}$)/;
        var flag = reg.test(userName);
        if (flag){
            $.post("${pageContext.request.contextPath}/member/findMemberByUserName",{"username":userName},function (data) {
                for (var key in data) {
                    if (data[key]== "✔"){
                        $("#userNameSmg").html(data[key]).css("color","green")
                        if ($("#passWordSmg").html() =="✔" && $("#nickNameSmg").html()=="✔" && $("#emailSmg").html()=="✔"
                            && $("#phoneSmg").html()=="✔" && $("#realNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                            $("#btn").prop("disabled","")
                        }
                    }else {
                        $("#userNameSmg").html(data[key]).css("color","red")
                        $("#btn").prop("disabled","disabled")
                    }
                }
            },"json")
        }else {
            $("#userNameSmg").html("会员号必须是2-16位数字和字母的组合或者2-5位中文").css("color","red");
            $("#btn").prop("disabled","disabled")
        }
    }

    function passWordSmg() {
        var password = $("#password").val();
        var regpassword = /^[a-zA-Z0-9]{8,14}$/;
        var passwordflag = regpassword.test(password);
        if (!passwordflag){
            $("#passWordSmg").html("密码由9到11位字母或数组组成").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#passWordSmg").html("✔").css("color","green");
            if ($("#nickNameSmg").html()=="✔" && $("#emailSmg").html()=="✔" && $("#phoneSmg").html()=="✔" && $("#userNameSmg").html()=="✔"
                && $("#realNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                $("#btn").prop("disabled","")
            }
        }
    }

    function nickNameSmg() {
        var nickName = $("#nickName").val();
        var reg = /^[a-zA-Z0-9_-]{2,16}$|(^[\u2E80-\u9FFF]{2,5}$)/;
        var flag = reg.test(nickName);
        if (!flag){
            $("#nickNameSmg").html("会员号必须是2-16位数字和字母的组合或者2-5位中文").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#nickNameSmg").html("✔").css("color","green");
            if ($("#passWordSmg").html()=="✔" && $("#emailSmg").html()=="✔" && $("#phoneSmg").html()=="✔" && $("#userNameSmg").html().html()=="✔"
                && $("#realNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                $("#btn").prop("disabled","")
            }
        }
    }

    function realNameSmg() {
        var realName = $("#realName").val();
        var regname= /^[\u4e00-\u9fa5]{2,4}$/;
        var nameflag = regname.test(realName);
        if (!nameflag){
            $("#realNameSmg").html("请输入正确的姓名").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#realNameSmg").html("✔").css("color","green");
            if ($("#passWordSmg").html()=="✔" && $("#nickNameSmg").html()=="✔" && $("#emailSmg").html()=="✔" && $("#phoneSmg").html()=="✔"
                && $("#userNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                $("#btn").prop("disabled","")
            }
        }
    }

    function phoneSmg() {
        var phone = $("#phone").val();
        var regphone = /^[0-9]{11}$/;
        var phoneflag = regphone.test(phone);

        if (!phoneflag){
            $("#phoneSmg").html("请输入11为数手机号码").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#phoneSmg").html("✔").css("color","green");
            if ($("#passWordSmg").html()=="✔" && $("#nickNameSmg").html()=="✔" && $("#emailSmg").html()=="✔" && $("#userNameSmg").html()=="✔"
                && $("#realNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                $("#btn").prop("disabled","")
            }
        }
    }

    function ifNSmg() {
        var identificationNum = $("#identificationNum").val();
        var ifn = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        var flag = ifn.test(identificationNum);
        if (!flag){
            $("#ifNSmg").html("身份证输入有误").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#ifNSmg").html("✔").css("color","green");
            if ($("#passWordSmg").html()=="✔" && $("#nickNameSmg").html()=="✔" && $("#emailSmg").html()=="✔" && $("#phoneSmg").html()=="✔"
                && $("#userNameSmg").html()=="✔" && $("#realNameSmg").html()=="✔" ){
                $("#btn").prop("disabled","")
            }
        }
    }
    function emailSmg() {
        var email = $("#email").val();
        var regemail = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        var flag = regemail.test(email);
        if (!flag){
            $("#emailSmg").html("邮件输入有误").css("color","red");
            $("#btn").prop("disabled","disabled")
        }else {
            $("#emailSmg").html("✔").css("color","green");
            if ($("#passWordSmg").html()=="✔" && $("#nickNameSmg").html()=="✔" && $("#phoneSmg").html()=="✔" && $("#userNameSmg").html()=="✔"
                && $("#realNameSmg").html()=="✔" && $("#ifNSmg").html()=="✔"){
                $("#btn").prop("disabled","")
            }
        }
    }
</script>


<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
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


    $(document).ready(function() {
        $('#datepicker-a3').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
    });


    $(document).ready(function() {
        $('#datepicker-a6').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
    });


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("order-manage");
    });
</script>
</body>

</html>
<!---->