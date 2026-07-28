<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="show_student">
    <div class="title">Online Q & A——学生管理模块</div>
    <div class="show_table">
        <table>
            <tr>
                <td>ID</td>
                <td>姓名</td>
                <td>性别</td>
                <td>电话号码</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${studentList}" var="item">
                <form action="deleteStudent" method="POST" >
                    <tr>
                        <td>${item.student_id}</td>
                        <td>${item.student_name}</td>
                        <td>${item.student_sex}</td>
                        <td>${item.student_phone}</td>
                        <td>
                            <input type="submit" name="delete" value="删除" class="button">
                            <input type="hidden" name="sId" value="${item.student_id}">
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>
</div>
<div class="show_student">
    <div class="title">Online Q & A——教师管理模块</div>
    <div class="show_table">
        <table>
            <tr>
                <td>ID</td>
                <td>姓名</td>
                <td>性别</td>
                <td>电话号码</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${teacherList}" var="item">
                <form action="deleteTeacher" method="POST">
                    <tr>
                        <td>${item.teacher_id}</td>
                        <td>${item.teacher_name}</td>
                        <td>${item.teacher_sex}</td>
                        <td>${item.teacher_phone}</td>
                        <td><input type="submit" name="delete" value="删除" class="button">
                            <input type="hidden" name="tId" value="${item.teacher_id}">
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>