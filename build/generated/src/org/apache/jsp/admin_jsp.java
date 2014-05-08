package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if(request.getParameter("r_ing_vendedor")!= null){
        
        response.sendRedirect("ing_vendedor.jsp");
        
        
    }
    if(request.getParameter("r_ing_cliente")!= null){
        
        
        response.sendRedirect("ing_cliente.jsp");
        
    }
    if(request.getParameter("r_admin_productos")!= null){
        
        
        response.sendRedirect("admin_produc.jsp");
        
    }
    if(request.getParameter("r_ing_compra")!= null){
        
        
        response.sendRedirect("ing_compra.jsp");
        
    }
    if(request.getParameter("r_ing_venta")!= null){
        
        
        response.sendRedirect("ing_venta.jsp");
        
    }
    if(request.getParameter("r_ventas_cli")!= null){
        
        
        response.sendRedirect("ventas_cli.jsp");
        
    }
    if(request.getParameter("r_cerrar")!= null){
        
        
        response.sendRedirect("cerrar.jsp");
        
    }
    
    
    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1> Bienvenido al Menu Administrador!</h1>\n");
      out.write("        <form method=\"get\" >\n");
      out.write("           Ingresar Vendedor <input type=\"submit\" name=\"r_ing_vendedor\" value=\"ingresar\" /><br />\n");
      out.write("           Ingresar Cliente <input type=\"submit\" name=\"r_ing_cliente\" value=\"ingresar\" /><br />\n");
      out.write("           Administar Productos <input type=\"submit\" name=\"r_admin_productos\" value=\"ingresar\" /><br />\n");
      out.write("           Ingresar Compra <input type=\"submit\" name=\"r_ing_compra\" value=\"ingresar\" /><br />\n");
      out.write("           Ingresar Venta <input type=\"submit\" name=\"r_ing_venta\" value=\"ingresar\" /><br />\n");
      out.write("           Ver ventas a Cliente  <input type=\"submit\" name =\"r_ventas_cli\" value=\"ingresar\"/><br />\n");
      out.write("           Cerrar Sesión  <input type=\"submit\" name =\"r_cerrar\" value=\"Salir\"/><br />\n");
      out.write("        </form>\n");
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
