<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 08/04/2026
  Time: 12:07 SA
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 06/04/2026
  Time: 10:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>Hệ thống Quản lý Đơn hàng</h1>

<p>Xin chào: <strong>${sessionScope.user}</strong></p>
<p>Tổng số lượt truy cập hệ thống: <span class="badge badge-info">${applicationScope.visitCount}</span></p>

<div class="alert alert-success">
    Tổng doanh thu:
    <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="VNĐ"/>
</div>

<a href="/logout" class="btn btn-danger">Thoát hệ thống</a>