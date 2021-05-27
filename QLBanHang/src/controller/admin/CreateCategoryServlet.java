package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet("/CreateCategory")
public class CreateCategoryServlet extends AdminProductServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);

        String id = request.getParameter("id");
        String name = request.getParameter("name");

        Category category = new Category(Integer.parseInt(id),name);
        DBUtils.insertCategory(conn,category);
        response.sendRedirect("Admin");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("doCreateCategory",true);
        super.doGet(request,response);
    }
}
