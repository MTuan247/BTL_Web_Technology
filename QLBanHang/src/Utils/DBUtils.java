package Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Product;
import Model.UserAccount;
import Model.CartProduct;
import Model.Category;

public class DBUtils {

	public static UserAccount findUser(Connection conn, //
			String userName, String password) throws SQLException {

		String sql = "Select * from Account " //
				+ " where USER_NAME = ? and PASSWORD= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String userID = rs.getString("USER_ID");
			UserAccount user = new UserAccount();
			user.setUserID(userID);
			user.setUserName(userName);
			user.setPassword(password);
			user.setAdmin(rs.getBoolean("IS_ADMIN"));
			return user;
		}
		return null;
	}

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {

		String sql = "Select * from Account"//
				+ " where USER_NAME = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String userID = rs.getString("USER_ID");
			String password = rs.getString("Password");
			boolean isAdmin = rs.getBoolean("IS_ADMIN");
			UserAccount user = new UserAccount();
			user.setUserID(userID);
			user.setUserName(userName);
			user.setPassword(password);
			user.setAdmin(isAdmin);
			return user;
		}
		return null;
	}

	public static List<Product> getAllProduct(Connection conn) {
		String sql = "Select * from Product ";

		List<Product> list = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<Product>();
			while (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				String name = rs.getString("Name");
				String image = rs.getString("image");
				String description = rs.getString("description");
				float price = rs.getFloat("Price");
				float sale = rs.getFloat("sale");
				int available = rs.getInt("available");
				list.add(new Product(productID, name, image, description, price, sale, available));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<Product> getAllProductByID(Connection conn, String categoryID) {
		String sql = "Select * from Product\r\n" + "Where CATEGORY_ID = ?";

		List<Product> list = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, categoryID);

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<Product>();
			while (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				String name = rs.getString("Name");
				String image = rs.getString("image");
				String description = rs.getString("description");
				float price = rs.getFloat("Price");
				float sale = rs.getFloat("sale");
				int available = rs.getInt("available");
				list.add(new Product(productID, name, image, description, price, sale, available));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<Product> getAllProductBySearch(Connection conn, String search) {
		String sql = "Select * from Product where NAME like ?";

		List<Product> list = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, "%" + search + "%");

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<Product>();
			while (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				String name = rs.getString("Name");
				String image = rs.getString("image");
				String description = rs.getString("description");
				float price = rs.getFloat("Price");
				float sale = rs.getFloat("sale");
				int available = rs.getInt("available");
				list.add(new Product(productID, name, image, description, price, sale, available));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<CartProduct> getAllProductFromCart(Connection conn, String userID) {
		String sql = "Select * from Cart,Product where Cart.PRODUCT_ID = Product.PRODUCT_ID and USER_ID = ?";

		List<CartProduct> list = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, userID);

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<CartProduct>();
			while (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				String name = rs.getString("Name");
				String image = rs.getString("image");
				String description = rs.getString("description");
				float price = rs.getFloat("Price");
				float sale = rs.getFloat("sale");
				int available = rs.getInt("available");
				list.add(new CartProduct(productID, name, image, description, price, sale, available));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<String> getAllProductIDFromCart(Connection conn, String userID) {
		String sql = "Select * from Cart,Product where Cart.PRODUCT_ID = Product.PRODUCT_ID and USER_ID = ?";

		List<String> list = null;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, userID);

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<String>();
			while (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				list.add(productID);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<Category> getAllCategory(Connection conn) {

		String sql = "Select * from Category ";
		List<Category> list = null;

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			ResultSet rs = pstm.executeQuery();
			list = new ArrayList<Category>();
			while (rs.next()) {
				int categoryID = rs.getInt("CATEGORY_ID");
				String name = rs.getString("Name");
				list.add(new Category(categoryID, name));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static CartProduct findProduct(Connection conn, String id) {
		String sql = "Select * from Product where PRODUCT_ID=?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);

			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				String productID = rs.getString("PRODUCT_ID");
				String name = rs.getString("Name");
				String image = rs.getString("image");
				String description = rs.getString("description");
				float price = rs.getFloat("Price");
				float sale = rs.getFloat("sale");
				int available = rs.getInt("available");
				return new CartProduct(productID, name, image, description, price, sale, available);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void insertToCart(Connection conn, String userID, String productID) {
		String sql = "Insert into Cart(USER_ID, PRODUCT_ID) values (?,?)";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, userID);
			pstm.setString(2, productID);

			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void removeFromCart(Connection conn, String userID, String productID) {
		String sql = "Delete From Cart Where USER_ID = ? AND PRODUCT_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, userID);
			pstm.setString(2, productID);

			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void buyProduct(Connection conn, CartProduct product){
		String sql = "Update Product Set AVAILABLE=? Where PRODUCT_ID=?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setInt(1, product.getAvailable()-product.getNum());
			pstm.setString(2, product.getID());

			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public static void insertProduct(Connection conn, Product product) {
		
	}

	public static void deleteProduct(Connection conn, String code) throws SQLException {

	}

}