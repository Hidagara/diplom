<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 27.03.2016
  Time: 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Статистика</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resources/js/Chart.js"></script>
    <script src="/resources/js/script.js"></script>
    <script src="/resources/js/three.js"></script>
    <script src ="/resources/js/jquery.js"></script>
    <script src = "/resources/js/three.min.js"></script>
    <script src="/resources/three lib/examples/js/loaders/OBJLoader.js"></script>
    <script src="/resources/three lib/examples/js/Detector.js"></script>
    <script src="/resources/three lib/examples/js/libs/stats.min.js"></script>

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
        <a href="/main.jsp"><img id="logo" src="/resources/img/home.png"/> </a>
        <li>Идеи</li>
        <li>Галерея</li>
        <li id="vhod">  <%  out.print(login==null ? ("Войти") : login);          %></li>
    </ul>
</header>

<ul class="material">

    <li class="project_management">
        <a>Клиенты</a>
        <a id="city" >По городам</a>
        <a id="projects">По стоимости проектов</a>
        <a >По чему то там еще</a>
    </li>
    <li class="myprojects">
        <a>Материалы</a>
        <a id="type">По типу</a>
        <a id="price">По цене</a>
        <a id="use">По использованию</a>

    </li>

    <li class="settings">
        <a>Проекты</a>
        <a id="square">По площади</a>
        <a id="project_price">По цене</a>
        <a id="?">По чему то еще???</a>

    </li>
</ul>

<canvas id="content" width="600" height="300">




</canvas>



<script>
    var chart ;


    $("#city").click(function ()
    {   var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');
        if(chart !=null) {
            chart.destroy();
        }
        /*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*/
        var pieData = [
            {
                value: 25,
                label: 'Краснодар',
                color: '#811BD6'
            },
            {
                value: 10,
                label: 'Москва',
                color: '#9CBABA'
            },
            {
                value: 30,
                label: 'Санкт-Петербург',
                color: '#D18177'
            },
            {
                value : 35,
                label: 'Ростов',
                color: '#6AE128'
            }
        ];


        chart = new Chart(context).PolarArea(pieData);
    });


    $("#projects").click(function ()
    {
        var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*/

        var barChartData = {
            labels : ["< 50 000","< 100 000","< 200 000","< 500 000","< 1 000 000","> 1 000 000"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data : [3,22,3,15,27,30]
                }/*,
                 {
                 fillColor : "rgba(151,187,205,0.5)",
                 strokeColor : "rgba(151,187,205,0.8)",
                 highlightFill : "rgba(151,187,205,0.75)",
                 highlightStroke : "rgba(151,187,205,1)",
                 data : [1,2,3,4,5,6]
                 }*/
            ]

        }

        chart = new Chart(context).Bar(barChartData);
    });
    $("#price").click(function ()
    {

        var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*/

        var LineChartData = {

            labels: ["Январь", "Февраль", "Март", "Апрель", "Мая", "Июнь", "Июль", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
            datasets: [
                {
                    label: "Цемент",
                    fillColor: "rgba(220,220,220,0.2)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 80, 81, 56, 55, 40,50,30,60,70]
                },
                {
                    label: "Щебень",
                    fillColor: "rgba(151,187,205,0.2)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 86, 27, 90]
                },
                {
                    label: "Песок",
                    fillColor: "rgba(75,75,75)",
                    strokeColor: "rgba(75,75,75,1)",
                    pointColor: "rgba(75,75,75,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [18, 28, 10, 9, 66, 27, 85,54]
                }
            ]
        };

        chart = new Chart(context).Line(LineChartData);

    });


    $("#type").click(function ()
    {

        var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }

        var data = [
            {
                value: 300,
                color:"#F7464A",
                highlight: "#FF5A5E",
                label: "Цемент"
            },
            {
                value: 50,
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: "Арматура"
            },
            {
                value: 100,
                color: "#FDB45C",
                highlight: "#FFC870",
                label: "Щебень"
            }
        ];

        chart = new Chart(context).Doughnut(data);

    });
    $("#use").click(function ()
    {
        var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*/

        var barChartData = {
            labels : ["Апрель","Май","Июнь","Июль","Август","Сентябрь"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data : [22,22,3,15,27,30]
                },
                {
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,0.8)",
                    highlightFill : "rgba(151,187,205,0.75)",
                    highlightStroke : "rgba(151,187,205,1)",
                    data : [1,2,3,4,5,6]
                }
            ]

        }

        chart = new Chart(context).Radar(barChartData);
    });



</script>
</body>
</html>