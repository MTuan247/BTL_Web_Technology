package controller.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartProduct;
import model.Order;
import utils.DBUtils;
import utils.MyUtils;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/AdminOrderDetail")
public class AdminOrderDetailServlet extends AdminOrderServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        String id = request.getParameter("id");
        Order order = DBUtils.findOrder(id);
        List<CartProduct> listProduct = DBUtils.getProductByOrderID(id);

        request.setAttribute("listProduct",listProduct);
        request.setAttribute("order",order);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/adminOrderDetail.jsp");

        dispatcher.forward(request, response);
    }

}
