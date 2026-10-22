<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生提问页面</title>
    <meta charset="UTF-8">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">--%>
<%--    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
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
    <script type="text/javascript">
        $(document).ready(function(){
            $("form").submit(function(e){
                alert("提交成功");
            });
        });
    </script>
</head>
<body>
<div class="main">
    <form action="${pageContext.request.contextPath}/question/add.action" method="POST">
        <div>
            <div class="text">标题:</div>
            <input type="text" name="question_title" class="question_title">
        </div>
        <div>
            <div class="text">
                <span>所属科目</span>
                <select id="subject" onchange="subChange()" name="subId">
                    <c:forEach items="${subAndKnow}" var="items">
                        <option value="${items.subject.id}" selected>${items.subject.name}</option>
                    </c:forEach>
                </select>
                <span>知识点</span>
                <select id="know" name="knowId">
                </select>
            </div>
        </div>
        <div>
            <div class="text">问题描述:</div>
            <textarea name="question_content" class="question_content" cols="50" rows="20"></textarea>
        </div>
        <input type="text" name="question_poid" value="${question_poid}" style="display: none;">
        <input class="button" type="submit" name="提交">
        <input class="button" type="reset" name="清空">
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    function subChange() {
        $("#know").find('option').remove();
        let subId = document.getElementById("subject").value
        <c:forEach items="${subAndKnow}" var="items">
        if(subId == ${items.subject.id}){
            <c:forEach items="${items.knowledgeList}" var="element">
            $("#know").append("<option value=${element.id}>${element.name}</option>")
            </c:forEach>
        }
        </c:forEach>
    }
</script>
