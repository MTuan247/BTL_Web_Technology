package admin;

import Model.Product;
import Utils.DBUtils;
import Utils.MyUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCategory")
public class DeleteCategoryServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        String id = request.getParameter("id");
        List<Product> listProducts = DBUtils.getAllProductByID(conn,id);
        for (Product p:listProducts) {
            DBUtils.deleteProduct(conn,p.getID());
        }
        DBUtils.deleteCategory(conn,id);

        response.sendRedirect("Admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
