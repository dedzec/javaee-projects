<%-- 
    Document   : tab_exibir
    Created on : 18/05/2020, 01:52:25
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabuada</title>
    </head>
    <body>
        <%  int num, i = 1;
        
            num = Integer.parseInt(request.getParameter("num"));
            
            out.println("<h2>Tabuada do " + num + "</h2>");
            
            while (i <= 10) {
                out.println(num + " x " + i + " = " + num * i + "<br>");
                i++;
            }
        %>
    </body>
</html>
