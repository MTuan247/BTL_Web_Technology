package admin;

import Model.Product;
import Utils.DBUtils;
import Utils.MyUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class DeleteServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        String id = request.getParameter("id");
        try {
            DBUtils.deleteProduct(conn,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("Admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
