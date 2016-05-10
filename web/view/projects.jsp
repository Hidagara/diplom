<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 08.05.2016
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/shopping.css">
</head>
<body>
<div class="wrap cf">
    <h1 class="projTitle">Responsive Table<span>-Less</span> Shopping Cart</h1>
    <div class="heading cf">
        <h1>Проекты <c:out value="${sessionScope.username}"/> </h1>
        <a href="/view/user.jsp" class="continue">Меню</a>
    </div>
    <div class="cart">
           <ul class="tableHead">
              <li class="prodHeader">Product</li>
              <li>Quantity</li>
              <li>Total</li>
              <li>Remove</li>
            </ul>
        <ul class="cartWrap">
             
            
            <jsp:include page="/proj_info">

            </jsp:include>






            <!--<li class="items even">Item 2</li>-->

        </ul>
    </div>



    <div class="subtotal cf">
        <ul>
            <li class="totalRow"><span class="label">Итоговая стоимость всех проектов</span><span class="value">$35.00</span></li>

            <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>

            <li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>
            <li class="totalRow final"><span class="label">Total</span><span class="value">$44.00</span></li>
            <li class="totalRow"><a href="#" class="btn continue">Checkout</a></li>
        </ul>
    </div>
</div>

<script>
    // Remove Items From Cart
    $('a.remove').click(function(){
        event.preventDefault();
        $( this ).parent().parent().parent().hide( 400 );

    })

    // Just for testing, show all items
    $('a.btn.continue').click(function(){
        $('li.items').show(400);
    })


</script>
</body>
</html>
