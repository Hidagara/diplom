<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 08.05.2016
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/flexbox.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>

<div class='wrapper'>
    <div class='sidebar'>
        <div class='title'>
           Меню
        </div>
        <ul class='nav'>
            <li>
                <a href="/view/user.jsp" class='active'>Главная</a>
            </li>
            <li>
                <a>Система</a>
            </li>
            <li>
                <a >Поставщики</a>
            </li>
            <li>
                <a>Experiments</a>
            </li>
            <li>
                <a>Пользователи</a>
            </li>
            <li>
                <a>Материалы</a>
            </li>
            <li>
                <a>Настройки</a>
            </li>
            <li>
                <a>Выход</a>
            </li>
        </ul>
    </div>
    <div class='content isOpen'>
        <a class='button'></a>
        <h1>Добро пожаловать <c:out value="${sessionScope.username}"/>  </h1>
        <h2>Приступим</h2>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.button').on('click', function() {
            $('.content').toggleClass('isOpen');
        });
    });
    (function () {
        $('ul.nav li a').click(function () {
            $('ul.nav li a').removeClass('active');
            return $(this).addClass('active');
        });
    }.call(this));

</script>
</body>
</html>
