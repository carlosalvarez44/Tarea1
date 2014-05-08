<%-- 
    Document   : vendedor
    Created on : 01-05-2014, 12:35:54 PM
    Author     : Enziwow
--%>
<%
    if(request.getParameter("r_ing_cliente")!= null){
        
        response.sendRedirect("ing_cliente.jsp");
        
        
    }
    
    
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido al Menu Vendedor!</h1>
        <form method="get" >
           Ingresar Cliente <input type="submit" name="r_ing_cliente" value="ingresar" /><br />
           Ingresar Venta <input type="submit" name="r_ing_venta" value="ingresar" /><br />
           Mis Ventas <input type="submit" name="mis_ventas" value="ingresar" /><br />
           Ver ventas a Cliente  <input type="submit" name="ventas_cli2" value="ingresar"/><br />
        </form>
    </body>
</html>
