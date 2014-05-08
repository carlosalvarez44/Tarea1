<%-- 
    Document   : admin_produc
    Created on : 02-05-2014, 01:47:52 PM
    Author     : Enziwow
--%>


<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getParameter("r_agregar")!=null){
        
        
         response.sendRedirect("agregar_prod.jsp");
        
    }
    
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Administrar Productos</h1>
        <%
    
      String error = "<p>&nbsp;</p>";
      Connection conn= null;
      Statement stmt= null;
       
         try{
         //String s_rut = request.getParameter("n_rut");
         //String s_nombre = request.getParameter("n_nombre");
         
         //Conectar BD
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         stmt = conn.createStatement();
         ResultSet resultados = stmt.executeQuery( "SELECT id_producto,nombre,stock FROM Producto");
         out.println("<table border=\"1\"><tr><td>id_producto</td><td>nombre</td><td>stock</td></tr>");
         
         while(resultados.next()){
             
             out.println("<tr>");
             out.println("<td>"+resultados.getObject("id_producto")+"</td>");
             out.println("<td>"+resultados.getObject("nombre")+"</td>");
             out.println("<td>"+resultados.getObject("stock")+"</td>");
             out.println("</tr>"); 
             
 
             
             
         }
         out.println("</table>");
         
         }
         catch(Exception e){
             
             out.println("Exception " + e);
             e.printStackTrace();
             
         }
         finally{
             
             if(conn!=null){
                 
                 conn.close();
             }
             
         }
         
     
   
    
    
    %>
    <form method="get"  >
           Agregar Producto : <input type="submit" name="r_agregar" value="Agregar" /><br />
           Editar Producto :<input type="submit" name="r_editar"  value="Editar" /><br />
       
    </form>
    </body>
</html>
