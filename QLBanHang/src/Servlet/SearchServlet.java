package Servlet;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Product;
import Utils.DBUtils;

import java.net.URLEncoder;

@WebServlet("/Search")
public class SearchServlet extends ProductListServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected List<Product> getListProduct(Connection conn, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String searchValue = request.getParameter("searchValue");

		System.out.println(searchValue);
		return DBUtils.getAllProductBySearch(conn, searchValue);
	}

}
