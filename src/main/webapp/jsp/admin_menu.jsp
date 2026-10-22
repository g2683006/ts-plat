<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员操作页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/student_menu.css">
</head>
<body>
<div class="main">
    <!-- 菜单框 -->
    <div class="menu">
        <div class="img"><img class="img_src" src="${pageContext.request.contextPath}/img/a.jpg"/></div>
        <div class="title">你好，${admin.admin_name}管理员</div>
        <div>
            <a href="adminCustomerManages" target="myiframe">
                <input class="button" type="button" name="my_question" id="my_question" value="用户管理">
            </a>
        </div>
        <div>
            <a href="subjectManage" target="myiframe">
                <input class="button" type="button" name="quiz" id="quiz" value="授课信息管理">
            </a>
        </div>
        <div>
            <a href="jsp/login.html">
                <input class="button" type="button" name="my" id="my1" value="注销">
            </a>
        </div>
    </div>

    <!-- 操作框 -->
    <div class="operate">
        <iframe class="frame" name="myiframe"/>
    </div>
</div>
</body>
</html>
