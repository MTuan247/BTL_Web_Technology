package controller.client;

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

import model.Category;
import model.Product;
import model.UserAccount;
import utils.DBUtils;
import utils.MyUtils;

@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = MyUtils.getStoredConnection(request);
			
		Product product = null;
		List<String> listProductIDInCart = null;
		List<Category> listCategory = null;

		product = getProductByID(conn,request,response);
		listCategory = DBUtils.getAllCategory(conn);
		listProductIDInCart = getListProductIDInCart(conn,request,response);

		if(listProductIDInCart.contains(product.getID())) {
			product.setInCart(true);
		}
		
		request.getSession().setAttribute("numberOfCartProduct", listProductIDInCart.size());
		request.setAttribute("product", product);
		request.setAttribute("listCategory", listCategory);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/client/detailProduct.jsp");

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected Product getProductByID(Connection conn, HttpServletRequest request, HttpServletResponse response) {
		String productID = request.getParameter("productID");
		Product product = DBUtils.findProduct(conn, productID);
		return product;
	}
	
	protected List<String> getListProductIDInCart(Connection conn, HttpServletRequest request, HttpServletResponse response){
		List<String> listProductIDInCart = null;
		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);
		
		if (loginedUser != null) {
			listProductIDInCart = DBUtils.getAllProductIDFromCart(conn, loginedUser.getUserID());
		} else {
			listProductIDInCart = MyUtils.getCartProductID(session);
		}
		
		return listProductIDInCart;
	}
}
