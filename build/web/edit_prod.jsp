<%-- 
    Document   : edit_prod
    Created on : 02-05-2014, 10:13:20 PM
    Author     : Enziwow
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
 <html>
    <head>
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <h1>Editar Producto</h1>
        <h2>User<%=session.getAttribute("login").toString()%></h2>
    <%
          //Editar Producto
        
         String nom = (String)session.getAttribute("nombre");
         String descrip="";
         String categor="";
         String cod="";
         String stock="";
         String precio="";
         Connection con= null;
         Statement stmtt= null;
         
        try{
            
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
            stmtt = con.createStatement();
            ResultSet resultado = stmtt.executeQuery( "SELECT * FROM Producto WHERE nombre = '"+nom+"'");
           
                
                if(resultado.next()){
                    
                   //out.println("El producto buscado  existe ");
                   cod = resultado.getObject("id_producto").toString();
                   stock = resultado.getObject("stock").toString();
                   //out.println(stock);
                   descrip = resultado.getObject("descripcion").toString();
                   //out.println(descrip);
                   categor = resultado.getObject("categoria").toString();
                   precio = resultado.getObject("precio").toString();
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
         
    
           
    
            
          %>
          
          
         <%
              if(request.getParameter("r_submit")!=null){
                  
                  String nombrew =(String)session.getAttribute("nombre");
                  out.println(nombrew);
                  String descripciow = request.getParameter("r_descrip");
                  String categoriaw = request.getParameter("r_categor");
                  String preciow = request.getParameter("r_precio");

                  Connection conn = null;
                  Statement stmt= null;
             
             
             
             try{
                 
                 
                 //Se registra JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                 conn.createStatement().execute("UPDATE Producto SET descripcion = '"+descripciow+"', categoria = '"+categoriaw+"',precio = '"+preciow+"' WHERE nombre = '"+nombrew+"'");
                out.println("Producto editado satisfcatoriamente");
                response.sendRedirect("admin.jsp");

                  
              }
             catch(Exception e){
                 
                 out.println("Exception: " + e);
                 e.printStackTrace();
                 
             }
             finally{
             
             if(con!=null){
                 
                 con.close();
             }
             
            }
              }
              if(request.getParameter("r_submito")!= null){
        
          
                  response.sendRedirect("admin.jsp");
        
             } 
         
             
            // out.println(nombre);
         %>
    
     
         <form name="f" method="get"  >
             
             Descripción Producto: <input type="text" name="r_descrip"  value="<%=descrip %>" /><br />
             Categoría Producto: <input type="text" name="r_categor"  value="<%=categor %>" /><br />
             Precio Producto: <input type="text" name="r_precio"  value="<%=precio %>" /><br />
             <input type="submit" name="r_submit"  value="Guardar Cambios" /><br />
             <% out.println("Codigo Producto : '"+cod+"'"); %>
             <% out.println("Nombre Producto : '"+nom+"'"); %>
             <% out.println("Cantidad Producto : '"+stock+"'"); %>
       

         
         
         </form>
         <form  method="get"  >
           
          <input type="submit" name="r_submito" value="Volver Menu" /><br />

           
    </form>
             
    </body>
</html>
