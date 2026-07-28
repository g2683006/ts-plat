<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>授课管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="add_student">
    <div class="title">Online Q & A——添加课程</div>
    <div>
        <form action="addSubject" method="POST">
            <input type="text" class="input" name="name" placeholder="课程名称">
            <input type="submit" value="添加" class="button">
        </form>
    </div>
</div>
<div class="add_student">
    <div class="title">Online Q & A——添加授课信息</div>
    <div>
        <form action="addSubjectAndTeacher" method="POST">
            <span>所属科目</span>
            <select id="subject" name="subName" style="color: #151515">
                <c:forEach items="${subList}" var="items">
                    <option style="color:#000;" value="${items.name}" selected>${items.name}</option>
                </c:forEach>
            </select>
            <span>任课教师</span>
            <select id="teacher" name="tId" style="color: #151515">
                <c:forEach items="${teaList}" var="items">
                    <option style="color:#000;" value="${items.teacher_id}" selected>${items.teacher_name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="添加" class="button">
        </form>
    </div>
</div>
<div class="show_student">
    <div class="title">Online Q & A——展示知识点模块</div>
    <div class="show_table">
        <table>
            <tr>
                <td>教师ID</td>
                <td>课程名称</td>
                <td>教师名称</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${list}" var="item">
                <tr>
                    <td>${item.teacher.teacher_id}</td>
                    <td>${item.subjectName}</td>
                    <td>${item.teacher.teacher_name}</td>
                    <td>
                        <form action="deleteSubTea" method="POST">
                            <input type="submit" name="delete" value="删除" class="button">
                            <a href="/AnswerSystem_war_exploded/showUpdateSub?id=${item.teacher.teacher_id}&&name=${item.subjectName}"><input type="button"  value="修改" class="button"></a>
                            <input type="hidden" value="${item.teacher.teacher_id}" name="tId">
                            <input type="hidden" value="${item.subjectName}" name="name">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>