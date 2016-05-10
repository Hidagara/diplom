<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 23.04.2016
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User profile</title>
    <link rel="stylesheet" href="/resources/css/user.css">
    <link rel="stylesheet" href="/resources/css/menutile.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">

    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/Chart.js"></script>
    <script src="/resources/js/script.js"></script>
    <script src="/resources/js/three.js"></script>

    <script src = "/resources/js/three.min.js"></script>
    <script src="/resources/three lib/examples/js/loaders/OBJLoader.js"></script>
    <script src="/resources/three lib/examples/js/Detector.js"></script>
    <script src="/resources/three lib/examples/js/libs/stats.min.js"></script>
</head>
<body>
<%--
<script>
    $(document).ready(function(){

        $('div.content').each(function() {
            var $content = $(this);

            $("link", $content).click(function(e) {
                e.preventDefault();
                $div = $("link", $content);
                $div.toggle();
                $("div.content").not($div).hide();
                return false;
            });

        });

        $('html').click(function(){
            $("div.content").hide();
        });

    });
</script>
--%>


<div class="bg"></div>
<div class="mcontainer">
    <nav>
        <div class="search-box">
            <div><i class="fa fa-search"></i>
                <input type="search" placeholder="Search"/>
            </div>
        </div>
        <ul class="menu">
            <li id="dashboard" class="active link"><i class="fa fa-home"></i>Dashboard</li>
          <%--  <li id="messages"><i class="fa fa-envelope"></i>Messages</li>--%>
            <li id="projects" class="link"><i class="fa fa-user"></i>Проекты</li>
            <li id="gallery" class="link"><i class="fa fa-group"></i>Галерея</li>
            <li id="settings"class="link"><i class="fa fa-cog"></i>Настройки</li>
        </ul>
    </nav>
    <div class="header">
        <div class="userPanel">
            <div class="pic" style="background-image: url(<c:out value="${sessionScope.avatar}"/>);"></div>
            <div class="welcome"><span>Welcome</span><span class="name"><c:out value="${sessionScope.username}"/></span></div>
        </div>
        <div class="title"></div>
    </div>

    <div class="content">


        <div class="mycontent">

             <div class="dashboard">
                    Проекты:Завершенные, в работе
                Средняя стоимость проектов
                Средняя продолжительность проектов
                Количество используемого материала
                 <canvas id="canvas">

                 </canvas>
             </div>



            <div class="projects">

                <div class="container">
                    <div class="well well-sm">
                        <strong>Режим отображения</strong>
                        <div class="btn-group">
                            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>Лист</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                                class="glyphicon glyphicon-th"></span>Сетка</a>
                        </div>
                    </div>
                    <div id="products" class="row list-group">
                        <div class="item  col-xs-4 col-lg-4">  <%--SINGLE ITEM START--%>
                            <div class="thumbnail">
                                <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                                <div class="caption">
                                    <h4 class="group inner list-group-item-heading">
                                        Наименование проекта</h4>
                                    <p class="group inner list-group-item-text">
                                        Описание проекта.</p>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <p class="lead">
                                                Цена проекта: &#8381;21.000</p>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <a class="btn btn-success" href="#user">Автор проекта</a>
                                        </div>
                                        Добавить проект к себе в библиотеку
                                    </div>
                                </div>
                            </div>
                        </div>   <%-- SINGLE ITEM  END --%>
                </div>

            </div>
                </div>


            <div class="settings">
                Ваше имя <br>
                Ваш город <br>
                Ваш возраст <br>

            </div>




                <%--ГАЛЕРЕЯ--%>
            <div class="gallery">
                <div class="container">
                    <div class="well well-sm">
                        <strong>Режим отображения</strong>
                        <div class="btn-group">
                            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>Лист</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                                class="glyphicon glyphicon-th"></span>Сетка</a>
                        </div>
                    </div>
                    <div id="products" class="row list-group">
                        <div class="item  col-xs-4 col-lg-4">  <%--SINGLE ITEM START--%>
                            <div class="thumbnail">
                                <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                                <div class="caption">
                                    <h4 class="group inner list-group-item-heading">
                                        Наименование проекта</h4>
                                    <p class="group inner list-group-item-text">
                                        Описание проекта.</p>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <p class="lead">
                                               Цена проекта: &#8381;21.000</p>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <a class="btn btn-success" href="#user">Автор проекта</a>
                                        </div>
                                        Добавить проект к себе в библиотеку
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        </div>   <%-- SINGLE ITEM  END --%>
                </div> <%--КОНЕЦ ГАЛЕРЕИ--%>









                </div>
            </div>
        </div>





</div>



<%--STYLE--%>
<script>
    (function () {
        $('ul.menu li').click(function () {
            $('ul.menu li').removeClass('active');
            return $(this).addClass('active');
        });
    }.call(this));
</script>


<%--AJAX--%>
<script>


    $( "#projects" ).click(function() {




        /*$('.content').load('/getproject',{name: "${sessionScope.login}" });*/
    });
</script>

<%--CONTENT--%>
<script>
   $('#dashboard').click( function (){

       $('.settings').hide();
       $('.projects').hide();
       $('.gallery').hide();
       $('.dashboard').show();
   });

   $('#projects').click( function (){
       $('.projects').show();
       $('.settings').hide();
       $('.gallery').hide();
       $('.dashboard').hide();
   });

   $('#settings').click( function (){
       $('.settings').show();
       $('.projects').hide();
       $('.gallery').hide();
       $('.dashboard').hide();
   });
   $('#gallery').click( function (){
       $('.gallery').show();
       $('.projects').hide();
       $('.settings').hide();
       $('.dashboard').hide();
   });





</script>



















<%--CHART--%>
<script>
        var chart;
        $("#dashboard").click(function ()
        {   var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            if(chart !=null) {
                chart.destroy();
            }
            context.clearRect(0, 0, canvas.width, canvas.height);
            context.beginPath();
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

   /* var chart ;


    $("#city").click(function ()
    {   var canvas = document.getElementById('content');
        var context = canvas.getContext('2d');
        if(chart !=null) {
            chart.destroy();
        }
        /!*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*!/
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
        var canvas = document.getElementsByClassName('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /!*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*!/

        var barChartData = {
            labels : ["< 50 000","< 100 000","< 200 000","< 500 000","< 1 000 000","> 1 000 000"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data : [3,22,3,15,27,30]
                }/!*,
                 {
                 fillColor : "rgba(151,187,205,0.5)",
                 strokeColor : "rgba(151,187,205,0.8)",
                 highlightFill : "rgba(151,187,205,0.75)",
                 highlightStroke : "rgba(151,187,205,1)",
                 data : [1,2,3,4,5,6]
                 }*!/
            ]

        }

        chart = new Chart(context).Bar(barChartData);
    });
    $("#price").click(function ()
    {

        var canvas = document.getElementsByClassName('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /!*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*!/

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

        var canvas = document.getElementsByClassName('content');
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
        var canvas = document.getElementsByClassName('content');
        var context = canvas.getContext('2d');

        if(chart !=null) {
            chart.destroy();
        }
        /!*context.clearRect(0, 0, canvas.width, canvas.height);
         context.beginPath();*!/

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
    });*/
</script>


<%-- Menu tile--%>
<script>
    /**
     * Created by hidagara on 04.05.2016.
     */
    $(document).ready(function() {
        $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
        $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    });
    $(document).ready(function() {
        $('.carousel').carousel({
            interval: 6000
        })
    });

</script>

</body>
</html>
