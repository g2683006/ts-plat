<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生操作页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/student_menu.css">
    <script type="text/javascript">
    </script>
</head>
<body>
<div class="main">
    <!-- 菜单框 -->
    <div class="menu">
        <div class="img"><img class="img_src" src="${pageContext.request.contextPath}/img/c_b.png"/></div>
        <div class="title">你好，${student.student_name}同学
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/jsp/student_search.html" target="myiframe">
                <input class="button" type="button" value="搜索">
            </a>
        </div>

        <div>
            <a href="${pageContext.request.contextPath}/quiz?question_poid=${student.student_id}" target="myiframe">
                <input class="button" type="button" name="quiz" id="quiz" value="提问">
            </a>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/studentquestionByPoId.action?question_poid=${student.student_id}" target="myiframe">
                <input class="button" type="button" name="my_question" id="my_question" value="我的问题">
            </a>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/searchTeacherAndSubject?sId=${student.student_id}" target="myiframe">
                <input class="button" type="button" name="my_subject" id="my_subject" value="课程查看">
            </a>
        </div>
        <div>
            <a href="studentinfo.action?student_id=${student.student_id}" target="myiframe">
                <input class="button" type="button" name="my" id="my" value="个人资料">
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
        <iframe class="frame" name="myiframe">
    </div>
</div>
</body>
</html>
