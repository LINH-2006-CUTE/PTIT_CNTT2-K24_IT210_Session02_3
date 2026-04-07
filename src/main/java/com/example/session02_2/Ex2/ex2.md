* Mã lỗi :
  Controller gửi dữ liệu (đúng — không sửa):
  // ReportController.java
  @Controller
  public class ReportController {

  @GetMapping("/report")
  public String showReport(Model model) {
  List<Student> students = new ArrayList<>();
  students.add(new Student("Nguyễn Thị Bình", 92));
  students.add(new Student("Trần Minh Khoa", 75));
  students.add(new Student("Lê Thu Hà", 55));
  students.add(new Student("Phạm Duy An", 48));

        model.addAttribute("studentList", students);
        model.addAttribute("reportTitle", "Báo cáo điểm cuối kỳ");
        return "report";
  }
  }
  File JSP cần phân tích (report.jsp):
  <%@ page contentType="text/html;charset=UTF-8" language="java"
  import="java.util.List, com.demo.model.Student" %>

<%!
// Biến đếm toàn cục — dùng chung cho tất cả request
private int requestCounter = 0;
%>

<html>
<head>
    <!-- Tiêu đề trang báo cáo -->
    <title>Báo cáo điểm</title>
</head>
<body>

<%
requestCounter++;
List<Student> list = (List<Student>) request.getAttribute("studentList");
String title = (String) request.getAttribute("reportTitle");
%>

<h1><%= title %></h1>
<p>Lượt xem trang (LỖI tiềm ẩn): <%= requestCounter %></p>

<table border="1">
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>

<%
// Xử lý logic xếp loại ngay trong View
for (int i = 0; i < list.size(); i++) {
Student sv = list.get(i);
String rank;
if (sv.getScore() >= 90) {
rank = "Xuất sắc";
} else if (sv.getScore() >= 80) {
rank = "Giỏi";
} else if (sv.getScore() >= 70) {
rank = "Khá";
} else if (sv.getScore() >= 60) {
rank = "Trung bình khá";
} else if (sv.getScore() >= 50) {
rank = "Trung bình";
} else {
rank = "Yếu";
}
%>
<tr>
<td><%= i + 1 %></td>
<td><%= sv.getFullName() %></td>  <%-- LỖI: không an toàn XSS --%>
<td><%= sv.getScore()%>;</td>     <%-- LỖI: syntax dư dấu chấm phẩy --%>
<td><%= rank %></td>
</tr>
<%
}
%>
</table>

</body>
</html>

* Lập bảng phân tích ít nhất 5 vấn đề trong trang JSP trên

| STT | Vị trí                                 | Loại vấn đề    | Mô tả chi tiết & Hậu quả                                                                                                                 |
|-----|----------------------------------------|----------------|------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | <%! private int requestCounter = 0; %> | Race Condition | Biến khai báo trong thẻ Declaration <%! %> trở thành biến instance,nếu có nhiều người truy cập cùng lúc thì biến này sẽ bị tăng sai lệch |
| 2   | <%= sv.getFullName() %>                | Không bảo mật  | <%= %> để in trực tiếp dữ liệu sẽ hiện đoạn mã ngay trên trình duyệt làm lộ thông tin                                                    |
| 3   | if/else                                | Logic in View  | Vi phạm nguyên tắc MVC. View chỉ nên hiển thị dữ liệu,việc tính toán "Xuất sắc/Giỏi" nên nằm ở Controller hoặc Model                     |
| 4   | <%= sv.getScore()%>;                   | Lỗi cú pháp    | Trong <%= %>, không được phép có dấu chấm phẩy ; , dư dấu ; sẽ khiến không hiển thị trang                                                |
| 5   | ``                                     | Comment HTML   | Đây là comment của trình duyệt, nên dùng <%-- --%> để tránh lộ nội dung trong view source                                                |

* sửa bài : trong model: Student, ReportController, report