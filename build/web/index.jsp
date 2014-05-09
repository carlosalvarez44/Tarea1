<%-- 
    Document   : index
    Created on : 30-04-2014, 11:57:28 PM
    Author     : Enziwow
--%>


<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
 
     <%
         
       
       
         
         if(request.getParameter("r_submit")!= null){
             
             
             String nombre = request.getParameter("r_nombre");
             String clave = request.getParameter("r_clave");
             session.setAttribute("id_usuario",nombre);
             Connection conn = null;
             Statement stmt= null;
             
             
             
             try{
                 
                 
                 //Se registra JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                stmt = conn.createStatement();
                ResultSet resultados = stmt.executeQuery( "SELECT * FROM Usuario WHERE rut = '"+nombre+"' AND contrasena = '"+clave+"'"); // Objeto rset de resultSet almacena datos de la consulta
                 
                
                 if(resultados.next() ){
                    
                    //Se crea sesion "login" y se le setea el tipo admin o vendedor
                    /* if(session.getAttribute("login")!=null ||session.getAttribute("tipo")!=null ){
                         
                         session.removeAttribute("login");
                         session.removeAttribute("tipo");
                         session.invalidate();
                         
                     } */
                     session.setAttribute("login",true);
                     session.setAttribute("login",resultados.getString("tipo"));
                     String tipo = resultados.getString("tipo");
                     session.setAttribute("rut",resultados.getString("rut"));
                     if(tipo.equals("administrador")){
                       
                       response.sendRedirect("admin.jsp");
                     }
                     else{
                       
                       
                       response.sendRedirect("vendedor.jsp");
                       
                       
                     }
                   
                     
                     
                 }
                 else{
                     
                     out.println("Error: Usuario o Clave incorrecto ");
                     
                 }
               
             }
             catch(Exception e){
                 
                 out.println("Exception " + e);
                 e.printStackTrace();
                 
             }
             finally{
            
                if(conn!= null){
                    
                    
                    conn.close();
                    stmt.close();
                    
                    
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
        <h1>Login Usuario</h1>
        <form method="GET" > 
            
            <table border="1">
                
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="r_nombre" value="" /> </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td> <input type="password" name="r_clave" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="r_submit" value="Enviar" /> </td>
                    </tr>
                </tbody>
            </table>
        
        </form>
        
    </body>
</html>
