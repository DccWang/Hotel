<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->








    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

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
                <small>会员信息修改</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/back/admin_main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <a href="${pageContext.request.contextPath}/member/findAll.do">会员信息管理</a></li>
                <li class="active">会员信息修改</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">

            <form action="${pageContext.request.contextPath}/member/upMember" id="fr" method="post">
                <div class="panel panel-default mytab">
                    <div class="panel-heading">修改会员信息</div>
                    <div class="row data-type">
                        <input type="hidden" value="${members.mid}" name="mid">
                        <input type="hidden" value="${members.userName}" id="name">
                        <div class="col-md-2 title">会员号</div>
                        <div class="col-md-10 data text">
                            <input id="userName" type="text" name="userName" value="${members.userName}">
                            <span id="userNameSmg"></span>
                            <input type="hidden" id="userNameSmg1" value="1">
                        </div>

                        <div class="col-md-2 title">密码:</div>
                        <div class="col-md-10 data">
                            <input type="password" id="password" name="passWord" value="${members.passWord}">
                            <span id="passWordSmg"></span>
                            <input type="hidden" id="passWordSmg1" value="1">
                        </div>

                        <div class="col-md-2 title">昵称:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="nickName" name="nickName" value="${members.nickName}">
                            <span id="nickNameSmg"></span>
                            <input type="hidden" id="nickNameSmg1" value="1">
                        </div>

                        <div class="col-md-2 title">姓名:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="realName" name="realName" value="${members.realName}">
                            <span id="realNameSmg"></span>
                            <input type="hidden" id="realNameSmg1" value="1">
                        </div>



                        <div class="col-md-2 title">性别:</div>
                        <div class="col-md-10 data line-height36">
                            <div class="form-group form-inline">
                                <c:if test="${members.sex =='男' || members.sex == null}">
                                    <select name="sex">
                                        <option value="男" selected>男</option>
                                        <option value="女">女</option>
                                    </select>
                                </c:if>
                                <c:if test="${members.sex == '女' }">
                                    <select name="sex">
                                        <option value="男">男</option>
                                        <option value="女" selected>女</option>
                                    </select>
                                </c:if>

                            </div>
                        </div>

                        <div class="col-md-2 title">联系手机:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="phone" name="telephone" value="${members.telephone}">
                            <span id="phoneSmg"></span>
                            <input type="hidden" id="phoneSmg1" value="1">
                        </div>

                        <div class="col-md-2 title">身份证号:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="identificationNum" name="identificationNum" value="${members.identificationNum}">
                            <span id="ifNSmg"></span>
                            <input type="hidden" id="ifNSmg1" value="1">
                        </div>


                        <div class="col-md-2 title">电子邮箱:</div>
                        <div class="col-md-10 data text">
                            <input type="text" id="email" name="email" value="${members.email}">
                            <span id="emailSmg"></span>
                            <input type="hidden" id="emailSmg1" value="1">
                        </div>

                        <div class="col-md-2 title"></div>
                        <div class="col-md-10 data line-height36">
                            <button type="submit" id="btn" class="btn bg-maroon">保存</button>
                            <button type="reset" class="btn bg-default">重置</button>
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

    $("#btn").click(function () {
        var a = $("#emailSmg1").val() == "1"&&$("#userNameSmg1").val() == "1"&&$("#realNameSmg1").val() == "1"&&
            $("#phoneSmg1").val() == "1"&& $("#nickNameSmg1").val() == "1"&&$("#passWordSmg1").val() == "1"&&
            $("#ifNSmg1").val() == "1";

        if (!a){
            alert("请核对信息后在提交")
            return false;
        }
        $("#fr").submit();
    });


    function userNameSmg() {
        var userName = $("#userName").val();
        var name = $("#name").val();
        var reg = /^[a-zA-Z0-9_-]{2,16}$|(^[\u2E80-\u9FFF]{2,5}$)/;
        var flag = reg.test(userName);
        if (flag){
            if (userName == name){
                $("#userNameSmg").val("")
                $("#userNameSmg1").val("1")
            }else {
                $.post("${pageContext.request.contextPath}/member/findMemberByUserName",{"username":userName},function (data) {
                    for (var key in data) {
                        if (data[key]== "✔"){
                            $("#userNameSmg").html(data[key]).css("color","green")
                            $("#userNameSmg1").val("1")
                        }else {
                            $("#userNameSmg").html(data[key]).css("color","red")
                            $("#userNameSmg1").val("0");
                        }
                    }
                },"json")
            }
        }else {
            $("#userNameSmg").html("会员号必须是2-16位数字和字母的组合或者2-5位中文").css("color","red");
            $("#userNameSmg1").val("0");
        }
    }

    function passWordSmg() {
        var password = $("#password").val();
        var regpassword = /^[a-zA-Z0-9]{8,14}$/;
        var passwordflag = regpassword.test(password);
        if (!passwordflag){
            $("#passWordSmg").html("密码由9到11位字母或数组组成").css("color","red");
            $("#passWordSmg1").val("0");
        }else {
            $("#passWordSmg").html("✔").css("color","green");
            $("#passWordSmg1").val("1");
        }
    }

    function nickNameSmg() {
        var nickName = $("#nickName").val();
        var reg = /^[a-zA-Z0-9_-]{2,16}$|(^[\u2E80-\u9FFF]{2,5}$)/;
        var flag = reg.test(nickName);
        if (!flag){
            $("#nickNameSmg").html("昵称必须是2-16位数字和字母的组合或者2-5位中文").css("color","red");
            $("#nickNameSmg1").val("0");
        }else {
            $("#nickNameSmg").html("✔").css("color","green");
            $("#nickNameSmg1").val("1");
        }
    }

    function realNameSmg() {
        var realName = $("#realName").val();
        var regname= /^[\u4e00-\u9fa5]{2,4}$/;
        var nameflag = regname.test(realName);
        if (!nameflag){
            $("#realNameSmg").html("请输入正确的姓名").css("color","red");
            $("#realNameSmg1").val("0");
        }else {
            $("#realNameSmg").html("✔").css("color","green");
            $("#realNameSmg1").val("1");
        }
    }

    function phoneSmg() {
        var phone = $("#phone").val();
        var regphone = /^[0-9]{11}$/;
        var phoneflag = regphone.test(phone);

        if (!phoneflag){
            $("#phoneSmg").html("请输入11为数手机号码").css("color","red");
            $("#phoneSmg1").val("0");
        }else {
            $("#phoneSmg").html("✔").css("color","green");
            $("#phoneSmg1").val("1");
        }
    }

    function ifNSmg() {
        var identificationNum = $("#identificationNum").val();
        var ifn = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        var flag = ifn.test(identificationNum);
        if (!flag){
            $("#ifNSmg").html("身份证输入有误").css("color","red");
            $("#ifNSmg1").val("0");
        }else {
            $("#ifNSmg").html("✔").css("color","green");
            $("#ifNSmg1").val("1");
        }
    }
    function emailSmg() {
        var email = $("#email").val();
        var regemail = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        var flag = regemail.test(email);
        if (!flag){
            $("#emailSmg").html("邮件输入有误").css("color","red");
            $("#emailSmg1").val("0");
        }else {
            $("#emailSmg").html("✔").css("color","green");
            $("#emailSmg1").val("1");
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