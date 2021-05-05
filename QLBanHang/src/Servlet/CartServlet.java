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

import DB.ConnectionUtils;
import Model.Product;
import Model.UserAccount;
import Utils.DBUtils;
import Utils.MyUtils;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		if (loginedUser == null) {

			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}
		
		Connection conn = ConnectionUtils.getConnection();
		List<Product> listProduct = null;
		List<String> listProductIDInCart = null;
		
		listProduct = DBUtils.getAllProductFromCart(conn, loginedUser.getUserID());

		request.setAttribute("user", loginedUser);
		request.setAttribute("listProduct", listProduct);
		
		if (loginedUser != null) {

			listProductIDInCart = DBUtils.getAllProductIDFromCart(conn, loginedUser.getUserID());
			for (Product o : listProduct) {
				if(listProductIDInCart.contains(o.getProductID())) {
					o.setInCart(true);
				}
			}
		}

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/cartView.jsp");

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		doGet(request, response);
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		if (loginedUser == null) {

			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}
		
		Connection conn = ConnectionUtils.getConnection();
		
		String action = request.getParameter("action");
		String productID = request.getParameter("productID");
		String userID = loginedUser.getUserID();
		
//		System.out.println(productID);
//		System.out.println(userID);
//		System.out.println(action);
//		System.out.println(action.equalsIgnoreCase("Add To Cart"));
		
		if(action.equalsIgnoreCase("Add To Cart")) {
			DBUtils.insertToCart(conn, userID, productID);
		} else if (action.equalsIgnoreCase("Remove From Cart")) {
			DBUtils.removeFromCart(conn, userID, productID);
		}
		
		String url = request.getHeader("referer");
		response.sendRedirect(url);
		
	}

}
