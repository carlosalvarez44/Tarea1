<%-- 
    Document   : ventas_cli
    Created on : 08-05-2014, 04:24:56 PM
    Author     : Enziwow
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
       
    
    
    Connection conn=null;
    int cont=0;
    if(request.getParameter("r_ver")!=null){
    
       try{
        
        
        Statement stmt= null;
        Statement stmtw = null;
        Statement s = null;
        ResultSet res = null;
        ResultSet resultados = null;
        
         String cli= request.getParameter("clies").toString();
         String idventa= "";
         Class.forName("oracle.jdbc.OracleDriver");
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         stmt = conn.createStatement();
         resultados = stmt.executeQuery("SELECT * FROM Venta WHERE rut_c = '"+cli+"' ");
         //out.println(cli);
         if(resultados.next()){
             
             idventa = resultados.getString("id_venta");
             
         }
         else{
             
             out.println("El cliente no tiene ventas relacionadas");
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
        <h1>Ver Ventas Cliente</h1>
        <h2>User<%=session.getAttribute("login").toString()%></h2>
        <form method="get">
            <select name="clies">
                <option selected value=""> Elige un Cliente </option>
                
        <%
              try{
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                    Statement st=conn.createStatement();
                    ResultSet rs= st.executeQuery("Select rut FROM Cliente");
                    String rut = "";
                    while(rs.next()){
                     
                      rut = rs.getObject("rut").toString();
                      out.println(rut);
                    %>
                         
                        <option value="<%=rut%>"><%=rut%></option>

             
                      <% }
        
                    }
                    catch(Exception e){
                     
                     out.println("Excepcion: " + e);
                     e.printStackTrace();  
                     
              }
              finally{
             
                 if(conn!=null){
                 
                    conn.close();
                 }
              }
              if(request.getParameter("r_submito")!= null){
        
                if(session.getAttribute("login").toString()=="administrador"){
        

                  response.sendRedirect("admin.jsp");
          
               }
               else{
              
                response.sendRedirect("vendedor.jsp");
              
              }
        
        
            }

         %>

            </select>
         
         <input type="submit"  name="r_ver" value="Ver"  /><br />

        </form>
         <form  method="get"  >
           
         <input type="submit"  name="r_submito" value="Volver Menu"  /><br />
            
           
         </form>
    </body>
</html>
