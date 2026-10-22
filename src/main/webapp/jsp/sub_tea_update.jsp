<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>授课信息修改</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/teacher_stumanage.css">
</head>
<body>
<div class="show_student">
    <div class="title">Online Q & A——修改授课信息</div>
    <div class="show_table">
        <table>
            <tr>
                <td>授课名称</td>
                <td>授课教师</td>
                <td>操作</td>
            </tr>
            <form action="updateSubTea" method="POST">
                <tr>
                    <td>
                        <select id="subject" name="newSubName" style="color: #151515">
                            <c:forEach items="${subList}" var="items">
                                <c:if test="${item.subName == items.name}">
                                    <option aria-selected="true" style="color:#000;" value="${items.name}" selected>${items.name}</option>
                                </c:if>
                                <option aria-selected="true" style="color:#000;" value="${items.name}">${items.name}</option>
                            </c:forEach>
                         </select>
                    </td>
                    <td>
                        <select id="teacher" name="newTid" style="color: #151515">
                            <c:forEach items="${teaList}" var="items">
                                <c:if test="${item.teaId == items.teacher_id}">
                                    <option style="color:#000;" value="${items.teacher_id}" selected>${items.teacher_name}</option>
                                </c:if>
                                <option style="color:#000;" value="${items.teacher_id}">${items.teacher_name}</option>
                            </c:forEach>
                        </select>
                        </td>
                    <td>
                        <input type="hidden" value="${item.subName}" name="subName">
                        <input type="hidden" value="${item.teaId}" name="teaId">
                        <input type="submit" value="修改" class="button">
                    </td>
                </tr>
            </form>
        </table>
    </div>
</div>
</body>
</html>