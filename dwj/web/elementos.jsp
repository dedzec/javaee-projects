<%-- 
    Document   : elementos
    Created on : 18/05/2020, 01:11:32
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Elementos de script</title>
    </head>
    <body>
        <%! int i = 0; %> 
        
        <% 
            int x = 0;
            out.println("<h2>Simulação de contagem de acessos</h2>");
            out.println("<br>");
            i++;
            x++;
        %> 
        
        <p>Você acessou esta página <%= i %> vezes.</p> 
        <p>Valor da variável x: <%= x %>.</p>
    </body>
</html>
