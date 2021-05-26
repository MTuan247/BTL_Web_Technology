package controller.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserAccount;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet(urlPatterns = { "/Register" })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/client/registerView.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        UserAccount user = new UserAccount(userName,password);
        boolean hasError = false;
        String errorString = null;

        if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Tên tài khoản và Mật khẩu là bắt buộc!";
        } else if(!checkValidUserName(userName,request,response)){
            hasError = true;
            errorString = "Tên tài khoản đã tồn tại";
        }
        else {
            Connection conn = MyUtils.getStoredConnection(request);
            DBUtils.insertUser(conn,user);
        }
        // Trong trường hợp có lỗi,
        // forward (chuyển hướng) tới /WEB-INF/views/registerView.jsp
        if (hasError) {

            // Lưu các thông tin vào request attribute trước khi forward.
            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);

            // Forward (Chuyển tiếp) tới trang /WEB-INF/views/registerView.jsp
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/views/client/registerView.jsp");

            dispatcher.forward(request, response);
        }
        // Trường hợp không có lỗi.
        // Lưu thông tin người dùng vào Session.
        // Và chuyển hướng sang trang userInfo.
        else {
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, user);

            // Store cookie
            MyUtils.storeUserCookie(response, user);

            // Redirect (Chuyển hướng) sang trang /userInfo.
            response.sendRedirect(request.getContextPath() + "/Home");
        }
    }

    public boolean checkValidUserName(String username,HttpServletRequest request, HttpServletResponse response){
        Connection conn = MyUtils.getStoredConnection(request);
        List<UserAccount> listUser = DBUtils.getAllUser(conn);
        boolean valid = true;

        for (UserAccount user: listUser) {
            if(username.equals(user.getUserName())){
                valid = false;
                break;
            }
        }
        return valid;
    }

}