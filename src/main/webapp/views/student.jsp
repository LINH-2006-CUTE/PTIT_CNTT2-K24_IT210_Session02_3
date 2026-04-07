<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 06/04/2026
  Time: 11:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thẻ Sinh Viên Điện Tử</title>

</head>
<body>
<c:choose>
    <c:when test="${student == null}">
        <h2>Không tìm thấy sinh viên</h2>
        <a href="<c:url value='/students'/>">Quay lại danh sách</a>
    </c:when>
    <c:otherwise>
        <div class="card">
            <h2>THẺ SINH VIÊN</h2>
            <hr>
            <p>Mã SV: <strong>${student.id}</strong></p>
            <p>Họ tên: <c:out value="${student.name}"/></p>
            <p>Chuyên ngành: ${student.major}</p>
            <p>Năm thứ: ${student.year}</p>

            <p>GPA:
                <span class="${student.gpa >= 3.6 ? 'red' : ''}">${student.gpa}</span>
                <c:if test="${student.gpa >= 3.6}"> (Xuất sắc!)</c:if>
            </p>

            <p>Tình trạng: ${student.year == 4 ? "Sắp tốt nghiệp" : "Đang theo học"}</p>
            <a href="<c:url value='/students'/>">Xem danh sách khác</a>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>