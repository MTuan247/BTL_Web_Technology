package controller.client;

import java.io.IOException;
import java.sql.Connection;

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

@WebServlet(urlPatterns = { "/UserInfo" })
public class UserInfoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public UserInfoServlet() {
       super();
   }

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       HttpSession session = request.getSession();


       UserAccount loginedUser = MyUtils.getLoginedUser(session);


       if (loginedUser == null) {

           response.sendRedirect(request.getContextPath() + "/Login");
           return;
       }

       request.setAttribute("user", loginedUser);

       RequestDispatcher dispatcher //
               = this.getServletContext().getRequestDispatcher("/WEB-INF/views/client/userInfoView.jsp");
       dispatcher.forward(request, response);

   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   Connection conn = MyUtils.getStoredConnection(request);
       String updateInfo = request.getParameter("update-info");
       if(updateInfo != null ) {
    	   updateInfo(conn, request, response);
       }
       String updatePass = request.getParameter("update-password");
       if(updatePass != null ) {
    	   String errorString = updatePassword(conn, request, response);
    	   if(errorString == null) {
    		   errorString = "Thành công!";
    	   }
    	   request.setAttribute("errorString", errorString);
       }
       
       
	   RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/WEB-INF/views/client/userInfoView.jsp");
	   dispatcher.forward(request, response);
	   return;
   }
   
   public void updateInfo(Connection conn, HttpServletRequest request, HttpServletResponse response) {
	   HttpSession session = request.getSession();

       UserAccount loginedUser = MyUtils.getLoginedUser(session);
	   
	   String name = request.getParameter("name");
	   String tel  = request.getParameter("tel");
	   String email  = request.getParameter("email");
	   loginedUser.setName(name);
	   loginedUser.setTel(tel);
	   loginedUser.setEmail(email);
	   DBUtils.updateUserInfo(conn, loginedUser.getUserID(), name, tel, email);
	   
   }
   
   public String updatePassword(Connection conn, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   HttpSession session = request.getSession();

       UserAccount loginedUser = MyUtils.getLoginedUser(session);
       
	   String hasError = null;
	   String newPass = request.getParameter("new-password");
	   String newPassRetype  = request.getParameter("new-password-retype");
	   String oldPass  = request.getParameter("old-password");
	   
	   if(!loginedUser.getPassword().equals(oldPass)) {
		   hasError = "Mật khẩu sai!";
	   } else if(!newPass.equals(newPassRetype)) {
		   hasError = "Mật khẩu nhập lại không khớp!";
	   }
	   if (hasError != null) {
		   return hasError;
	   }
	   loginedUser.setPassword(newPass);
	   DBUtils.updatePass(conn, loginedUser.getUserID(), newPass);
	   return hasError;
	   
   }

}