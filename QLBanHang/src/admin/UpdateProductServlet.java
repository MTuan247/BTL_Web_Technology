package admin;

import Model.Product;
import Utils.DBUtils;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProduct")
public class UpdateProductServlet extends AdminProductServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float sale = Float.parseFloat(request.getParameter("sale"));
        int available = Integer.parseInt(request.getParameter("available"));

        Product product = new Product(id,name,image,description,price,sale,available);
        DBUtils.changeProductInfo(product);
        response.sendRedirect("Admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product product = DBUtils.getProductByID(id);
        request.setAttribute("product",product);
        request.setAttribute("doUpdateProduct",true);
        super.doGet(request,response);
    }
}
