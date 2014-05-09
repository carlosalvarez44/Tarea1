<%-- 
    Document   : ing_compra
    Created on : 03-05-2014, 10:24:07 PM
    Author     : Enziwow
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    
              Connection conn = null;
              Statement stmt= null;
              Statement stmtw = null;
              Statement s = null;
              ResultSet resultados ;
              String random="";
              
              //Para obtener id_compra e insertar compra
              if(session.getAttribute("idcomp")==null){
                 
                 
                try{
                   
                 Class.forName("oracle.jdbc.OracleDriver");
                 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                 stmt = conn.createStatement();
                  
                 int verif = 0;
                 while(verif==0){
                  
                  verif =1;
                  int aleatorio = (int)(Math.random()*5999);
                  random = Integer.toString(aleatorio);
                  //out.println(random);

                
                  resultados = stmt.executeQuery( "SELECT id_compra FROM Compra");
                  
                  while(resultados.next()){
                      
                      if(random == resultados.getObject("id_compra").toString()){
                          
                          verif=0; //Es falso
                          
                      }
                      
                      
                  }
                 
                  
               }
              session.setAttribute("idcomp",random);
              int monto = 0;
              String montow = Integer.toString(monto);
              
              conn.createStatement().execute("INSERT INTO Compra (id_compra,monto_total) VALUES ('"+session.getAttribute("idcomp").toString()+"','"+montow+"')");

               
               
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
             }
    
             
              if(request.getParameter("r_agregar")!=null){
                  
                  int cantidad=0;
                  int precio=0;
                  int sumatoria=0;
                  int canti=0;
                  int mult=0;
                  String sum;
                  
                  String id = request.getParameter("r_id");
                  String cant = request.getParameter("r_cant");
                  String preci = request.getParameter("r_preci");
                  
                  conn = null;
                  stmt= null;
             
                  String t_id ="";
                  String t_cant ="";
                  String t_precio="";
                  //out.println((String)session.getAttribute("id"));

             
                try{
                 
                 
                 
                
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                stmt = conn.createStatement();
                
                

                resultados = stmt.executeQuery( "SELECT id_producto,stock,precio FROM Producto WHERE id_producto='"+id+"'");
                
                if(resultados.next()){
                    
                    t_id = resultados.getObject("id_producto").toString();
                    t_cant = resultados.getObject("stock").toString();
                    t_precio = resultados.getObject("precio").toString();

                    
                }
                cantidad = Integer.parseInt(t_cant);
                precio =  Integer.parseInt(t_precio);
                
                
                    
                   
                   
                 
                   mult = precio*Integer.parseInt(cant);
                   //out.println(Integer.toString(mult));
                   
                   if(session.getAttribute("suma")!=null){
                      
                      
                      sum = session.getAttribute("suma").toString();
                      //out.println(sum);
                      //out.println(Integer.toString(mult));
                      sumatoria = mult +  Integer.parseInt(sum);
                      sum = Integer.toString(sumatoria);
                      session.setAttribute("suma",sum);
                      //out.println((String)session.getAttribute("suma"));

                       
                   }
                   else{
                       sum = Integer.toString(mult);
                       session.setAttribute("suma",sum);
                       //out.println((String)session.getAttribute("suma"));


                       
                       
                   }
                  
                  
                  // conn.createStatement().execute("UPDATE Producto SET stock = '"+resta+"' WHERE id_producto = '"+t_id+"'");
                  conn.createStatement().execute("INSERT INTO DetalleCompra (id_compra,id_producto,cantidad,precio)  VALUES ('"+session.getAttribute("idcomp").toString()+"','"+t_id+"','"+cant+"','"+Integer.toString(mult)+"')");
                  
                   //out.println("El stock se redujo de tabla Productos");
                   
             

                
                
              }
             catch(Exception e){
                 
                 out.println("Producto inexistente: " + e);
                 e.printStackTrace();
                 
             }
             finally{
             
             if(conn!=null){
                 
                 conn.close();
             }
             
            }
              }
              if(request.getParameter("r_finalizar")!=null){
                  
                  try{
                      
                    conn = null;
                    stmt= null;
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                   
                    conn.createStatement().execute("UPDATE Compra SET monto_total ='"+session.getAttribute("suma").toString()+"' WHERE id_compra = '"+session.getAttribute("idcomp").toString()+"'");
                    stmt = conn.createStatement();
                    stmtw = conn.createStatement();
                    s = conn.createStatement();
                    ResultSet rs;
                    String id="";
                    //out.println(session.getAttribute("idcomp").toString());
                    //out.println(session.getAttribute("suma").toString());
                    ResultSet result = stmt.executeQuery( "SELECT id_producto,precio FROM DetalleCompra WHERE id_compra= '"+session.getAttribute("idcomp").toString()+"'");
                    ResultSet r = s.executeQuery( "SELECT monto_total,fecha FROM Compra WHERE id_compra= '"+session.getAttribute("idcomp").toString()+"'");
                    out.println("Compra realizada satisfactoriamente");
                    session.removeAttribute("idcomp");
                    session.removeAttribute("suma");
                    
                    out.println("<form method=get >");
                    out.println("<table border=\"1\"><tr><td>Nombre Producto</td><td>Precio Item</td></tr>");
                    while(result.next()){
                       
                       id = result.getObject("id_producto").toString(); 
                       //out.println(id);
                       rs = stmtw.executeQuery( "SELECT * FROM Producto WHERE id_producto = '"+id+"'"); 
                       if(rs.next()){
                           
                        out .println("<tr>");
                        out.println("<td>"+rs.getObject("nombre")+"</td>");
                        out.println("<td>"+result.getObject("precio")+"</td>");
                        out.println("</tr>");
                           
                       }
                   
                    }
                     out.println("</table>");
                     out.println("</form>");
                     if(r.next()){
                        
                        out.println("Monto Total :'"+r.getObject("monto_total").toString()+"'");
                        out.println("Fecha :'"+r.getObject("fecha").toString()+"'");
                           
                        
                    }
                       
                    //out.println("<form method=get >");
                    //out.println("<table border=\"1\"><tr><td>Nombre Producto</td><td>Precio Producto</td><td>Monto Total</td> <td>Fecha</td></tr>");
                   /* while(resultadoww.next()){
                       
                       
                        out.println("hola");
                        resultadowww= stmt.executeQuery( "SELECT nombre,precio FROM Producto WHERE id_producto = '"+resultadoww.getObject("id_producto").toString()+"'");
                       
                       if(resultadow.next()){
                          
                          out.println("Monto Total :'"+resultadow.getObject("monto_total").toString()+"'");
                          out.println("Fecha :'"+resultadow.getObject("fecha").toString()+"'");
                           
                       }
                       out.println("<tr>");
                       out.println("<td>"+resultadowww.getObject("nombre")+"</td>");
                       out.println("<td>"+resultadowww.getObject("precio")+"</td>");
                       out.println("</tr>");
                        
                    } */
                    
                    /* if(resultadow.next()){
                        
                        
                          out.println("<form method=get >");
                          out.println("<table border=\"1\"><tr><td>Nombre Producto</td><td>Precio Producto</td><td>Monto Total</td> <td>Fecha</td></tr>");
                       int cont =0;
                       while(resultadow2.next()){
           
            
                          out.println("<tr>");
                          out.println("<td>"+resultadow2.getObject("nombre")+"</td>");
                          out.println("<td>"+resultadow2.getObject("precio")+"</td>");
                          if(cont==0){
                              
                               out.println("<td>"+resultadow.getObject("monto_total")+"</td>");
                               out.println("<td>"+resultadow.getObject("fecha")+"</td>");
                               cont=cont+1;
                              
                          }
                          else{
                              out.println("<td></td>");
                              out.println("<td></td>");
                              
                          }
                          out.println("</tr>"); 
             
 
             
             
                       }
                          
                         
                        
                    }  */
                    
                    
                  
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
                  
              }
              if(request.getParameter("r_submito")!= null){
        
          
                  response.sendRedirect("admin.jsp");
        
             } 

         
             
            // out.println(nombre);
         %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            
            
            function validar(){
                
                
               var id = document.getElementById("n_id").value;
               var cant = document.getElementById("n_cant").value;

               if(id.length!== 0  && cant.length!==0){
                   
                     return true;
               }
               else{
                   
                   
                   //Validar que los campos no esten vacíos
                  alert(" Error : Complete todos los campos");
                  if(id.length===0){
                      
                      //rut.focus();
                      return false;
                      
                  }
                  
                  if(cant.length === 0){
                      
                      //nom.focus();
                      return false;
                  }
                  
                   
               }
                
                
                
                
            }
            
            
            
            
            
        </script>
    </head>
    <body>
        <h1>Ingresar Compra</h1>
        <h2>User <%= session.getAttribute("login").toString()%></h2>
         <form method="get" onsubmit = "return validar();"  >
            
              ID Producto :<input type="text" name="r_id"   value="" id="n_id" /><br /> 
              Cantidad Producto :<input type="text" name="r_cant"   value="" id="n_cant"  /><br /> 
              <input type="submit"  name="r_agregar" value="Agregar Producto"  /><br />

    </form>
         <form  method="get"  >
           
              <input type="submit"  name="r_finalizar" value="Finalizar Compra"  /><br />

           
    </form>
        <form  method="get"  >
           
              <input type="submit"  name="r_submito" value="Volver Menu"  /><br />

           
    </form>
    </body>
</html>
