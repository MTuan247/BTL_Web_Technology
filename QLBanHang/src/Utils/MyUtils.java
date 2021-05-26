package Utils;

import java.sql.Connection;
import java.util.ArrayList;
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
 
    // LÆ°u trá»¯ Connection vĂ o attribute cá»§a request.
    // ThĂ´ng tin lÆ°u trá»¯ nĂ y chá»‰ tá»“n táº¡i trong thá»�i gian yĂªu cáº§u (request)
    // cho tá»›i khi dá»¯ liá»‡u Ä‘Æ°á»£c tráº£ vá»� trĂ¬nh duyá»‡t ngÆ°á»�i dĂ¹ng.
    public static void storeConnection(ServletRequest request, Connection conn) {
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }
 
    // Láº¥y Ä‘á»‘i tÆ°á»£ng Connection Ä‘Ă£ Ä‘Æ°á»£c lÆ°u trá»¯ trong attribute cá»§a request.
    public static Connection getStoredConnection(ServletRequest request) {
        Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }
 
    // LÆ°u trá»¯ thĂ´ng tin ngÆ°á»�i dĂ¹ng Ä‘Ă£ login vĂ o Session.
    public static void storeLoginedUser(HttpSession session, UserAccount loginedUser) {
        // TrĂªn JSP cĂ³ thá»ƒ truy cáº­p thĂ´ng qua ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }
    
    public static void deleteLoginedUser(HttpSession session) {
        session.setAttribute("loginedUser", null);
    }
 
    // Láº¥y thĂ´ng tin ngÆ°á»�i dĂ¹ng lÆ°u trá»¯ trong Session.
    public static UserAccount getLoginedUser(HttpSession session) {
        UserAccount loginedUser = (UserAccount) session.getAttribute("loginedUser");
        return loginedUser;
    }
 
    // LÆ°u thĂ´ng tin ngÆ°á»�i dĂ¹ng vĂ o Cookie.
    public static void storeUserCookie(HttpServletResponse response, UserAccount user) {
        System.out.println("Store user cookie");
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getUserName());
        // 1 ngĂ y (Ä�Ă£ Ä‘á»•i ra giĂ¢y)
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
 
    // XĂ³a Cookie cá»§a ngÆ°á»�i dĂ¹ng
    public static void deleteUserCookie(HttpServletResponse response) {
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
        // 0 giĂ¢y. (Cookie nĂ y sáº½ háº¿t hiá»‡u lá»±c ngay láº­p tá»©c)
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }
    
    // LÆ°u, Láº¥y danh sĂ¡ch sáº£n pháº©m trong list vĂ o session
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
    
 // LÆ°u, Láº¥y danh sĂ¡ch id sáº£n pháº©m trong list vĂ o session
    public static void storeCartProductID(HttpSession session, List<String> list) {
    	session.setAttribute(ATT_NAME_CART_LIST_ID, list);
    }
    
    public static List<String> getCartProductID(HttpSession session) {
		List<String> list = new ArrayList<String>();
    	List<CartProduct> listProduct = getCartProduct(session);
		for(CartProduct o : listProduct) {
			list.add(o.getProductID());
		}
        return list;
    }
    
 
}