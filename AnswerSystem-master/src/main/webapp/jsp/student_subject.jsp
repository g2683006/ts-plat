<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生提问页面</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        * {

            padding: 0;
            margin: 0;
        }

        body {
            width: 100%;
            height: 100%;
            background-color: #414141;
        }

        .main {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .text {
            margin-top: 20px;
            font-size: 20px;
            color: #fff;
        }

        .question_title {
            height: 5%;
        }

        .button {
            margin-top: 20px;
            margin-left: 150px;
            width: 145px;
            height: 40px;
            border: 1px solid #fff;
            background: none;
            font-size: 20px;
            color: #fff;
            cursor: pointer;
        }

        .button:hover {
            background: rgba(255, 255, 255, .25);
        }

        input:focus {
            outline: none;
        }

        .question_title, .question_content {
            margin-top: 15px;
            width: 100%;
            font-size: 18px;
            background: none;
            border-bottom: 1px solid #fff;
            color: #fff;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
</head>
<body>
<%--<div class="main">--%>
<div>
    <table class="table table-bordered" style="color: #fff;">
        <h2 style="text-align: center;color: #FFF">教师课程查看</h2>
        <thead>
        <tr>
            <th>教师名称</th>
            <th>课程</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr>
                <td>${item.teacher.teacher_name}</td>
                <td>${item.subjectName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--</div>--%>
</body>
</html>
<script type="text/javascript">
    function subChange() {
        $("#know").find('option').remove();
        let subId = document.getElementById("subject").value
        <c:forEach items="${subAndKnow}" var="items">
        if (subId == ${items.subject.id}) {
            <c:forEach items="${items.knowledgeList}" var="element">
            $("#know").append("<option value=${element.id}>${element.name}</option>")
            </c:forEach>
        }
        </c:forEach>
    }
</script>
