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
@WebServlet(name = "ProjectInfo" , urlPatterns = "/proj_info")
public class ProjectInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int a = 110;
        int b = 5;
        response.getWriter().write("<li class=\"items odd\">\n" +
                "\n" +
                "                <div class=\"infoWrap\">\n" +
                "                    <div class=\"cartSection\">\n" +
                "                        <img src=\"http://lorempixel.com/output/technics-q-c-300-300-4.jpg\" alt=\"\" class=\"itemImg\" />\n" +
                "                        <p class=\"itemNumber\">#QUE-007544-002</p>\n" +
                "                        <h3>Item Name 1</h3>\n" +
                "\n" +
                "                        <p> <input type=\"text\"  class=\"qty\" placeholder=\"3\"/> x $5.00</p>\n" +
                "\n" +
                "                        <p class=\"stockStatus\"> In Stock</p>\n" +
                "                    </div>\n" +
                "\n" +
                "\n" +
                "                    <div class=\"prodTotal cartSection\">\n" +
                "                        <p>$" + (a+b) +"</p>\n" +
                "                    </div>\n" +
                "                    <div class=\"cartSection removeWrap\">\n" +
                "                        <a href=\"#\" class=\"remove\">x</a>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "            </li>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
