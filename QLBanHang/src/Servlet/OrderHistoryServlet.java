package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;
import Utils.DBUtils;
import Utils.MyUtils;

@WebServlet("/OrderHistory")

public class OrderHistoryServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = MyUtils.getLoginedUser(session).getUserID();

        Connection conn = MyUtils.getStoredConnection(request);
        List<Order> listOrder = DBUtils.findOrderByUserID(userID);

        request.setAttribute("listOrder",listOrder);
        
//        
        UserAccount loginedUser = MyUtils.getLoginedUser(session);


        if (loginedUser == null) {

            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        request.setAttribute("user", loginedUser);
//
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/orderHistory.jsp");

        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
