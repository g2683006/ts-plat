<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="show_student">
    <div class="title">课程知识展示模块</div>
    <div class="show_table">
        <table>
            <tr>
                <td>课程名</td>
                <td>章节</td>
                <td>知识点</td>
            </tr>
            <c:forEach items="${knowledgeList}" var="item">
                <form action="question/qquestion.action" method="POST">
                    <tr>
                        <td><a href="http://localhost:8080/AnswerSystem_war_exploded/showquestion.action?question_id=${item.question_id}&teacher_id=${teacher_id}">${item.question_title}</a></td>
                        <td>
                            <input type="text" name="question_id" value="${item.question_id}" style=" float:left;display: none">
                            <input type="text" name="teacher_id" value="${teacher_id}" style=" float:left;display: none">
                            <input type="submit" value="删除" class="button">
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>