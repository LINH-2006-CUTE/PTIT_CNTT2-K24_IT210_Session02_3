1.XSS là gì? Tại sao <c:out value="${keyword}"/> an toàn hơn ${keyword} trong trường hợp này? So sánh HTML output được sinh ra khi input là <script>alert(1)</script>
-> XSS xảy ra khi dữ liệu người dùng nhập vào (keyword) hoặc dữ liệu "bẩn" từ Database chứa các thẻ script
Hậu quả: Trình duyệt sẽ thực thi đoạn mã đó, dẫn đến việc hacker có thể đánh cắp Cookie, chuyển hướng người dùng hoặc thay đổi giao diện web trái phép


2.Giải thích sự khác nhau giữa <c:if> và <c:choose>/<c:when>/<c:otherwise>. Trong bài này, phần hiển thị “Giá vé” và “Vé còn lại” nên dùng loại nào? Tại sao?
->thẻ này giúp chuyển đổi các ký tự đặc biệt (<, >, &, ") thành các thực thể HTML an toàn   
Sử dụng <c:out value="${keyword}"/>: Trình duyệt chỉ hiển thị mã đó dưới dạng văn bản thì an toàn


3.<c:url> giải quyết vấn đề gì so với hardcode href="/events/1/book"? Điều gì xảy ra khi ứng dụng được deploy với context path /ticketing thay vì /?
-> giúp tự động xử lý đường dẫn (URL Mapping) một cách linh hoạt thay vì viết cứng
khi deploy với context path /ticketing thì Lỗi 404 Not Found (http://localhost:8080/events/1/book)
-> nên  <c:url value="/events/1/book" />, JSTL sẽ kiểm tra môi trường deploy và thấy context path là /ticketing

* triển khai: search.jsp