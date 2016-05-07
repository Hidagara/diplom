<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 2/16/2016
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/style.css">
    <script src="/resources/js/three.js"></script>
    <script src="/resources/js/script.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <title>Материалы</title>
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
        <li>Идеи</li>
        <li>Галерея</li>
        <li id="vhod"> <a href="User/userView.jsp"> <%  out.print(login==null ? ("Войти") : login);          %></a></li>
    </ul>
</header>

<ul class="material">

    <li class="fundament_material">
        <a>Foundation</a>
        <a onclick="show_material_pro(this.textContent)">Cement</a>
        <a onclick="show_material_pro(this.textContent)">Dust</a>
        <a onclick="show_material_pro(this.textContent)">Macadam</a>
        <a>Арматура</a>
    </li>

    <li class="wall_material">
        <a>Wall</a>
        <a onclick="show_material_pro(this.textContent)">Brick</a>
        <a onclick="show_material_pro(this.textContent)">Block</a>
        <a onclick="show_material_pro(this.textContent)">Wood</a>

    </li>

    <li class="roof_material">
        <a>Roof</a>
        <a onclick="show_material_pro(this.textContent)">Metal roof</a>
        <a onclick="show_material_pro(this.textContent)">Seam roof</a>
        <a onclick="show_material_pro(this.textContent)">Decking</a>
        <a>Композитная черепица</a>
    </li>

</ul>

<div class="table_head">
    <ul>
        <a>Наименование материала</a>
        <a>Отображение материала</a>
        <a>Цена <br>(руб)</a>
        <a>Магазин <br> (сайт)</a>
        <a>Показать материал</a>
        <a>Скрыть материал</a>
    </ul>

</div>


<div class="content">

    <li class="bd_material">

    </li>

</div>


<button onclick="material_preview()" ></button>





<button class="preview_material">

</button>


<div class="canvas_preview">

</div>




<script>

    <%--Obrabotchik sobitii i ajax--%>
    function show_material_pro (type)
    {
        $('.bd_material').load('/material',{type: type });  //bez sohranenia
        // $('.content').append($('<div>').load('/material', {type: type})); sohranenie kontenta


    }

    /*3d PREVIEW SCRIPT*/
    var loader, scene, camera, renderer, container, light, geometry, material, bdmesh, render;

    window.onload = function () {
        loader = new THREE.TextureLoader();
        scene = new THREE.Scene();
        camera = new THREE.PerspectiveCamera( 15, 1, 0.1, 1000 );
        container = document.body.querySelector('.canvas_preview');
        renderer = new THREE.WebGLRenderer();
        renderer.setSize( 300, 350 );
        renderer.setClearColor( 0xCCCCCC );
        container.appendChild( renderer.domElement );

        light = new THREE.DirectionalLight( 0xffffff );
        light.position.set( 0, 1, 1 ).normalize();
        scene.add(light);

        /* KUB TEST*/
        /* var geometry = new THREE.BoxGeometry( 1, 1, 1 );*/
        /*var material = new THREE.MeshBasicMaterial();*/
        /*  var cube = new THREE.Mesh( geometry, material );*/
        /*  scene.add( cube );*/
        /*Sphere from bd*/
        geometry = new THREE.SphereGeometry(0.6, 32, 32);
        material = new THREE.MeshPhongMaterial( { color: 0xFFFFFF } );
        bdmesh = new THREE.Mesh(geometry, material);
        material.map =  loader.load('/resources/texture/test.jpg');
        scene.add(  bdmesh);


        camera.position.z = 5;

        render = function () {
            requestAnimationFrame( render );

            bdmesh.rotation.x += 0.01;
            bdmesh.rotation.y += 0.01;
            renderer.render(scene, camera);
        };

        render();
    }
    /* SCENE RENDERER*/


    /*Otobrajenie materiala*/
    $(".bd_material").on("click", "#show", function(){                   /*Pokazat scenu*/
        $('.canvas_preview').show();
        material.map =  loader.load($('.texture img').attr('src'));
        bdmesh.material.map.needsUpdate = true;



    });

    $(".bd_material").on("click", "#hide", function(){                 /*Skrit scenu*/
        $('.canvas_preview').hide();

    });
    /**/



    function create_scene()
    {

    }

    /**/

    function material_preview()
    {






    }



</script>
</body>

</html>
