<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="add_student">
    <div class="title">Online Q & A——添加知识点</div>
    <div>
        <form action="addKnowledge" method="POST">
            <span>所属科目</span>
            <select id="subject" name="subId" style="color: #151515">
                <c:forEach items="${subList}" var="items">
                    <option style="color:#000;" value="${items.id}" selected>${items.name}</option>
                </c:forEach>
            </select>
            <input type="text" class="input" name="name" placeholder="知识点">
            <input type="submit" value="添加" class="button">
        </form>
    </div>
</div>
<div class="show_student">
    <div class="title">Online Q & A——展示知识点模块</div>
    <div class="show_table">
        <table>
            <tr>
                <td>课程名称</td>
                <td>知识点名称</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${knowList}" var="item">
                <tr>
                    <td>${item.subName}</td>
                    <td>${item.name}</td>
                    <td>
                        <form action="deleteKnowledge" method="POST">
                            <input type="submit" name="delete" value="删除" class="button">
                            <a href="/AnswerSystem_war_exploded/showUpdate?id=${item.id}"><input type="button" value="修改" class="button"></a>
                            <input type="text" name="id" value="${item.id}" style="display: none;">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div class="show_student" style="margin-top: -300px;">
    <div class="title">Online Q & A——展示知识点提问次数</div>
    <div class="show_table">
        <table>
            <tr>
                <td>知识点名称</td>
                <td>提问次数</td>
            </tr>
            <c:forEach items="${countList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.count}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>