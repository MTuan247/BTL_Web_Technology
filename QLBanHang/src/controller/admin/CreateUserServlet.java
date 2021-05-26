package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserAccount;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet("/CreateUser")
public class CreateUserServlet extends AdminUserServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        UserAccount user = new UserAccount(id,name,userName,password);
        if (checkValidUserName(userName,request,response)){
            DBUtils.insertUser(conn,user);
            response.sendRedirect("AdminUser");
        }
        else{
            request.setAttribute("invalidUsername", true);
            request.setAttribute("user",user);
            this.doGet(request,response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("doCreateUser",true);
        super.doGet(request,response);
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
