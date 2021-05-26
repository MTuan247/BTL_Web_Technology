package Servlet;

import Model.CartProduct;
import Model.Order;
import Model.UserAccount;
import Utils.DBUtils;
import Utils.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/OrderDetail")
public class OrderDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        String id = request.getParameter("id");
        Order order = DBUtils.findOrder(id);
        List<CartProduct> listProduct = DBUtils.getProductByOrderID(id);

//    
        HttpSession session = request.getSession();
        UserAccount loginedUser = MyUtils.getLoginedUser(session);
        if (loginedUser == null) {

            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }
//        
        request.setAttribute("listProduct",listProduct);
        request.setAttribute("order",order);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/orderDetail.jsp");

        dispatcher.forward(request, response);
    }

}
