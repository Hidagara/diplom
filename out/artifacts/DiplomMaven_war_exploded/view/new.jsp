
<%@ page import="java.sql.*, java.io.*, java.text.*, java.util.Date, java.Math.*, java.math.RoundingMode" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 26.03.2016
  Time: 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Создание нового проекта</title>
    <link  rel="stylesheet" type="text/css" href="../resources/css/style.css"/>
    <script src="../resources/js/three.js"></script>
    <script src="../resources/js/jquery.js"></script>
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
<body>
<header>
    <ul>
        <a href="../main.jsp"><img id="logo" src="../resources/img/home.png"/> </a>
        <li> Идеи</li>
        <li>Галерея</li>
        <li>Материалы</li>
        <li id="vhod">  <%  out.print(login==null ? ("Войти") : login);          %></li>
    </ul>
</header>
<sql:setDataSource var="jdbc" driver="oracle.jdbc.driver.OracleDriver"
                   url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)
                   (HOST=server.dyndns.za.org )(PORT=82)))(CONNECT_DATA=(SERVICE_NAME=mycrm)))"
                   user="userd493_8"  password="userd493#8"/>

<sql:query var="cement" dataSource="${jdbc}">
    select * from MATERIAl
    where type=?
    <sql:param value="cement" />
</sql:query>

<sql:query var="pesok" dataSource="${jdbc}">
    select * from MATERIAl
    where type=?
    <sql:param value="dust" />
</sql:query>
<sql:query var="sheben" dataSource="${jdbc}">
    select * from MATERIAl
    where type=?
    <sql:param value="macadam" />
</sql:query>
<sql:query var="armatura" dataSource="${jdbc}">
    select * from MATERIAl
    where type=?
    <sql:param value="armatura" />
</sql:query>
<sql:query var="found_type" dataSource="${jdbc}">
    select NAME from FOUND_TYPE

</sql:query>
<sql:query var="wall_type" dataSource="${jdbc}">
    select NAME from WALL_TYPE

</sql:query>
<sql:query var="roof_type" dataSource="${jdbc}">
    select NAME from ROOF_TYPE

</sql:query>

<sql:query var="roof_material" dataSource="${jdbc}">
    select * from MATERIAl
    where type like '%roof'
</sql:query>

<sql:query var="wall_material" dataSource="${jdbc}">
    select * from MATERIAl
    where type like '%wall'
</sql:query>

<form action="/calc" method="post">
    <fieldset style="width:500px;">
        <div id="fundament">
            <a>Фундамент проекта</a>

            <p>
                <label>Выберите тип фундамента: </label>
                <select  name="fundament_type">
                    <c:forEach var="row" items="${found_type.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label>Ширина фундамента</label><input type="number" name="fundament_shirina">  </p>
            <p>
            <p>
                <label>Высота фундамента</label><input type="number" name="fundament_visota">  </p>
            <p>
            <p>
                <label>Толщина фундамента</label><input type="number" name="fundament_tolshina">  </p>
            <p>
                <label>Выберите цемент: </label>

                <select name="cement" id="cement">
                    <c:forEach var="row" items="${cement.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label>Выберите щебень:</label>
                <select name="sheben" id="sheben">
                    <c:forEach var="row" items="${sheben.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label>Выберите песок: </label>

                <select name="pesok" id="pesok">
                    <c:forEach var="row" items="${pesok.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label>Выберите арматуру: </label>

                <select name="armatura" id="armatura">
                    <c:forEach var="row" items="${armatura.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>




        </div>


        <div id="stena">
            <a>Стена проекта</a>
            <p>
                <label>Выберите тип стены: </label>
                <select  name="wall_type">
                    <c:forEach var="row" items="${wall_type.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label> Материал</label>
                <select name="wall_material">
                    <c:forEach var="row" items="${wall_material.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>

            </p>

            <p>
                <label>Общая длина стен</label><input type="number" name="wall_dlina">  </p>
            <p>
            <p>
                <label>Высота стены</label><input type="number" name="wall_visota">  </p>
            <p>
            <p>
                <label>Толщина стены</label><input type="number" name="wall_tolshina">  </p>
            <p>
        </div>

        <div id="krisha">
            <a>Крыша проекта</a>
            <p>
                <label>Выберите тип крыши: </label>
                <select  name="roof_type">
                    <c:forEach var="row" items="${roof_type.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>
            </p>
            <p>
                <label> Материал</label>
                <select name="roof_material">
                    <c:forEach var="row" items="${roof_material.rows}">
                        <option><c:out value="${row.name}"/></option>
                    </c:forEach>
                </select>

            </p>
            <p>
                <label>Длина основания</label><input type="number" name="roof_dlina">  </p>
            <p>
            <p>
                <label>Угол наклона</label><input type="number" name="roof_naklon">  </p>
            <p>
            <p>
                <label>Ширина основания</label><input type="number" name="roof_shirina">  </p>
            <p>
        </div>
    </fieldset>
    <input type="submit" value="Создать проект"> </input>

</form>
</body>
</html>
