package gyseinov;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by hidagara on 24.04.2016.
 */
@WebFilter(filterName = "AuthFilter" , urlPatterns = "/view*//*")
public class AuthFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        String login = (String) session.getAttribute("login");

        if( login== null && !(uri.endsWith("login.jsp")   || uri.endsWith("/login") || uri.endsWith("main.jsp") || uri.endsWith("/"))){

            response.sendRedirect("/authFail.jsp");
        }else{

            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
