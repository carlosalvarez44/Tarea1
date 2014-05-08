<%-- 
    Document   : index
    Created on : 02-05-2014, 04:33:57 PM
    Author     : Carlos Matias
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Usuario</title>
  <%--      <embed src="song.mp3" autostart="true" style="width: 0; height: 0" /> --%>
    </head>
    <body BACKGROUND="bob.jpg" BGPROPERTIES="FIXED">
        
        <span style="color:#FFFFFF">
        <h1 align="center">Login Usuario</h1>
        
        <form method="GET"> 
            <TABLE border="1" align="center" BGCOLOR="#000000" >
                
                <tbody>
                
                    <tr>
                        <td align="center"> Usuario </td>
                        <td ><input type="text" name="r_nombre" value="" /> </td>
                    </tr>
                    <tr>
                        <td >Password</td>
                        <td > <input type="password" name="r_clave" value="" /></td>
                    </tr>
                    <tr  ALIGN="CENTER">
                        <td colspan="2" ><input type="submit" name="r_submit" value="Enviar" /> </td>
                    </tr>
                
                </tbody>
            </TABLE>
        </form>
        
    </body>
</html>
