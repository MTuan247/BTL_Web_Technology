package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.DBUtils;
import Utils.MyUtils;
import DB.ConnectionUtils;
import Model.Category;
import Model.Product;
import Model.UserAccount;

@WebServlet("/Home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = ConnectionUtils.getConnection();
		List<Product> listProduct = null;
		List<String> listProductIDInCart = null;
		List<Category> listCategory = null;

		HttpSession session = request.getSession();

		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		listCategory = DBUtils.getAllCategory(conn);
		listProduct = getListProduct(conn, request, response);
		
		if (loginedUser != null) {

			listProductIDInCart = DBUtils.getAllProductIDFromCart(conn, loginedUser.getUserID());
			for (Product o : listProduct) {
				if(listProductIDInCart.contains(o.getProductID())) {
					o.setInCart(true);
				}
			}
		}

		request.setAttribute("listProduct", listProduct);
		request.setAttribute("listCategory", listCategory);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/homeView.jsp");

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected List<Product> getListProduct(Connection conn, HttpServletRequest request, HttpServletResponse response){
		return DBUtils.getAllProduct(conn);
	}
}
