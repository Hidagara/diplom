<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 27.04.2016
  Time: 1:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Информация для  администратора</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <script src="/resources/js/jquery.js">    </script>

   </head>
<body>


<div class="main-container">

    <!-- HEADER -->
    <header class="block">
        <ul class="header-menu horizontal-list">
            <li>
                <a class="header-menu-tab" href="#1"><span class="icon entypo-cog scnd-font-color"></span>Настройки</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#2"><span class="icon fontawesome-user scnd-font-color"></span>Аккаунт</a>
            </li>
            <li>
                <a class="header-menu-tab" href="#3"><span class="icon fontawesome-envelope scnd-font-color"></span>Сообщения</a>
                <a class="header-menu-number" href="#4">5</a>
            </li>

        </ul>
        <div class="profile-menu">
            <p>Me <a href="#26"><span class="entypo-down-open scnd-font-color"></span></a></p>
            <div class="profile-picture small-profile-picture">
                <img width="40px" alt="Avatar" src="<c:out value="${sessionScope.avatar}"/>">
            </div>
        </div>
    </header>

    <!-- LEFT-CONTAINER -->
    <div class="left-container container">
        <div class="menu-box block"> <!-- MENU BOX (LEFT-CONTAINER) -->
            <h2 class="titular">Меню</h2>
            <ul class="menu-box-menu">
                <li>
                    <a class="menu-box-tab" href="#6"><span class="icon fontawesome-envelope scnd-font-color"></span>Сообщения<div class="menu-box-number">24</div></a>
                </li>
                <li>
                    <a class="menu-box-tab" href="#8"><span class="icon entypo-paper-plane scnd-font-color"></span>Контент<div class="menu-box-number">3</div></a>
                </li>
                <li>
                    <a class="menu-box-tab" href="#10"><span class="icon entypo-calendar scnd-font-color"></span>Материалы<div class="menu-box-number">5</div></a>
                </li>
                <li>
                    <a class="menu-box-tab" href="/view/settings.jsp"><span class="icon entypo-cog scnd-font-color"></span>Настройки аккаунта</a>
                </li>
                <li>
                    <a class="menu-box-tab" href="/view/stats.jsp"><sapn class="icon entypo-chart-line scnd-font-color"></sapn>Статистика</a>
                </li>
            </ul>
        </div>
        <div class="donut-chart-block block"> <!-- DONUT CHART BLOCK (LEFT-CONTAINER) -->
            <h2 class="titular">Прирост пользователей</h2>
            <div class="donut-chart">
                <!-- DONUT-CHART by @kseso http://codepen.io/Kseso/pen/phiyL -->
                <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
                <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
                <div id="porcion3" class="recorte"><div class="quesito win" data-rel="31"></div></div>
                <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
                <!-- END DONUT-CHART by @kseso http://codepen.io/Kseso/pen/phiyL -->
                <p class="center-date">JUNE<br><span class="scnd-font-color">2013</span></p>
            </div>
            <ul class="os-percentages horizontal-list">
                <li>
                    <p class="ios os scnd-font-color">iOS</p>
                    <p class="os-percentage">21<sup>%</sup></p>
                </li>
                <li>
                    <p class="mac os scnd-font-color">Mac</p>
                    <p class="os-percentage">48<sup>%</sup></p>
                </li>
                <li>
                    <p class="linux os scnd-font-color">Linux</p>
                    <p class="os-percentage">9<sup>%</sup></p>
                </li>
                <li>
                    <p class="win os scnd-font-color">Win</p>
                    <p class="os-percentage">32<sup>%</sup></p>
                </li>
            </ul>
        </div>
        <div class="line-chart-block block clear"> <!-- LINE CHART BLOCK (LEFT-CONTAINER) -->
            <div class="line-chart">
                <!-- LINE-CHART by @kseso http://codepen.io/Kseso/pen/phiyL -->
                <div class='grafico'>
                    <ul class='eje-y'>
                        <li data-ejeY='30'></li>
                        <li data-ejeY='20'></li>
                        <li data-ejeY='10'></li>
                        <li data-ejeY='0'></li>
                    </ul>
                    <ul class='eje-x'>
                        <li>Apr</li>
                        <li>May</li>
                        <li>Jun</li>
                    </ul>
                             <span data-valor='25'>
                               <span data-valor='8'>
                                 <span data-valor='13'>
                                   <span data-valor='5'>
                                     <span data-valor='23'>
                                     <span data-valor='12'>
                                         <span data-valor='15'>
                                         </span></span></span></span></span></span></span>
                </div>
                <!-- END LINE-CHART by @kseso http://codepen.io/Kseso/pen/phiyL -->
            </div>
            <ul class="time-lenght horizontal-list">
                <li><a class="time-lenght-btn" href="#14">Неделя</a></li>
                <li><a class="time-lenght-btn" href="#15">Месяц</a></li>
                <li><a class="time-lenght-btn" href="#16">Год</a></li>
            </ul>
            <ul class="month-data clear">
                <li>
                    <p>APR<span class="scnd-font-color"> 2013</span></p>
                    <p><span class="entypo-plus increment"> </span>21<sup>%</sup></p>
                </li>
                <li>
                    <p>MAY<span class="scnd-font-color"> 2013</span></p>
                    <p><span class="entypo-plus increment"> </span>48<sup>%</sup></p>
                </li>
                <li>
                    <p>JUN<span class="scnd-font-color"> 2013</span></p>
                    <p><span class="entypo-plus increment"> </span>35<sup>%</sup></p>
                </li>
            </ul>
        </div>

    </div>

    <!-- MIDDLE-CONTAINER -->
    <div class="middle-container container">
        <div class="profile block"> <!-- PROFILE (MIDDLE-CONTAINER) -->
            <a class="add-button" href="#28"><span class="icon entypo-plus scnd-font-color"></span></a>
            <div class="profile-picture big-profile-picture clear">
                <img width="150px" alt="Avatar" src="<c:out value="${sessionScope.avatar}"/>" >
            </div>
            <h1 class="user-name"> <c:out value="${sessionScope.username}"/></h1>
            <div class="profile-description">
                <p class="scnd-font-color">Lorem ipsum dolor sit amet consectetuer adipiscing</p>
            </div>
            <ul class="profile-options horizontal-list">
                <li><a class="comments" href="#40"><p><span class="icon fontawesome-comment-alt scnd-font-color"></span>23</a></li></p>
                <li><a class="views" href="#41"><p><span class="icon fontawesome-eye-open scnd-font-color"></span>841</a></li></p>
                <li><a class="likes" href="#42"><p><span class="icon fontawesome-heart-empty scnd-font-color"></span>49</a></li></p>
            </ul>
        </div>
        <div class="weather block clear"> <!-- WEATHER (MIDDLE-CONTAINER) -->
            <h2 class="titular"><span class="icon entypo-location"></span><strong>CLUJ-NAPOCA</strong>/RO</h2>
            <div class="current-day">
                <p class="current-day-date">FRI 29/06</p>
                <p class="current-day-temperature">24º<span class="icon-cloudy"></span></p>
            </div>
            <ul class="next-days">
                <li>
                    <a href="#43">
                        <p class="next-days-date"><span class="day">SAT</span> <span class="scnd-font-color">29/06</span></p>
                        <p class="next-days-temperature">25º<span class="icon icon-cloudy scnd-font-color"></span></p>
                    </a>
                </li>
                <li>
                    <a href="#44">
                        <p class="next-days-date"><span class="day">SUN</span> <span class="scnd-font-color">30/06</span></p>
                        <p class="next-days-temperature">22º<span class="icon icon-cloudy2 scnd-font-color"></span></p>
                    </a>
                </li>
                <li>
                    <a href="#45">
                        <p class="next-days-date"><span class="day">MON</span> <span class="scnd-font-color">01/07</span></p>
                        <p class="next-days-temperature">24º<span class="icon icon-cloudy2 scnd-font-color"></span></p>
                    </a>
                </li>
                <li>
                    <a href="#46">
                        <p class="next-days-date"><span class="day">TUE</span> <span class="scnd-font-color">02/07</span></p>
                        <p class="next-days-temperature">26º<span class="icon icon-cloudy scnd-font-color"></span></p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p class="next-days-date"><span class="day">WED</span> <span class="scnd-font-color">03/07</span></p>
                        <p class="next-days-temperature">27º<span class="icon icon-sun scnd-font-color"></span></p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p class="next-days-date"><span class="day">THU</span> <span class="scnd-font-color">04/07</span></p>
                        <p class="next-days-temperature">29º<span class="icon icon-sun scnd-font-color"></span></p>
                    </a>
                </li>
            </ul>
        </div>


    </div>

    <!-- RIGHT-CONTAINER -->
    <div class="right-container container">

       <%-- <div class="account block"> <!-- ACCOUNT (RIGHT-CONTAINER) -->
            <h2 class="titular">SIGN IN TO YOUR GOOGLE ACCOUNT</h2>
            <div class="input-container">
                <input type="text" placeholder="yourname@gmail.com" class="email text-input">
                <div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
            </div>
            <div class="input-container">
                <input type="text" placeholder="Password" class="password text-input">
                <div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
            </div>
            <div class="g-signin2" data-onsuccess="onSignIn"></div>


        </div>--%>
        <div class="loading block"> <!-- LOADING (RIGHT-CONTAINER) -->
            <div class="progress-bar downloading"></div>
            <p><span class="icon fontawesome-cloud-download scnd-font-color"></span>Downloading...</p>
            <p class="percentage">11<sup>%</sup></p>
            <div class="progress-bar uploading"></div>
            <p><span class="icon fontawesome-cloud-upload scnd-font-color"></span>Uploading...</p>
            <p class="percentage">43<sup>%</sup></p>
        </div>



    </div> <!-- end right-container -->
</div> <!-- end main-container -->



</body>

</html>
