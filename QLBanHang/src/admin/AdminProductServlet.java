package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartProduct;
import Model.Category;
import Model.Product;
import Utils.DBUtils;
import Utils.MyUtils;

@WebServlet("/Admin")

public class AdminProductServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Connection conn = MyUtils.getStoredConnection(request);
        List<Product> listProduct = null;
        List<Category> listCategory = null;

        listCategory = DBUtils.getAllCategory(conn);
        listProduct = getListProduct(conn, request, response);


        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/adminProductView.jsp");

        dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


    protected List<Product> getListProduct(Connection conn, HttpServletRequest request, HttpServletResponse response) {
        return DBUtils.getAllProduct(conn);
    }
}
