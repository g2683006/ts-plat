<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        *{
            padding: 0px;
            margin:0px;
            color: #fff;
        }
        body{
            height: 100%;
            width: 100%;

        }
        .head{
            height: 25%;
            width: 100%;
            background-color: #4f5067 ;
        }
        .head div{
            font-weight: bold;
            font-size:30px;
            margin-left: 300px;
            padding-top: 50px;
        }
        .foot{
            height: 75%;
            width: 100%;
            background-color: #424242;
        }
        .float{
            height: 50%;
            width: 80%;
            background-color: #b9b9b9;
            position: fixed;
            top: 120px;
            left: 100px;
            border-radius: 25px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .detail{
            height: 90%;
            width: 90%;
            display: flex;
            flex-direction: row;
            align-items: center;
        }
        img{
            height: 230px;
            width: 230px;
        }
        .content{
            height: 100%;
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .content_box{
            width: 70%;
        }
        .text{
            color: black;
            font-size:25px;
            margin: 30px;
        }
    </style>
</head>
<body>
<div class="head"><div>Online Q & A——个人信息</div></div>
<div class="foot"></div>
<div class="float">
    <div class="detail">
        <div class="photo"><img src="img/c.png"></div>
        <div class="content">
            <div class="content_box" id="tip1">
                <div class="text">账号：${teacher.teacher_id}</div>
                <div class="text">姓名：${teacher.teacher_name}</div>
                <div class="text">性别：${teacher.teacher_sex}</div>
                <div class="text">联系方式：${teacher.teacher_phone}</div>
                <div class="text">职称：${teacher.jobtitle}</div>
                <button type="submit" onclick="tips()" class="btn" style="color:black;margin-left: 100px;width: 200px;">修改</button>
            </div>
            <div class="content_box" style="display: none" id="modify_tips">
                <form action="/AnswerSystem_war_exploded/teacherUpdate" method="post">
                    <input type="hidden" value="${teacher.teacher_id}" name="tId">
                    <div class="text"><span>名称：</span><input id="name" name="name" type="text" placeholder="请输入新的名称" value=""></div>
                    <div class="text"><span>电话：</span><input id="phone" name="phone" type="text" placeholder="请输入新的手机号码" value=""></div>
                    <div>
                        <button type="submit" class="btn" style="color:black;margin-left: 100px;margin-bottom:20px;width: 200px;">提交</button>
                        <button type="button" class="btn" onclick="cancel()" style="color:black;margin-left: 100px;width: 200px;">取消</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    function tips() {
        document.getElementById("tip1").style.display = 'none';
        document.getElementById("modify_tips").style.display = 'block';
    }

    function cancel() {
        document.getElementById("tip1").style.display = 'block';
        document.getElementById("modify_tips").style.display = 'none';
        document.getElementById("name").value='';
        document.getElementById("phone").value='';
    }
</script>
</body>
</html>