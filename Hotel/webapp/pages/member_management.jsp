<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>酒店订单管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css">
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
    <style>
        .nav ul li:nth-of-type(3){
            background: rgb(255,255,86);
        }
        .bfenlei:nth-of-type(3){
            background: rgb(131,142,222);
        }
        #qtable{
            margin-top: 50px;
            margin-left: 180px;
        }
        #qtable td{
            height: 70px;
        }
        .kbox{
            /*border: 1px solid #000;*/
            height: 440px;
            width: 90%;
            margin: 0 auto;
        }
        .kbox table{
            text-align: center;
            margin: 20px auto;
        }
        .kbox table td{
            height: 40px;
            width: 200px;
        }
        .updateP{
            width: 100px;
            height: 100px;
            position: absolute;
            right: 50px;
            top: 100px;
        }
    </style>
</head>
<body>




<div class="bbox">
    <jsp:include page="aside.jsp"></jsp:include>

    <div class="bright">

        <jsp:include page="header.jsp"></jsp:include>

        <h2><center>补充个人信息</center></h2>
        <div class="updateP">
            <a class="btn btn-app" href="${pageContext.request.contextPath}/pages/member_update_password.jsp">
                <i class="fa fa-edit"></i> 修改密码
            </a>
        </div>
        <div class="kbox">
            <form action="${pageContext.request.contextPath}/member/update" method="post">
                <input type="hidden" value="${sessionScope.member1.mid}" name="mid">
                <table border="1">
                    <tr>
                        <td>用户名:</td>
                        <td><input type="text" name="userName" value="${sessionScope.member1.userName}" readonly="readonly" ></td>
                    </tr>
                    <%--<tr>--%>
                        <%--<td>密码:</td>--%>
                        <%--<td><input type="text" name="passWord" value="${member.passWord}" readonly="readonly"  ></td>--%>
                    <%--</tr>--%>
                    <tr>
                        <td>昵称:</td>
                        <td><input type="text" name="nickName" value="${sessionScope.member1.nickName}"></td>
                    </tr>
                    <tr>
                        <td>姓名:</td>
                        <td><input type="text" name="realName" value="${sessionScope.member1.realName}" readonly="readonly" ></td>
                    </tr>
                    <tr>
                        <td>身份证号:</td>
                        <td><input type="text" name="identificationNum" value="${sessionScope.member1.identificationNum}" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <c:if test="${sessionScope.member1.sex =='男' || sessionScope.member1.sex == null}">
                                <select name="sex">
                                    <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </select>
                            </c:if>
                            <c:if test="${sessionScope.member1.sex =='女' }">
                                <select name="sex">
                                    <option value="男">男</option>
                                    <option value="女" selected>女</option>
                                </select>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>联系手机:</td>
                        <td><input type="text" name="telephone" id="telephone" value="${sessionScope.member1.telephone}" >
                            <span id="mes_telephone"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input type="text" name="email" id="email" value="${sessionScope.member1.email}">
                            <span id="mes_email"></span>
                        </td>
                    </tr>
                </table>
                <center><button type="submit" class="btn btn-info " id="sub_btn" onclick="MsgBox()">确认修改</button></center>
            </form>
        </div>
</div>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.js"></script>

        <script type="text/javascript">


            $(function () {
                $("#telephone").blur(function () {
                    regTelephone();
                })
                $("#email").blur(function () {
                    regEmail();
                })
            })

            //电话号码
            function regTelephone() {
                var  telephone= $("#telephone").val();
                var reg = /^[1][0-9][0-9]{9}$/;
                var flag = reg.test(telephone);
                if (flag){
                    $("#mes_telephone").html("");
                    $("#sub_btn").prop("disabled","");
                    if ($("#mes_email").html()=="格式错误"){
                        $("#sub_btn").prop("disabled","disabled");
                    }
                }else {
                    $("#mes_telephone").html("格式错误").css("color","red");
                    $("#sub_btn").prop("disabled","disabled");
                }
            }

            //邮箱
            function regEmail() {
                var  email= $("#email").val();
                var reg = /[0-9]+@[a-zA-Z]+.[a-zA-Z]{2,6}$/;
                var flag = reg.test(email);
                if (flag){
                    $("#mes_email").html("");
                    $("#sub_btn").prop("disabled","");
                    if ($("#mes_telephone").html()=="格式错误"){
                        $("#sub_btn").prop("disabled","disabled");
                    }
                }else {
                    $("#mes_email").html("格式错误").css("color","red");
                    $("#sub_btn").prop("disabled","disabled");
                }
            }

            function MsgBox()
            {
                alert("保存成功");
            }


        </script>


</body>
</html>