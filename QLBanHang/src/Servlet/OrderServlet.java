package Servlet;

import Model.*;
import Utils.DBUtils;
import Utils.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/Order")
public class OrderServlet extends CartServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);


//        Lấy ra tên và sdt của user
//        HttpSession session = request.getSession();
//        UserAccount loginedUser = MyUtils.getLoginedUser(session);
//
//        request.setAttribute("user",loginedUser);
        
//        
        HttpSession session = request.getSession();
        UserAccount loginedUser = MyUtils.getLoginedUser(session);
        if (loginedUser == null) {
        	session.setAttribute("isOrder", true);
        	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Login");
        	dispatcher.forward(request, response);
        	return;
        } else {
        	MergeCart(conn, request);
        }
        
        List<CartProduct> listProduct = getListCartProduct(conn,request);
        double totalMoney = CalculateMoney(listProduct);
        request.setAttribute("user", loginedUser);
//        
        
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("//WEB-INF/views/orderView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    	
    	Connection conn = MyUtils.getStoredConnection(request);

        HttpSession session = request.getSession();
        String loginedUserID = MyUtils.getLoginedUser(session).getUserID();
        List<CartProduct> listProduct = getListCartProduct(conn,request);

        String orderID = DBUtils.getNextOrderID(conn);
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address") + ", " +request.getParameter("ward") + ", " +request.getParameter("district") + ", " + request.getParameter("city");
        double totalMoney = this.CalculateMoney(listProduct);


//        Order order = new Order(orderID,loginedUserID,name,phoneNumber,address,totalMoney,false);
        Order order = new Order(loginedUserID, name,phoneNumber,address,totalMoney,false);
        DBUtils.insertOrder(conn,order);
        for (CartProduct cp: listProduct) {
            OrderProduct orderProduct = new OrderProduct(orderID,cp.getProductID(),cp.getNum());
            DBUtils.insertOrderProduct(conn,orderProduct);
        }
        request.setAttribute("order",order);
        request.setAttribute("listProduct",listProduct);
             
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("//WEB-INF/views/orderSuccess.jsp");
        dispatcher.forward(request, response);

        CleanCart(conn, request);
    }
    
    public void MergeCart(Connection conn, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	List<CartProduct> listProduct = MyUtils.getCartProduct(session);
    	UserAccount loginedUser = MyUtils.getLoginedUser(session);
    	
    	for (CartProduct o : listProduct) {
    		String productID = o.getProductID();
    		int number = o.getNum();
    		String num = String.valueOf(number);
    		CartProduct cartProduct = DBUtils.findCartProduct(conn, productID, loginedUser.getUserID());
			if(cartProduct == null) {
				DBUtils.insertToCart(conn, loginedUser.getUserID(), productID, num);
			} else {
				number += cartProduct.getNum();
				DBUtils.updateNumberCartProduct(conn, loginedUser.getUserID(), productID, number);
			}
    	}
    	
	}

}
