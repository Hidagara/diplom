

<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 21.04.2016
  Time: 5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Аутентификация</title>

    <link rel="stylesheet" href="resources/css/login.css">

    <%
        String auth = null;
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
        auth = login == null? "af" : "as";
    %>

</head>
<body>



<div class="login-wrap">
    <div class="login-html">

        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Войти</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Зарегистрироваться</label>
        <div class="login-form">
            <div class="sign-in-htm">
                <form action="/login" method="post">
                <div class="group">

                    <label for="user" class="label">Username</label>
                    <input id="user" type="text" class="input" name="login">
                </div>
                <div class="group">
                    <label for="pass" class="label">Password</label>
                    <input id="pass" type="password" class="input" data-type="password" name="password">
                </div>
                <div class="group">
                    <input id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign In">
                </div>

                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">Forgot Password?</a>
                </div>
                </form>
            </div>
            <div class="sign-up-htm">
                <form action="/register" method="post">
                <div class="group">
                    <label for="user" class="label">Логин</label>
                    <input id="user" type="text" class="input" name="login">
                </div>
                <div class="group">
                    <label for="pass" class="label">Пароль</label>
                    <input id="pass" type="password" class="input" data-type="password" name="password">
                </div>

                <div class="group">
                    <label for="pass" class="label">Email Address</label>
                    <input id="pass" type="text" class="input" name="email">
                </div>
                    <div class="group">
                        <label for="pass" class="label">Имя</label>
                        <input id="pass" type="text" class="input" name="name">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Телефон</label>
                        <input id="pass" type="text" class="input" name="phone">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Город</label>
                        <input id="pass" type="text" class="input" name="city">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Возраст</label>
                        <input id="pass" type="text" class="input" name="age">
                    </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign Up">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1">Already Member?</a> </label>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
