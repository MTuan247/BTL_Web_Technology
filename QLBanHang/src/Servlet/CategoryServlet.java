package Servlet;

import java.sql.Connection;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Product;
import Utils.DBUtils;

@WebServlet("/Category")
public class CategoryServlet extends ProductListServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected List<Product> getListProduct(Connection conn, HttpServletRequest request, HttpServletResponse response) {
		String categoryID = request.getParameter("categoryID");
		return DBUtils.getAllProductByID(conn, categoryID);
	}
}