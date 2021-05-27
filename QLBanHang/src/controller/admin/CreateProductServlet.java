package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet("/CreateProduct")
public class CreateProductServlet extends AdminProductServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Connection conn = MyUtils.getStoredConnection(request);

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float sale = Float.parseFloat(request.getParameter("sale"));
        int available = Integer.parseInt(request.getParameter("available"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));

        Product product = new Product(id,name,image,description,price,sale,available);
        System.out.println("Alo"+name);
        DBUtils.insertProduct(conn,product,categoryID);
        response.sendRedirect("Admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("doCreateProduct",true);
        super.doGet(request,response);
    }
}
