<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 09.05.2016
  Time: 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/project_selector.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>


<jsp:include page="/select_project" />






<!--Typekit-->
<script type="text/javascript" src="//use.typekit.net/wyr7rug.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>

<script>
    $(document).ready(function() {
        $('.entry').hover(function () {
            var li = $('li', this);

            for (var i = 0; i < $(li).length; i++) {
                $($(li)[i]).stop().animate({
                    'height': '18px'
                }, 300 + (i * 150));
            }
        }, function () {
            $('li', this).stop().animate({
                'height': '5px'
            }, 250);
        });
    });
</script>
</body>
</html>
