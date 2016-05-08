<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 21.04.2016
  Time: 2:10
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Добро пожаловать</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/main_tabs.css">
    <script src="resources/js/main_tabs.js"></script>
    <script src="resources/js/jquery.js"></script>

    <link rel="stylesheet" href="resources/css/auth_button.css">
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,900'>


    <%
        Cookie[] cookies = request.getCookies();
        String sessionID = null;
        String login;
        if (cookies!=null) {

            for(Cookie cookie : cookies)                  {
                if(cookie.getName().equals("login"))
                    login = cookie.getValue();
                if(cookie.getName().equals("JSESSIONID"))
                    sessionID =  cookie.getValue();          }
        }
        login = (String) session.getAttribute("login"); %>
    <!-- JAVA AUTH -->
    <%    String enter =   (login==null ?  "/login.jsp": "/OfficeServlet");
                 if ( enter == null)
                 {
                     response.getWriter().write(" <script>\n" +" alert('Вы не вошли в систему, пожалуйста для работы с системой пройдите аутентификацию')" + "</script>");
                 }

    %>
</head>
<body>


<header>
    <ul>
        <li><a href="main.jsp"><img id="logo" src="resources/img/home.png"/> </a></li>
       <li id="vhod"> <a href="/view/userDashboard.jsp"> <%  out.print(login==null ? " " : login);          %></a> </li>

    </ul>
</header>


<div class="tab">

    <ul class="tabs">
        <li><a href="#">О системе</a></li>
        <li><a href="#">Визуализация данных</a></li>
        <li><a href="#">Моделирование</a></li>

    </ul> <!-- / tabs -->

    <div class="tab_content">

        <div class="tabs_item">
            <img src="http://d13yacurqjgara.cloudfront.net/users/5411/screenshots/1413345/wellv2.png">

<p>
    Данная система позволяет вам нужное количество материалов для вашего дома, а также различных его частей.
</p>
        </div> <!-- / tabs_item -->

        <div class="tabs_item">
            <img class="alignleft max_width" alt="tabs_shortcode2" src="http://d13yacurqjgara.cloudfront.net/users/424765/screenshots/1412407/ezyinsights.jpg">
            <h4>Статистика</h4>
            <p>Одной из функций системы является сбор статистики и ее последующая визуалиция в удобном для анализа виде</p>
            <p><a href="view/admintool.jsp" style="text-decoration:none">Просмотреть возможности</a> </p>
        </div> <!-- / tabs_item -->

        <div class="tabs_item">
            <img src="http://d13yacurqjgara.cloudfront.net/users/347667/screenshots/1412641/untitled-1.jpg">
            <h4>Моделирование</h4>
            <p>Система позволяет смоделировать элементы вашего будущего дома и просмотреть как они будут выглядеть в реальном времени.</p>
            <p><a href="view/sandbox.jsp" style="text-decoration:none">Просмотреть возможности</a> </p>
        </div> <!-- / tabs_item -->

    </div> <!-- / tab_content -->
</div> <!-- / tab -->






<form action="view/userDashboard.jsp" method="post">

    <button class="mybutton" type="submit" >Приступить к работе</button>
</form>






<script>



    $(document).ready(function() {

        (function ($) {
            $('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass('current');

            $('.tab ul.tabs li a').click(function (g) {
                var tab = $(this).closest('.tab'),
                        index = $(this).closest('li').index();

                tab.find('ul.tabs > li').removeClass('current');
                $(this).closest('li').addClass('current');

                tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp();
                tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();

                g.preventDefault();
            } );
        })(jQuery);

    });
    $(document).ready(function() {

        (function ($) {
            $('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass('current');

            $('.tab ul.tabs li a').click(function (g) {
                var tab = $(this).closest('.tab'),
                        index = $(this).closest('li').index();

                tab.find('ul.tabs > li').removeClass('current');
                $(this).closest('li').addClass('current');

                tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp();
                tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();

                g.preventDefault();
            } );
        })(jQuery);

    });
</script>
</body>
</html>
