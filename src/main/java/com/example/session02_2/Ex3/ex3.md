1.Tại sao thông báo lỗi đăng nhập phải lưu vào Request Scope mà không phải Session Scope? Điều gì sẽ xảy ra nếu lưu nhầm
vào Session?
-> Vì thông báo lỗi chỉ có giá trị tức thời,nếu dữ liệu được truyền sang JSP thì sẽ tự động xóa sau khi kết thúc yêu cầu
Nếu lưu vào Session: thì người dùng đã đăng nhập xong vẫn thấy thông báo "Sai mật khẩu" hiện ở trang chủ

2.Tại sao totalViewCount phải lưu vào Application Scope? Nếu lưu vào Session Scope, mỗi nhân viên sẽ thấy con số khác
nhau như thế nào?
-> Để đếm tổng lượt truy cập của mọi người dùng. Đây là vùng nhớ dùng chung duy nhất cho toàn bộ Server
Nếu lưu vào Session: Mỗi nhân viên chỉ thấy lượt truy cập của chính họ. Nhân viên A vào 5 lần thấy số 5, nhân viên B vào
2 lần thấy số 2 nhưng tổng số thực tế là 7

3.Race Condition là gì và tại sao đoạn code dưới đây có thể gây ra Race Condition trong môi trường nhiều người dùng đồng
thời? Đề xuất cách phòng tránh:
// Đoạn code tiềm ẩn Race Condition — bạn phải giải thích và cải thiện
Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);
-> Race Condition là gì: Là tình trạng nhiều người dùng cùng Đọc và Ghi vào một biến chung tại cùng một thời điểm, dẫn
đến kết quả ghi đè lẫn nhau

"// Đoạn code tiềm ẩn Race Condition — bạn phải giải thích và cải thiện
Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);"
-> Nếu 2 người dùng truy cập cùng lúc, cả hai đều có thể đọc cùng một giá trị, bị ghi đè lên nhau
-> cải thiện
// Khởi tạo một lần duy nhất nếu chưa có
if (application.getAttribute("totalViewCount") == null) {
application.setAttribute("totalViewCount", new AtomicInteger(0));
}
rồi
// Lấy đối tượng Atomic ra và tăng trực tiếp
AtomicInteger count = (AtomicInteger) application.getAttribute("totalViewCount");
count.incrementAndGet(); 
