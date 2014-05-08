<%-- 
    Document   : admin
    Created on : 01-05-2014, 12:35:35 PM
    Author     : Enziwow
--%>


<%
    if(request.getParameter("r_ing_vendedor")!= null){
        
        response.sendRedirect("ing_vendedor.jsp");
        
        
    }
    if(request.getParameter("r_ing_cliente")!= null){
        
        
        response.sendRedirect("ing_cliente.jsp");
        
    }
    if(request.getParameter("r_admin_productos")!= null){
        
        
        response.sendRedirect("admin_produc.jsp");
        
    }
    if(request.getParameter("r_ing_compra")!= null){
        
        
        response.sendRedirect("ing_compra.jsp");
        
    }
    if(request.getParameter("r_ing_venta")!= null){
        
        
        response.sendRedirect("ing_venta.jsp");
        
    }
    if(request.getParameter("r_ventas_cli")!= null){
        
        
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
        <h1> Bienvenido al Menu Administrador!</h1>
        <form method="get" >
           Ingresar Vendedor <input type="submit" name="r_ing_vendedor" value="ingresar" /><br />
           Ingresar Cliente <input type="submit" name="r_ing_cliente" value="ingresar" /><br />
           Administar Productos <input type="submit" name="r_admin_productos" value="ingresar" /><br />
           Ingresar Compra <input type="submit" name="r_ing_compra" value="ingresar" /><br />
           Ingresar Venta <input type="submit" name="r_ing_venta" value="ingresar" /><br />
           Ver ventas a Cliente  <input type="submit" name ="r_ventas_cli" value="ingresar"/><br />
           Cerrar Sesión  <input type="submit" name ="r_cerrar" value="Salir"/><br />
        </form>
    </body>
</html>
