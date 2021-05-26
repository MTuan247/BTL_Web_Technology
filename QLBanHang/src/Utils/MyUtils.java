package Utils;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartProduct;
import Model.UserAccount;
 
public class MyUtils {
 
    public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";
 
    private static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";
    
    private static final String ATT_NAME_CART_LIST = "ATTRIBUTE_FOR_STORE_CART_LIST";
    
    private static final String ATT_NAME_CART_LIST_ID = "ATTRIBUTE_FOR_STORE_CART_LIST_ID";
 
    // Lưu trữ Connection vào attribute của request.
    // Thông tin lưu trữ này chỉ tồn tại trong thời gian yêu cầu (request)
    // cho tới khi dữ liệu được trả về trình duyệt người dùng.
    public static void storeConnection(ServletRequest request, Connection conn) {
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }
 
    // Lấy đối tượng Connection đã được lưu trữ trong attribute của request.
    public static Connection getStoredConnection(ServletRequest request) {
        Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }
 
    // Lưu trữ thông tin người dùng đã login vào Session.
    public static void storeLoginedUser(HttpSession session, UserAccount loginedUser) {
        // Trên JSP có thể truy cập thông qua ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }
    
    public static void deleteLoginedUser(HttpSession session) {
        session.setAttribute("loginedUser", null);
    }
 
    // Lấy thông tin người dùng lưu trữ trong Session.
    public static UserAccount getLoginedUser(HttpSession session) {
        UserAccount loginedUser = (UserAccount) session.getAttribute("loginedUser");
        return loginedUser;
    }
 
    // Lưu thông tin người dùng vào Cookie.
    public static void storeUserCookie(HttpServletResponse response, UserAccount user) {
        System.out.println("Store user cookie");
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getUserName());
        // 1 ngày (Đã đổi ra giây)
        cookieUserName.setMaxAge(24 * 60 * 60);
        response.addCookie(cookieUserName);
    }
 
    public static String getUserNameInCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (ATT_NAME_USER_NAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
 
    // Xóa Cookie của người dùng
    public static void deleteUserCookie(HttpServletResponse response) {
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
        // 0 giây. (Cookie này sẽ hết hiệu lực ngay lập tức)
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }
    
    // Lưu, Lấy danh sách sản phẩm trong list vào session
    public static void storeCartProduct(HttpSession session, List<CartProduct> list) {
    	session.setAttribute(ATT_NAME_CART_LIST, list);
    }
    
    public static List<CartProduct> getCartProduct(HttpSession session) {
    	@SuppressWarnings("unchecked")
		List<CartProduct> list = (List<CartProduct>) session.getAttribute(ATT_NAME_CART_LIST);
    	if (list == null) {
    		list = new ArrayList<CartProduct>();
    		storeCartProduct(session,list);
    	}
        return list;
    }
    
 // Lưu, Lấy danh sách id sản phẩm trong list vào session
    public static void storeCartProductID(HttpSession session, List<String> list) {
    	session.setAttribute(ATT_NAME_CART_LIST_ID, list);
    }
    
    public static List<String> getCartProductID(HttpSession session) {
    	@SuppressWarnings("unchecked")
		List<String> list = (List<String>) session.getAttribute(ATT_NAME_CART_LIST_ID);
    	if (list == null) {
    		list = new ArrayList<String>();
    		storeCartProductID(session,list);
    	}
        return list;
    }

    // format date to HH:mm dd/MM/yyyy
    public static String FormatDate(String invalidDate){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String validDate = null;
        try {
            Date date = formatter.parse(invalidDate);
            formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
            validDate = formatter.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return validDate;
    }
 
}