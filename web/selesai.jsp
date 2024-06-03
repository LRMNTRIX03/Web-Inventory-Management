<%-- 
    Document   : selesai.jsp
    Created on : 30 May 2024, 16.37.25
    Author     : lutfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="invoice.jsp" %>
<jsp:useBean id="cart" scope="session" class="beans.ShoppingCart"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selesai</title>
    </head>
    <body>
         <%String add = request.getParameter("btnb");
    if(add!=null){
        if(add.equals("bayar")){
            cart.clearCart();
        }
    }
    %>
    <h1>TERIMA KASIH TELAH BERBELANJA DISINI, SELAMAT BERBELANJA KEMBALI!!</h1>
    <a href="index.jsp" class="btn">Kembali Ke Katalog</a>
    </body>
</html>
