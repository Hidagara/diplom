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
 * Created by hidagara on 27.04.2016.
 */
@WebServlet(name = "DbTest", urlPatterns = "/dbtest")
public class dbtest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        response.getWriter().write("lelel");
        System.out.print("dbtest init");
        try {


            Class.forName(DB.DATABASE_DRIVER);
            con = DriverManager.getConnection(DB.DATABASE_URL, DB.DATABASE_USERNAME, DB.DATABASE_PASSWORD);
            String sql = "SELECT * from POLZ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            response.getWriter().write(String.valueOf(rs));
            HttpSession session = request.getSession();
            String page = null;
            while (rs.next()) {

                response.getWriter().write("asdasdasdasd");
                response.getWriter().write(rs.getString("login"));


            }

        }
        catch(SQLException se)
        {
            response.getWriter().write("Oshibka bd");
            se.printStackTrace();
        } catch (ClassNotFoundException e) {
            response.getWriter().write("Klass ne naiden");
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().write("lelel");
        System.out.print("dbtest init");
    }
}
