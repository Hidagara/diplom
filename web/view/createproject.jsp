<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 2/20/2016
  Time: 5:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link  rel="stylesheet" type="text/css" href="../resources/css/style.css"/>
    <link href='https://fonts.googleapis.com/css?family=Merriweather+Sans' rel='stylesheet' type='text/css'>
  <!-- JAVA check Cookie -->
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
  <%    String enter =   (login==null ?  "/login.jsp": "/OfficeServlet");  %>
</head>
<body >
<header>
<ul>
 <a href="../main.jsp"><img id="logo" src="../resources/img/home.png"/> </a>

  <li id="vhod">  <%  out.print(login==null ? (" ") : login);          %></li>



</ul>

</header>


<footer>
<div class="createMenu">


    <div class="elem1">
     <p>Новый проект</p>
        <br>
        <a  style="" href="newproject.jsp"><img src="/resources/img/paper32.png"/> </a>
    </div>
    <div class="elem1" >
       <p>Выбрать из моих проектов</p>
        <br>
        <a href="myproject.jsp"><img src="/resources/img/folder32.png"/> </a>
    </div>
    <div class="elem1">
       <p>Шаблоны</p>  <br>
        <a href="template.jsp"><img src="/resources/img/linedpaper32.png"/> </a>
    </div>
</div>



</footer>
</body>
</html>
