<%-- 
    Document   : agregar_prod
    Created on : 02-05-2014, 04:43:33 PM
    Author     : Enziwow
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    
      
       Connection conn= null;

       if(request.getParameter("r_submit")!=null)
       {
       
         try{
         String s_cod = request.getParameter("r_codigo");
         String s_nom = request.getParameter("r_nombre");
         String s_descrip = request.getParameter("r_descrip");
         String s_catego = request.getParameter("r_categoria");
         String s_cant = request.getParameter("r_cant");
         String s_precio = request.getParameter("r_precio");

         //Conectar BD
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         conn.createStatement().execute("INSERT INTO Producto  VALUES ('"+s_cod+"','"+s_nom+"','"+s_cant+"','"+s_descrip+"','"+s_catego+"','"+s_precio+"')");
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
                
                
               var cod = document.getElementById("cod").value;
               var nom = document.getElementById("nom").value;
               var descrip = document.getElementById("descrip").value;
               var categoria = document.getElementById("categoria").value;
               var cant = document.getElementById("cant").value;
               var precio = document.getElementById("precio").value;
               if(cod.length!== 0  && 
                  nom.length!==0 && 
                  descrip.length!== 0 && 
                  categoria.length!== 0 && 
                  cant.length!== 0 && 
                  precio.length!== 0){
                    
                     return true;
               }
               else{
                   
                   
                   //Validar que los campos no esten vacíos
                  alert(" Error : Complete todos los campos");
                  if(cod.length===0){
                      
                      //rut.focus();
                      return false;
                      
                  }
                  
                  if(nom.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  if(descrip.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  if(categoria.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  if(cant.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  if(precio.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  
                   
               }
                
                
                
                
            }
            
            
            
            
            
        </script>
    </head>
    <body>
        <h1>Plantilla Agregar Producto</h1>
        <form method="get" onsubmit = "return validacion();"  >
           Codigo Producto : <input type="text" name="r_codigo" id ="cod" value="" /><br />
           Nombre Producto :<input type="text" name="r_nombre" id="nom"  value="" /><br />
           Descripcion Producto :<input type="text" name="r_descrip" id="descrip"  value="" /><br />
           Categoría Producto :<input type="text" name="r_categoria" id="categoria"  value="" /><br />
           Cantidad Producto :<input type="text" name="r_cant" id="cant"  value="" /><br />
           Precio Producto :<input type="text" name="r_precio" id="precio"  value="" /><br />
           <input type="submit" name="r_submit" value="Finalizar" /><br />

           
       
    </form>
        
    </body>
</html>
