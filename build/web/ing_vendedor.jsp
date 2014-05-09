<%-- 
    Document   : ing_vendedor
    Created on : 01-05-2014, 01:30:32 PM
    Author     : Enziwow
--%>

<%
    //Validar Inicio de Sesion
    
    /* if( (request.getSession(false)== null) || (session.getAttribute("login")== null) || ( session.getAttribute("login").equals(false) == null) ){
         
          
          
         
     } */
    
   


 %>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    
   
   Connection conn= null;
   
    if(request.getParameter("r_submit")!=null)
       {
       
         try{
         String s_rut = request.getParameter("n_rut");
         String s_clave = request.getParameter("n_clave");
         String s_nombre = request.getParameter("n_nombre");
         String s_tipo = "vendedor";
         //Conectar BD
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
         conn.createStatement().execute("INSERT INTO Usuario  VALUES ('"+s_rut+"','"+s_clave+"','"+s_nombre+"','"+s_tipo+"',0)");
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
     if(request.getParameter("r_submito")!= null){
        
        
        

        response.sendRedirect("admin.jsp");
        
        
    }
   

 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
          
           
          
          function validar(){
              
             var rut = document.getElementById("r_rut").value;
             var clave = document.getElementById("r_clave").value;
             var rclave = document.getElementById("r_repclave").value;
             var nom = document.getElementById("r_nombre").value;
             
            
              
              if(rut.length!== 0 && clave.length!==0 && rclave.length!==0 && nom.length!==0){
                 
        
                 
                   // Validar que claves sean iguales
                   if(clave!==rclave ){
                       
                      alert("Error : Las claves deben coincidir");
                      return false;
                   }
                   //document.form.submit() mandar formulario al servidor
                   
                   
                   //alert("Vendedor Ingresado Satisfactoriamente");
                   return true;
        
      
              }
              else{
                  
                //Validar que los campos no esten vacíos
                  alert(" Error : Complete todos los campos");
                  if(rut.length===0){
                      
                      //rut.focus();
                      return false;
                      
                  }
                  if(clave.length ===0){
                      
                      
                      //clave.focus();
                      return false;
                      
                  }
                  if(rclave.length===0){
                      
                    //rclave.focus();
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
        <h1>Plantilla Creación Vendedor</h1>
        <h2>User<%=session.getAttribute("login").toString()%></h2>
        <form name="f" method="get" onsubmit = "return validar();" >
           Rut : <input type="text" name="n_rut"  id="r_rut" value="" /><br />
           Contraseña : <input type="password" name ="n_clave" id="r_clave" value="" /><br />
           Repetir Contraseña :<input type="password" name="n_repclave" id="r_repclave" value="" /><br />
           Nombre :<input type="text" name="n_nombre" id="r_nombre" value="" /><br />
           <input type="submit" name="r_submit" value="Finalizar" /><br />

        </form>
        <form  method="get"  >
           
            <input type="submit" name="r_submito" value="Volver Menu" /><br />

           
    </form>
    </body>
</html>
