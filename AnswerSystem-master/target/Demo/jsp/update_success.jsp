<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成功</title>
    <style type="text/css">
        * {
            padding: 0px;
            margin: 0px;
            color: #fff;
        }

        body {
            height: 100%;
            width: 100%;

        }

        .head {
            height: 25%;
            width: 100%;
            background-color: #4f5067;
        }

        .head div {
            font-weight: bold;
            font-size: 30px;
            margin-left: 300px;
            padding-top: 50px;
        }

        .foot {
            height: 75%;
            width: 100%;
            background-color: #424242;
        }

        .float {
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

        .detail {
            height: 90%;
            width: 90%;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        img {
            height: 230px;
            width: 230px;
        }

        .content {
            height: 100%;
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .content_box {
            width: 70%;

        }

        .text {
            color: black;
            font-size: 25px;
            margin: 30px;
        }
    </style>

</head>
<body>
    <div class="div_all">
        <div class="content">
            <div class="content_box" id="tip1">
                <div class="photo" style="margin-left: 400px;"><img src="img/ok.png"></div>
                <p style="text-align: center;font-size: 20px;margin-left: 300px;margin-top: 50px;"><a href="${router}">${message}</a></p>
            </div>
        </div>
    </div>
</body>
</html>
