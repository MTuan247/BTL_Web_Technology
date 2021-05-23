Chạy thử web:

- Import file testdb.sql vào MySQL(hoặc SQL Server)
- Thay đổi DB_URL, USER_NAME và PASSWORD trong src/DB (có 2 file, dùng db nào thì sửa file connection của db đó)
- Nếu sử dụng SQL SERVER: sửa hàm getNextOrderID trong src/Utils/DBUtils: sửa thành Select Top.
- Tài khoản : tuan - 123 hoặc duy - 123
- Url: 
   + Admin quản lý product, category: /Admin
   + Admin quản lý User: /AdminUser
   + Admin quản lý Order: /AdminOrder
- Test các module sau : 
   + Login/ Logout: Tất cả các TH có thể xảy ra
   + Register: test trùng username, không điền mật khẩu/tài khoản 
   + Add to, remove from cart
   + Buy (trong module Cart)
   + Order: Order thử 1 cart, xem order history
   + Admin : Thêm sửa xóa 1 category, 1 product; Pending/Confirm thử order (Chưa xử lý phần delete user, có thể sẽ bỏ delete user).
- Các việc cần làm:
   + Hoàn thành frontend, tích hợp vào backend (JSP).
   + Regex
   + Url hơi quê :))))))
