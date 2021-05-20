package Utils;

import java.security.AccessControlException;
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

import DB.*;

public class DBUtils {
	static Connection conn = ConnectionUtils.getConnection();

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
				int number = rs.getInt("Number");
				list.add(new CartProduct(productID, name, image, description, price, sale, available, number));
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
		String sql = "Insert into Cart(USER_ID, PRODUCT_ID, NUMBER) values (?,?,?)";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(1, userID);
			pstm.setString(2, productID);
			pstm.setString(3, "1");

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

	public static void updateNumberCartProduct(Connection conn, String userID, String productID, int number) {
		String sql = "Update Cart Set Number=? Where USER_ID = ? AND PRODUCT_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setString(2, userID);
			pstm.setString(3, productID);
			pstm.setInt(1, number);

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

	public static void insertProduct(Connection conn, Product product, int categoryID) {
		String sql = "INSERT INTO Product VALUES (?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, product.getID());
			pstm.setString(2,product.getName());
			pstm.setString(3, product.getImage());
			pstm.setFloat(4, product.getPrice());
			pstm.setFloat(5, product.getSale());
			pstm.setString(6, product.getDescription());
			pstm.setInt(7,categoryID);
			pstm.setInt(8, product.getAvailable());


			if(pstm.executeUpdate()>0){
				System.out.println("Success");
			}else {
				System.out.println("Fail");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void deleteProduct(Connection conn, String code) {
		String sql = "DELETE FROM product WHERE PRODUCT_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,code);
			pstm.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}

	public static Product getProductByID(String id){
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

	public static void changeProductInfo(Product product){
		String sql = "Update Product Set NAME=?,IMAGE=?,DESCRIPTION=?,PRICE=?,SALE=?,AVAILABLE=? Where PRODUCT_ID=?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,product.getName());
			pstm.setString(2, product.getImage());
			pstm.setString(3, product.getDescription());
			pstm.setFloat(4, product.getPrice());
			pstm.setFloat(5, product.getSale());
			pstm.setInt(6, product.getAvailable());
			pstm.setString(7,product.getID());

			if(pstm.executeUpdate()>0){
				System.out.println("Success");
			}else {
				System.out.println("Fail");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static List<UserAccount> getAllUser(Connection conn){
		List<UserAccount> accounts = new ArrayList<UserAccount>();
		String sql = "SELECT * FROM account WHERE IS_ADMIN = 0";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);

			ResultSet rs = pstm.executeQuery();
			while(rs.next()){
				String userID = rs.getString(1);
				String name = rs.getString(2);
				String userName = rs.getString(3);
				String password = rs.getString(4);
				UserAccount user = new UserAccount(userID,name,userName,password);
				accounts.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return accounts;
	}

	public static UserAccount getUserByID(Connection conn,String id){
		String sql = "SELECT * FROM account WHERE USER_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,id);
			ResultSet rs = pstm.executeQuery();

			if(rs.next()){
				String name = rs.getString("NAME");
				String userName = rs.getString("USER_NAME");
				String password = rs.getString("PASSWORD");
				UserAccount user = new UserAccount(id,name,userName,password);
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void changeUserInfo(UserAccount user){
		String sql = "Update account Set NAME=?,USER_NAME=?,PASSWORD=? Where USER_ID=?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,user.getName());
			pstm.setString(2,user.getUserName());
			pstm.setString(3,user.getPassword());
			pstm.setString(4,user.getUserID());
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertUser(Connection conn, UserAccount user){
		String sql = "INSERT INTO account(USER_ID,NAME,USER_NAME,PASSWORD) VALUES (?,?,?,?)";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getUserID());
			pstm.setString(2,user.getName());
			pstm.setString(3, user.getUserName());
			pstm.setString(4, user.getPassword());

			if(pstm.executeUpdate()>0){
				System.out.println("Success");
			}else {
				System.out.println("Fail");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void deleteUser(Connection conn, String code) {
		String sql = "DELETE FROM account WHERE USER_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,code);
			pstm.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}

	public static Category getCategoryByID(Connection conn, String id){
		String sql = "SELECT * FROM category WHERE CATEGORY_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,id);
			ResultSet rs = pstm.executeQuery();
			if(rs.next()){
				String name = rs.getString(2);
				return new Category(Integer.parseInt(id),name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void changeCategoryInfo(Category category){
		String sql = "Update category Set NAME=? Where CATEGORY_ID=?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,category.getName());
			pstm.setInt(2,category.getCategoryID());
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteCategory(Connection conn,String id){
		String sql = "DELETE FROM category WHERE CATEGORY_ID = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,id);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertCategory(Connection conn,Category category){
		String sql = "INSERT INTO category VALUES (?,?)";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1,category.getCategoryID());
			pstm.setString(2,category.getName());
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}