package gyseinov;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


/**
 * Created by hidagara on 09.03.2016.
 */
@WebServlet(name = "Material" , urlPatterns = "/material")
public class MaterialView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type").toLowerCase();
        response.setContentType("text/html; charset=UTF-8");
    /*  Map<String, String[]> material = request.getParameterMap();
     for (Map.Entry<String , String[]> entry : material.entrySet())
      {
          response.getWriter().write("Kluch" +entry.getKey()+"Znachneie"+ Arrays.toString(entry.getValue()));
          type = Arrays.toString(entry.getValue());
      }*/

        PreparedStatement prepst = null;
        ResultSet rs = null;
        try {
            Class.forName(DB.DATABASE_DRIVER);
            Connection con = DriverManager.getConnection(DB.DATABASE_URL, DB.DATABASE_USERNAME, DB.DATABASE_PASSWORD);
            String sql = "SELECT * FROM MATERIAL WHERE TYPE = ?";
            prepst =  con.prepareStatement(sql);
            prepst.setString(1, type);
           /*     switch (type)
                {

                    case "Cement":
                         sql = "select * from  MATERIAL WHERE  type = 'cement' " ;
                        break;
                    case "Macadam":
                        sql = "select * from  MATERIAL WHERE  type = 'macadam' ";
                        break;
                    case "Dust" :
                        sql = "select * from  MATERIAL WHERE  type = 'dust' " ;
                        break;
                    case "Metal" :
                        sql = "select * from  MATERIAL WHERE  type = 'metal roof' " ;
                        break;
                    case "Decking" :
                        sql = "select * from  MATERIAL WHERE  type = 'decking' " ;
                        break;

                    default:
                        response.getWriter().write("Wrong chose");
                }*/
            rs = prepst.executeQuery();
            int i =1;
            while (rs.next())
            {
                i++;
                response.getWriter().print("<li class bd_material>");
                response.getWriter().print("<a>"+rs.getString("name")+"</a>");

                response.getWriter().print("<a class=\"texture\"><img src="+rs.getString("texture")+"> </a>");

                response.getWriter().print("<a>"+rs.getString("price")+"</a>");

                response.getWriter().print("<a>"+rs.getString("shop")+"</a>");
                response.getWriter().print("<a id=\"show\"><img src=/resources/img/show.png> </a>");
                response.getWriter().print("<a id=\"hide\"><img src=/resources/img/hide.png> </a>");

                response.getWriter().print("</li>");




            }

        }  catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("klass ne naiden");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Oshibka bd");
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
