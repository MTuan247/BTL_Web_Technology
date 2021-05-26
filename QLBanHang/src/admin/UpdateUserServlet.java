package admin;

import Model.UserAccount;
import Utils.DBUtils;
import Utils.MyUtils;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUser")
public class UpdateUserServlet extends AdminUserServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserAccount user = new UserAccount(id,name,username,password);
        DBUtils.changeUserInfo(user);
        response.sendRedirect("AdminUser");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        String id = request.getParameter("id");
        UserAccount user = DBUtils.getUserByID(conn,id);
        request.setAttribute("user",user);
        request.setAttribute("doUpdateUser",true);
        super.doGet(request,response);
    }
}
