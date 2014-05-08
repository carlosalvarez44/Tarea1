<%-- 
    Document   : cerrar
    Created on : 01-05-2014, 02:02:41 PM
    Author     : Enziwow
--%>

<%
    session.removeAttribute("login");
    session.removeAttribute("tipo");
    session.invalidate();
    response.sendRedirect("index.jsp");
        
   
    
    %>
