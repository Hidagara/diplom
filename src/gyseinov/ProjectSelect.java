package gyseinov;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hidagara on 09.05.2016.
 */
@WebServlet(name = "ProjectSelect"  , urlPatterns = "/select_project")
public class ProjectSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        for (int i = 0; i<10; i++)
        {
            response.getWriter().write("<article class=\"entry\">\n" +
                    "    <a>\n" +
                    "        <aside>\n" +
                    "            <strong></strong>\n" +
                    "            <p>Pacific Northwest Modern Homes</p>\n" +
                    "        </aside>\n" +
                    "        <img src=\"https://i.imgur.com/tecOxxA.jpg\"/>\n" +
                    "        <i></i>\n" +
                    "    </a>\n" +
                    "    <ul>\n" +
                    "    </ul>\n" +
                    "</article>");
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                doPost(request, response);
    }
}
