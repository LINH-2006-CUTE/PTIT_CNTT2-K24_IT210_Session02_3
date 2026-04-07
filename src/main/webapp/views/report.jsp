<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 07/04/2026
  Time: 11:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 06/04/2026
  Time: 10:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Báo cáo điểm</title>
    <meta charset="utf-8">
</head>
<body>

<h1><c:out value="${reportTitle}"/></h1>

<p>
    Báo cáo danh sách sinh viên cuối kỳ
</p>

<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sv" items="${studentList}" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>

            <td><c:out value="${sv.fullName}"/></td>

            <td>${sv.score}</td>

            <td>
                <c:choose>
                    <c:when test="${sv.score >= 90}">Xuất sắc</c:when>
                    <c:when test="${sv.score >= 80}">Giỏi</c:when>
                    <c:when test="${sv.score >= 70}">Khá</c:when>
                    <c:when test="${sv.score >= 50}">Trung bình</c:when>
                    <c:otherwise>Yếu</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
