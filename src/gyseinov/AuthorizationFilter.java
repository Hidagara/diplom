package gyseinov;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by hidagara on 29.04.2016.
 */
@WebFilter(filterName = "AuthorizationFilter" , urlPatterns = "/view/admintool.jsp")
public class AuthorizationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
                int role = Integer.parseInt(String.valueOf(session.getAttribute("role")));
        String page = null;
        switch (role)
        {
            case 0:
                page = "/view/user.jsp";
                break;
            case 1:
                page = "/view/admintool.jsp";
                break;
            default:
                page = "/authFail.jsp";

        }

        response.sendRedirect(page);

        /*chain.doFilter(req, resp);*/



    }

    public void init(FilterConfig config) throws ServletException {

    }

}
