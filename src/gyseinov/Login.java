package gyseinov;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

/**
 * Created by hidagara on 22.04.2016.
 */
@WebServlet(name = "Login", urlPatterns = "/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = null;
        String login = request.getParameter("login");
        String password = request.getParameter("password");
            Connection con = null;
        try{

            //loading drivers for mysql
            Class.forName(DB.DATABASE_DRIVER);
            con = DriverManager.getConnection(DB.DATABASE_URL, DB.DATABASE_USERNAME, DB.DATABASE_PASSWORD);
            String sql = "SELECT * from POLZ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            HttpSession session = request.getSession();

            while (rs.next())
            {
                if (login.equals(rs.getString("login")) && password.equals(rs.getString("password")))
                {
                    session.setAttribute("login", login);
                    session.setAttribute("username", rs.getString("name"));
                    session.setAttribute("avatar", rs.getString("avatar"));
                    session.setAttribute("role", rs.getString("role"));
                    page = "view/user.jsp";
                    break;

                }
                else if (!login.equals(rs.getString("login")) || !password.equals(rs.getString("password")) ){
                    page = "authFail.jsp";

                }

            }

            response.sendRedirect(page);
        }
        catch(SQLException se)
        {
            response.getWriter().write("Oshibka bd");
            se.printStackTrace();
        } catch (ClassNotFoundException e) {
            response.getWriter().write("Klass ne naiden");
            e.printStackTrace();
        }
        finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
