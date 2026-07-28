<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="show_student">
    <div class="title">Online Q & A——修改知识点信息</div>
    <div class="show_table">
        <table>
            <tr>
                <td>知识点名称</td>
                <td>操作</td>
            </tr>
            <form action="updateKnowledge" method="POST">
                <tr>
                    <td><input class="button" name="name" value="${item.name}" type="text"></td>
                    <td>
                        <input type="submit" value="修改" class="button">
                        <input type="text" name="id" value="${item.id}" style="display: none;">
                    </td>
                </tr>
            </form>
        </table>
    </div>
</div>
</body>
</html>