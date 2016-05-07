package gyseinov;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by hidagara on 29.04.2016.
 */
@WebServlet(name = "GetProjects" , urlPatterns = "/getproject")
public class GetProjects extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("name");
        response.setContentType("text/html; charset=UTF-8");

    /*  Map<String, String[]> material = request.getParameterMap();
     for (Map.Entry<String , String[]> entry : material.entrySet())
      {
          response.getWriter().write("Kluch" +entry.getKey()+"Znachneie"+ Arrays.toString(entry.getValue()));
          type = Arrays.toString(entry.getValue());
      }*/
        Connection con = null;
        PreparedStatement prepst = null;
        ResultSet rs = null;
        try {
            Class.forName(DB.DATABASE_DRIVER);
           con = DriverManager.getConnection(DB.DATABASE_URL, DB.DATABASE_USERNAME, DB.DATABASE_PASSWORD);
            String sql = "SELECT * FROM PROJECT WHERE OWNERNAME = ?";
            prepst =  con.prepareStatement(sql);
            prepst.setString(1, login);

            rs = prepst.executeQuery();

            while (rs.next())
            {

                    response.getWriter().write(rs.getString("name"));



            }

        }  catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("klass ne naiden");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Oshibka bd");
        }
        finally {
            if (con!=null)
            {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
