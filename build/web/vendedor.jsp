<%-- 
    Document   : vendedor
    Created on : 01-05-2014, 12:35:54 PM
    Author     : Enziwow
--%>
<%
    if(request.getParameter("r_ing_cliente")!= null){
        
        response.sendRedirect("ing_cliente.jsp");
        
        
    }
    if(request.getParameter("r_ing_venta")!= null){
        
        response.sendRedirect("ing_venta.jsp");
        
        
    }
    if(request.getParameter("mis_ventas")!= null){
        
        
        

        response.sendRedirect("mis_ventas.jsp");
        
        
    }
    if(request.getParameter("ventas_cli2")!= null){
        
        
        

        response.sendRedirect("ventas_cli.jsp");
        
        
    }
    if(request.getParameter("r_cerrar")!= null){
        
        
        

        response.sendRedirect("cerrar.jsp");
        
        
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
        <h2>User <%= session.getAttribute("login").toString()%></h2>
        <form method="get" >
           Ingresar Cliente <input type="submit" name="r_ing_cliente" value="Ir" /><br />
           Ingresar Venta <input type="submit" name="r_ing_venta" value="Ir" /><br />
           Mis Ventas <input type="submit" name="mis_ventas" value="Ir" /><br />
           Ver ventas a Cliente  <input type="submit" name="ventas_cli2" value="Ir"/><br />
        </form>
        <form  method="get"  >
           
          Cerrar Sesión  <input type="submit" name="r_cerrar" value="Salir"/><br />

           
    </form>
    </body>
</html>
