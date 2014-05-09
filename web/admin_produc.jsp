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
    
    //Agregar Producto
    if(request.getParameter("r_agregar")!=null){
        
        
         response.sendRedirect("agregar_prod.jsp");
        
    }
           
   
    %>
    
    
    
    
    <%
         //Editar Producto
    
     if(request.getParameter("r_editar")!=null){
        
         String nom = request.getParameter("r_buscar");
         Connection con= null;
         Statement stmtt= null;
         
        try{
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
            stmtt = con.createStatement();
            ResultSet resultado = stmtt.executeQuery( "SELECT nombre FROM Producto WHERE nombre = '"+nom+"'");
            if(resultado.next()){
                
               // response.sendRedirect("edit_prod.jsp");
                out.println("El producto buscado  existe ");
                //request.setAttribute("nombre",variableX);
                session.setAttribute("nombre",nom);
                response.sendRedirect("edit_prod.jsp");

                
            }
            else{
                
               out.println("El producto buscado no existe ");

                
            }
            
            
        }
        catch(Exception ex){
             
             out.println("Exception: " + ex);
             ex.printStackTrace();
             
         }
         finally{
             
             if(con!=null){
                 
                 con.close();
             }
             
         }
         
    }   
     
    
    
            
          %>


<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
          
    </head>
    <body>
        <h1>Administrar Productos</h1>
        <h2>User<%=session.getAttribute("login").toString()%></h2>
        <%
    
      String error = "<p>&nbsp;</p>";
      Connection conn= null;
      Statement stmt= null;
       
         try{
      
         
         //Conectar BD
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         stmt = conn.createStatement();
         ResultSet resultados = stmt.executeQuery( "SELECT id_producto,nombre,stock FROM Producto");
         out.println("<form method=get >");
         out.println("<table border=\"1\"><tr><td>id_producto</td><td>nombre</td><td>stock</td></tr>");
         while(resultados.next()){
           
            
             out.println("<tr>");
             out.println("<td>"+resultados.getObject("id_producto")+"</td>");
             out.println("<td>"+resultados.getObject("nombre")+"</td>");
             out.println("<td>"+resultados.getObject("stock")+"</td>");
             out.println("</tr>"); 
             
 
             
             
         }
         out.println("</table>");
         out.println("</form>");
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
         
         if(request.getParameter("r_submito")!= null){
        
              response.sendRedirect("admin.jsp");
          
         
         }

   
    
    
    %>
     
    <form  method="get"   >
           
                
           Buscar Producto :<input type="text" name="r_buscar"   value="" /><br /> 
           <input type="submit"  name="r_editar" value="Editar Producto"  /><br />
           
    </form>
    <form  method="get"  >
           
            Agregar Producto  <input type="submit" name="r_agregar" value="Agregar" /><br /> 
            
           
    </form>
     <form  method="get"  >
           
         <input type="submit"  name="r_submito" value="Volver Menu"  /><br />
            
           
    </form>
    </body>
</html>
