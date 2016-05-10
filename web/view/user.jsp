<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 08.05.2016
  Time: 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User menu</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/adminMenu.css">

    <script src="/resources/js/jquery.js"></script>

    <link rel="stylesheet" href="/resources/css/auth_button.css">
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,900'>
</head>

<body>


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
<header>
    <ul>
        <li><a href="/main.jsp"><img id="logo" src="/resources/img/home.png"/> </a></li>
        <li id="vhod"> <a href="/view/userDashboard.jsp"> <%  out.print(login==null ? " " : login);          %></a> </li>

    </ul>
</header>



<div class="content">
    <div id="admin_settings" class="admin"><b class="admin_settings">Администрирование</b></div>
    <span id="settings" class="octicon octicon-gear settings"></span>
    <div class="menu" id="menu">
        <div class="arrow"></div>
        <a href="/view/admin/users.jsp">Управление пользователями <span id="icon" class="octicon octicon-person"></span></a>
        <a href="/view/admin/stats.jsp">Статистика <span id="icon" class="octicon octicon-graph"></span></a>
        <a href="/view/admin/uploads.jsp">Управление загрузками <span id="icon" class="octicon octicon-cloud-upload"></span></a>

       <!-- <a href="#">Edit Slider <span id="icon" class="octicon octicon-pencil"></span></a> -->
    </div>




    <div id="project" class="admin"> <b class="admin_settings">Проекты</b> </div>
    <div class="menu" id="proj_menu">
        <div class="arrow"></div>
        <a href="/view/project_selector.jsp">Проекты<span id="icon" class="octicon octicon-person"></span></a>
        <a href="/view/stats.jsp">Статистика <span id="icon" class="octicon octicon-graph"></span></a>
        <a href="/gallery.jsp">Галлерея <span id="icon" class="octicon octicon-cloud-upload"></span></a>
    </div>



    <div id="profile" class="admin"> <b class="admin_settings">Профиль</b> </div>
    <div class="menu" id="prof_menu">
        <div class="arrow"></div>
        <a href="#">Настройки<span id="icon" class="octicon octicon-person"></span></a>
        <a href="#">Мои проекты <span id="icon" class="octicon octicon-graph"></span></a>
        <a href="#">Выйти <span id="icon" class="octicon octicon-cloud-upload"></span></a>
    </div>

</div>



<script>
    $( "#settings, #admin_settings" ).on( "click", function()
    {
        $( "#menu" ).fadeToggle( "fast" );
    });
    $( "#project" ).on( "click", function()
    {
        $( "#proj_menu" ).fadeToggle( "fast" );
    });
    $( "#profile" ).on( "click", function()
    {
        $( "#prof_menu" ).fadeToggle( "fast" );
    });

</script>
</body>
</html>
