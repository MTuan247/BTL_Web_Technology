package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserAccount;
import Utils.MyUtils;

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
       doGet(request, response);
   }

}