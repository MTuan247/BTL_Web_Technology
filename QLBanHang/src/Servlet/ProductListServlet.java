package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Category;
import Model.Product;
import Utils.DBUtils;
import Utils.MyUtils;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductListServlet extends HomeServlet {
	private static final long serialVersionUID = 1L;

    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		List<Product> listProduct = null;
		List<String> listProductIDInCart = null;
		List<Category> listCategory = null;

		listCategory = DBUtils.getAllCategory(conn);
		listProduct = getListProduct(conn, request, response);
		listProductIDInCart = getListProductIDInCart(conn,request,response);

		for (Product o : listProduct) {
			if(listProductIDInCart.contains(o.getProductID())) {
				o.setInCart(true);
			}
		}

		request.setAttribute("listProduct", listProduct);
		request.setAttribute("listCategory", listCategory);

		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/productListView.jsp");

		dispatcher.forward(request, response);
	}


}
