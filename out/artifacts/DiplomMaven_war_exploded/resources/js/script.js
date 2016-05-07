/**
 * Created by hidagara on 2/19/2016.
 */


/*
                           WITHOUT JQUERY
function projectsInWork(str) {
    var xhttp;
    if (str == "") {
        document.querySelector(".out_projectname").innerHTML = " ";
        return;
    }
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.querySelector(".out_projectname").textContent += xhttp.responseText;
        }
    };
    xhttp.open("GET", "/showprojects", true);
    xhttp.send();
}


function openProject(project)
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function ()
    {

    }


}


function showUsername(str) {
    var xhttp;
    if (str == "") {
        alert("Нет данных для запроса")
        return;
    }
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200)
        {
            document.querySelector(".out_username").innerHTML = xhttp.responseText;
           alert(xhttp.response);
        }
    };
    xhttp.open("GET", "/showUsername", true);
    xhttp.send();
}


function  createProject(data)
{
    var xhttp = new XMLHttpRequest();

}


function show_material(str)
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function ()
    {
        if (xhttp.readyState == 4 && xhttp.status == 200)
        {
            document.querySelector(".content").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("GET" , "/material?q="+str , true);
    xhttp.send();
}*/


/* USING JQUERY*/

