<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<%--<div class="add_student">--%>
<%--    <div class="title">Online Q & A——课程信息</div>--%>
<%--    <div class="add">--%>
<%--        <form action="addSubject" method="POST">--%>
<%--            <input type="text" class="input" name="student_id" placeholder="输入账号">--%>
<%--            <input type="text" class="input" name="student_name" placeholder="输入姓名">--%>
<%--            <input type="text" name="teacher_id" value="${teacher_id}" style="display: none;float: left;">--%>
<%--            <input type="submit" value="添加" class="button">--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="show_student">
    <div class="title">Online Q & A——展示课程信息</div>
    <div class="show_table">
        <table>
            <tr>
                <td>课程名称</td>
            </tr>
            <c:forEach items="${subList}" var="item">
                <tr>
                    <td>${item.subName}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>