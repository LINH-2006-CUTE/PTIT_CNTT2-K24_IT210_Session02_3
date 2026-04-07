<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 06/04/2026
  Time: 11:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Mini Portal Nhân Sự</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

<header class="d-flex justify-content-between border-bottom pb-2">
    <h3>Portal Nhân Sự</h3>
    <div>
        Chào, <strong><c:out value="${sessionScope.display_name}"/></strong> |
        <a href="<c:url value='/logout'/>" class="text-danger">Thoát</a>
    </div>
</header>

<main class="mt-4">
    <h4>Danh sách nhân viên</h4>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Mã NV</th>
            <th>Họ Tên</th>
            <th>Phòng Ban</th>
            <th>Lương</th>
            <th>Trạng Thái</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="e" items="${empList}">
            <tr>
                <td>${e.id}</td>
                <td><c:out value="${e.name}"/></td>
                <td>${e.department}</td>
                <td><fmt:formatNumber value="${e.salary}" type="currency" currencySymbol="VNĐ"/></td>
                <td>
                    <c:choose>
                        <c:when test="${e.status == 1}"><span class="badge badge-success">Đang làm</span></c:when>
                        <c:when test="${e.status == 2}"><span class="badge badge-warning">Nghỉ phép</span></c:when>
                        <c:otherwise><span class="badge badge-secondary">Thử việc</span></c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${sessionScope.user_role == 'hr_manager'}">
                        <a href="#" class="btn btn-sm btn-primary">Sửa</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>
