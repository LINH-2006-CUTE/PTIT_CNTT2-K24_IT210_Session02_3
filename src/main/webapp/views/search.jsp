<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 06/04/2026
  Time: 11:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Khai báo taglib chuẩn Jakarta cho Tomcat 11 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <
    <td th:text="${event.name}">Tên sự kiện</td>
</head>
<body>
<h2>Kết quả tìm kiếm cho:
    <c:out value="${keyword}" default="Tất cả sự kiện"/>
</h2>

<p>Tổng cộng tìm thấy: <strong>${totalFound}</strong> sự kiện</p>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên sự kiện</th>
        <th>Ngày tổ chức</th>
        <th>Giá vé</th>
        <th>Trạng thái</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="e" items="${events}">
        <tr>
            <td>${e.id}</td>
            <td><c:out value="${e.name}"/></td>

            <td>${e.eventDate}</td>

            <td>
                <fmt:formatNumber value="${e.price}" type="currency" currencySymbol="VND"/>
            </td>

            <td>
                <c:choose>
                    <c:when test="${e.remainingTickets > 0}">
                        Còn ${e.remainingTickets} vé
                    </c:when>
                    <c:otherwise>
                        <span style="color:red;">Hết vé</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
