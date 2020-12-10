<%-- 
    Document   : index
    Created on : 18/05/2020, 01:06:44
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Hello, World</title>
    </head>
    <body>
        <h2>Página de teste</h2>
        
        <% 
            out.println("<p>"); 
            out.println("Esta é uma página JSP"); 
            out.println("</p>");
            

            out.println("<h2>Primeira página JSP</h2>");
            out.println("<p>Hello, World!</p>");
        %>
    </body>
</html>
