package gyseinov;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by hidagara on 22.04.2016.
 */
@WebServlet(name = "Register" , urlPatterns = "/register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String age = request.getParameter("age");
        String email = request.getParameter("email");
        Connection con =null;
    /*    response.getWriter().write(login);
        response.getWriter().write(password);
        response.getWriter().write(name);
        response.getWriter().write(city); response.getWriter().write(age);
*/

        try{

            //loading drivers for mysql
            Class.forName(DB.DATABASE_DRIVER);
             con = DriverManager.getConnection(DB.DATABASE_URL, DB.DATABASE_USERNAME, DB.DATABASE_PASSWORD);

            PreparedStatement ps=con.prepareStatement("insert into POLZ(login,password,name,phone,city,age,email) values (?,?,?,?,?,?,?)");



                    ps.setString(1, login);
                    ps.setString(2 , password);
                    ps.setString(3 , name);
                    ps.setString(4 , phone);
                    ps.setString(5 , city);
                    ps.setString(6 , age);
                    ps.setString(7, email);



                /*    ps.setString(4 , name);
                    ps.setString(5 , String.valueOf(0));
                    */

            ResultSet rs = ps.executeQuery();
                response.getWriter().write(String.valueOf(rs));

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
