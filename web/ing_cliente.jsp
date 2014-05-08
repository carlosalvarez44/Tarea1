<%-- 
    Document   : ing_cliente
    Created on : 02-05-2014, 01:26:18 PM
    Author     : Enziwow
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
    

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
      String error = "<p>&nbsp;</p>";
       Connection conn= null;

       if(request.getParameter("r_submit")!=null)
       {
       
         try{
         String s_rut = request.getParameter("n_rut");
         String s_nombre = request.getParameter("n_nombre");
         //Conectar BD
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         conn.createStatement().execute("INSERT INTO Cliente  VALUES ('"+s_rut+"','"+s_nombre+"')");
         response.sendRedirect("verificar.jsp");
         }
         catch(Exception ex){
             
             out.println("Exception " + ex);
             ex.printStackTrace();
             
         }
         finally{
             
             if(conn!=null){
                 
                 conn.close();
             }
             
         }
         
     }
   
    
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript">
            
            
            function validacion(){
                
                
               var rut = document.getElementById("r_rut").value;
               var nom = document.getElementById("r_nombre").value;

               if(rut.length!== 0  && nom.length!==0){
                   
                     return true;
               }
               else{
                   
                   
                   //Validar que los campos no esten vacíos
                  alert(" Error : Complete todos los campos");
                  if(rut.length===0){
                      
                      //rut.focus();
                      return false;
                      
                  }
                  
                  if(nom.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  
                   
               }
                
                
                
                
            }
            
            
            
            
            
        </script>
    </head>
    <body>
        <h1>Plantilla Creacion Cliente</h1>
        <form method="get" onsubmit = "return validacion();" >
           Rut : <input type="text" name="n_rut"  id="r_rut" value="" /><br />
           Nombre :<input type="text" name="n_nombre" id="r_nombre" value="" /><br />
           <input type="submit" name="r_submit" value="Finalizar" /><br />
       
        </form>
    </body>
</html>
