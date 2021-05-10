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

//import DB.ConnectionUtils;
import Model.CartProduct;
import Model.Product;
import Model.UserAccount;
import Utils.DBUtils;
import Utils.MyUtils;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		List<CartProduct> listProduct = getListCartProduct(conn,request);
		
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/cartView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("Add To Cart")) {
			AddToCart(conn,request);
		} else if (action.equalsIgnoreCase("Remove From Cart")) {
			RemoveFromCart(conn,request);
		} else if (action.equalsIgnoreCase("Change")) {
			UpdateNumber(conn,request);
			return;
		}
		
		String url = request.getHeader("referer");
		response.sendRedirect(url);
		
	}
	
	public List<CartProduct> getListCartProduct(Connection conn, HttpServletRequest request ){
		List<CartProduct> listProduct = null;
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		if (loginedUser == null) {
			listProduct = MyUtils.getCartProduct(session);
		} else {
			listProduct = DBUtils.getAllProductFromCart(conn, loginedUser.getUserID());
		}
		
		for (Product o : listProduct) {
			o.setInCart(true);
		}
		
		return listProduct;
	}
	
	public void AddToCart(Connection conn, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		String productID = request.getParameter("productID");
		
		if (loginedUser == null) {	
			List<CartProduct> listProduct = MyUtils.getCartProduct(session);
			List<String> listProductID = MyUtils.getCartProductID(session);
			listProduct.add(DBUtils.findProduct(conn, productID));
			listProductID.add(productID);
		} else {
			DBUtils.insertToCart(conn, loginedUser.getUserID(), productID);
		}
	}
	
	public void RemoveFromCart(Connection conn, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		String productID = request.getParameter("productID");
		
		if (loginedUser == null) {
			List<CartProduct> listProduct = MyUtils.getCartProduct(session);
			List<String> listProductID = MyUtils.getCartProductID(session);
			listProduct.removeIf(n -> (n.getID().equalsIgnoreCase(productID) ));
			listProductID.remove(productID);
		} else {
			DBUtils.removeFromCart(conn, loginedUser.getUserID(), productID);
		}
	}

	public void UpdateNumber(Connection conn, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		String productID = request.getParameter("productID");
		if (loginedUser == null) {
			List<CartProduct> listProduct = MyUtils.getCartProduct(session);
			for (CartProduct o : listProduct) {
				if(o.getProductID().equalsIgnoreCase(productID)) {
					o.setNum(o.getNum() + 1);
					System.out.println(o.getNum());
				}
			}
		} else {

		}
	}
}
