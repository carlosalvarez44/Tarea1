<%-- 
    Document   : ing_venta
    Created on : 05-05-2014, 10:33:56 PM
    Author     : Enziwow
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
            Connection conn = null;
            Connection con = null;
            Connection c = null;
            Statement stmt= null;
            Statement stmtw= null;
            Statement s= null;
            Statement st= null;
            ResultSet resultados ;
            ResultSet r ;

              //out.println(session.getAttribute("id_usuario").toString());
              String random="";
              String nom="";
              String nomb ="";
          
    
             
              if(request.getParameter("r_agregar")!=null){
                  
                  
                  nom = request.getParameter("clies").toString();
                  session.setAttribute("nom_cliente",nom);

                  out.println(nom);

                  //session.removeAttribute("idvent");
                  if(session.getAttribute("idvent")==null){
                 
                 
                 try{
                   
                 Class.forName("oracle.jdbc.OracleDriver");
                 c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                 stmt = conn.createStatement();
                 s =  con.createStatement();
                 int verif = 0;
                 String cli ="";
                 while(verif==0){
                  
                  verif =1;
                  int aleatorio = (int)(Math.random()*5999);
                  random = Integer.toString(aleatorio);
                 // out.println(random);

                
                  resultados = stmt.executeQuery( "SELECT id_venta FROM Venta");
                  
                  while(resultados.next()){
                      
                      if(random == resultados.getObject("id_venta").toString()){
                          
                          verif=0; //Es falso
                          
                      }
                      
                      
                  }
                 
                  
               }
              session.setAttribute("idvent",random);
              r = s.executeQuery( "SELECT rut  FROM Cliente WHERE nombre = '"+nom+"'");

              int monto = 0;
              String montow = Integer.toString(monto);
              if(r.next()){
                  
                  
                  cli = r.getObject("rut").toString();
                  //out.println(cli);
                  
              }
              c.createStatement().execute("INSERT INTO Venta (id_venta,rut_c,rut_u,monto) VALUES ('"+session.getAttribute("idvent").toString()+"','"+cli+"','"+session.getAttribute("id_usuario").toString()+"','"+montow+"')");

               
               
              }
              catch(Exception e){
                     
                   out.println("Excepcion: " + e);
                    e.printStackTrace();  
                     
              }
              finally{
             
                 if(conn!=null){
                 
                    conn.close();
                 }
                 if(con!=null){
                     
                     con.close();
                     
                 }
              }
             } 
             
                try{
                 
                  int cantidad=0;
                  int precio=0;
                  int sumatoria=0;
                  int canti=0;
                  int mult=0;
                  String sum;
                  
                  String id = request.getParameter("r_id");
                  String cant = request.getParameter("r_cant");
                  //out.println(id);
                  //out.println(nom);
                  conn = null;
                  stmt= null;
             
                  String t_id ="";
                  String t_cant ="";
                  String t_precio="";
                  //out.println((String)session.getAttribute("id"));

                 
                
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
                
                if(Integer.parseInt(cant) <= cantidad){
                    
                   //canti = cantidad - Integer.parseInt(cant);
                   //String resta = Integer.toString(canti);
                   //out.println(resta);
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

                   conn.createStatement().execute("INSERT INTO DetalleVenta (id_venta,id_producto,precio,cantidad)  VALUES ('"+session.getAttribute("idvent").toString()+"','"+t_id+"','"+Integer.toString(mult)+"','"+cant+"')");

                   
                    
                }
                //session.removeAttribute("suma");

                  
                
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
                    con= null;
                    stmt= null;
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                    con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                    conn.createStatement().execute("UPDATE Venta SET monto ='"+session.getAttribute("suma").toString()+"' WHERE id_venta = '"+session.getAttribute("idvent").toString()+"'");
                    stmt = conn.createStatement();
                    stmtw = conn.createStatement();
                    st = con.createStatement();

                    s = conn.createStatement();
                    ResultSet rs;
                    String id="";
                    //out.println(session.getAttribute("idvent").toString());
                    //out.println(session.getAttribute("suma").toString());
                    ResultSet result = stmt.executeQuery( "SELECT id_producto,precio FROM DetalleVenta WHERE id_venta= '"+session.getAttribute("idvent").toString()+"'");
                    r = s.executeQuery( "SELECT rut_c,rut_u,monto,fecha FROM Venta WHERE id_venta= '"+session.getAttribute("idvent").toString()+"'");
                    out.println("Venta realizada satisfactoriamente");
                    session.removeAttribute("idvent");
                    session.removeAttribute("suma");
                    ResultSet rn = st.executeQuery("SELECT * FROM Usuario WHERE rut = '"+session.getAttribute("id_usuario").toString()+"'");
                    

                    if(rn.next()){
                        
                         nomb = rn.getObject("nombre").toString();
                         //out.println(nomb);
                        
                    }
                    
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
                        
                        out.println("Rut Vendedor :'"+r.getObject("rut_u").toString()+"'");
                        out.println("\n");
                        out.println("Nombre Vendedor :'"+nomb+"'");
                        out.println("Rut Cliente :'"+r.getObject("rut_c").toString()+"'");
                        out.println("Nombre Cliente :'"+session.getAttribute("nom_cliente")+"'");
                        out.println("Monto Total :'"+r.getObject("monto").toString()+"'");
                        out.println("Fecha :'"+r.getObject("fecha").toString()+"'");
                           
                        
                    }
                      }
                  catch(Exception e){
                      
                      out.println("Excepcion: " + e);
                      e.printStackTrace();
                      
                  }
                  finally{
             
                   if(conn!=null){
                 
                     conn.close();
                    }
                   if(con!=null){
                 
                     con.close();
                    }
             
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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ingresar Venta</h1>
        <h2>User <%= session.getAttribute("login").toString()%></h2>
        <form method="get">
            <select name="clies">
                <option selected value=""> Elige un Cliente </option>
                
        <%
            try{
                    Class.forName("oracle.jdbc.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "SYSTEM", "creativex");
                    st=conn.createStatement();
                    ResultSet rs= st.executeQuery("Select nombre FROM Cliente");
                    String nombre = "";
                    while(rs.next()){
                     
                      nombre = rs.getObject("nombre").toString();
                      out.println(nombre);
                    %>
                         
                        <option value="<%=nombre%>"><%=nombre%></option>

             
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
         %>

            </select>
         ID Producto :<input type="text" name="r_id"   value="" /><br /> 
         Cantidad Producto :<input type="text" name="r_cant"   value="" /><br /> 
         <input type="submit"  name="r_agregar" value="Agregar Producto"  /><br />

        </form>
         <form  method="get"  >
           
                      <input type="submit"  name="r_finalizar" value="Finalizar Venta"  /><br />

           
         </form>
         <form  method="get"  >
           
              <input type="submit"  name="r_submito" value="Volver Menu"  /><br />

           
         </form>
        
    </body>
</html>
