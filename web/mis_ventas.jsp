<%-- 
    Document   : mis_ventas
    Created on : 08-05-2014, 08:20:14 PM
    Author     : Enziwow
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mis Ventas</h1>
        <h2>User<%=session.getAttribute("login").toString()%></h2>
        <%
            Connection conn=null;
           try{ 
            Statement stmtw = null;
            Statement s = null;
            ResultSet res = null;
            String r_vendedor = session.getAttribute("rut").toString();
            String idventa="";
            int cont=0;
            
            Statement stmt= null;
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery("SELECT * FROM Venta WHERE rut_u = '"+r_vendedor+"' ");
             if(resultados.next()){
             
             idventa = resultados.getString("id_venta");
             
         }
         else{
             
             out.println("El Vendedor no tiene ventas");
             cont = 1;
         }
             stmtw = conn.createStatement();
         
         ResultSet r = stmtw.executeQuery("SELECT id_producto,precio FROM DetalleVenta WHERE id_venta = '"+idventa+"' ");
         if(cont==0){
         out.println("<form method=get >");
         s = conn.createStatement();
         out.println("<table border=\"1\"><tr><td>ID Producto</td><td>Nombre Producto</td><td>Precio Item</td></tr>");
         // out.println("holaw");
         }
         while(r.next() && cont==0){
             
             
             res = s.executeQuery("SELECT * FROM Producto WHERE id_producto = '"+r.getString("id_producto")+"'");
             if(res.next()){
             out.println("<tr>");
             out.println("<td>"+r.getObject("id_producto")+"</td>");
             out.println("<td>"+res.getObject("nombre")+"</td>");
             out.println("<td>"+r.getObject("precio")+"</td>");
             out.println("</tr>"); 
             
             }
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
         if(request.getParameter("r_volver")!=null){
           
             response.sendRedirect("vendedor.jsp");

         }
         
         
            
            %>
       
            <form method="get">
             <input type="submit"  name="r_volver" value="Volver"  /><br />

             </form>
    </body>
</html>
