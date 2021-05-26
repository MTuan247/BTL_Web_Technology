package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Order;
import model.UserAccount;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet("/UpdateOrder")
public class UpdateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        Order order = DBUtils.findOrder(id);
        if(action.equalsIgnoreCase("Pending")){
            order.setStatus(false);
        } else {
            order.setStatus(true);
        }

        DBUtils.changeOrderInfo(order);

        response.sendRedirect("AdminOrder");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
