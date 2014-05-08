package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public final class agregar_005fprod_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
      
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
   
    
    
    
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            function validacion(){\n");
      out.write("                \n");
      out.write("                \n");
      out.write("               var cod = document.getElementById(\"cod\").value;\n");
      out.write("               var nom = document.getElementById(\"nom\").value;\n");
      out.write("               var descrip = document.getElementById(\"descrip\").value;\n");
      out.write("               var categoria = document.getElementById(\"categoria\").value;\n");
      out.write("               var cant = document.getElementById(\"cant\").value;\n");
      out.write("               var precio = document.getElementById(\"precio\").value;\n");
      out.write("               if(cod.length!== 0  && \n");
      out.write("                  nom.length!==0 && \n");
      out.write("                  descrip.length!== 0 && \n");
      out.write("                  categoria.length!== 0 && \n");
      out.write("                  cant.length!== 0 && \n");
      out.write("                  precio.length!== 0){\n");
      out.write("                    \n");
      out.write("                     return true;\n");
      out.write("               }\n");
      out.write("               else{\n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("                   //Validar que los campos no esten vacíos\n");
      out.write("                  alert(\" Error : Complete todos los campos\");\n");
      out.write("                  if(cod.length===0){\n");
      out.write("                      \n");
      out.write("                      //rut.focus();\n");
      out.write("                      return false;\n");
      out.write("                      \n");
      out.write("                  }\n");
      out.write("                  \n");
      out.write("                  if(nom.length === 0){\n");
      out.write("                      \n");
      out.write("                      //nom.focus();\n");
      out.write("                      return false;\n");
      out.write("                  }\n");
      out.write("                  if(descrip.length === 0){\n");
      out.write("                      \n");
      out.write("                      //nom.focus();\n");
      out.write("                      return false;\n");
      out.write("                  }\n");
      out.write("                  if(categoria.length === 0){\n");
      out.write("                      \n");
      out.write("                      //nom.focus();\n");
      out.write("                      return false;\n");
      out.write("                  }\n");
      out.write("                  if(cant.length === 0){\n");
      out.write("                      \n");
      out.write("                      //nom.focus();\n");
      out.write("                      return false;\n");
      out.write("                  }\n");
      out.write("                  if(precio.length === 0){\n");
      out.write("                      \n");
      out.write("                      //nom.focus();\n");
      out.write("                      return false;\n");
      out.write("                  }\n");
      out.write("                  \n");
      out.write("                   \n");
      out.write("               }\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Plantilla Agregar Producto</h1>\n");
      out.write("        <form method=\"get\" onsubmit = \"return validacion();\"  >\n");
      out.write("           Codigo Producto : <input type=\"text\" name=\"r_codigo\" id =\"cod\" value=\"\" /><br />\n");
      out.write("           Nombre Producto :<input type=\"text\" name=\"r_nombre\" id=\"nom\"  value=\"\" /><br />\n");
      out.write("           Descripcion Producto :<input type=\"text\" name=\"r_descrip\" id=\"descrip\"  value=\"\" /><br />\n");
      out.write("           Categoría Producto :<input type=\"text\" name=\"r_categoria\" id=\"categoria\"  value=\"\" /><br />\n");
      out.write("           Cantidad Producto :<input type=\"text\" name=\"r_cant\" id=\"cant\"  value=\"\" /><br />\n");
      out.write("           Precio Producto :<input type=\"text\" name=\"r_precio\" id=\"precio\"  value=\"\" /><br />\n");
      out.write("           <input type=\"submit\" name=\"r_submit\" value=\"Finalizar\" /><br />\n");
      out.write("\n");
      out.write("           \n");
      out.write("       \n");
      out.write("    </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
