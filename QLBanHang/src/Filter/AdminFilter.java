package Filter;

import Model.UserAccount;
import Utils.DBUtils;
import Utils.MyUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request ;
        HttpServletResponse resp = (HttpServletResponse) response ;
        HttpSession session = req.getSession();

        UserAccount userInSession = MyUtils.getLoginedUser(session);

        if (userInSession != null && userInSession.isAdmin()) {
            chain.doFilter(request, response);
            return;
        }
        resp.sendRedirect("/AdminLogin");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
