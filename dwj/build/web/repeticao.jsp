<%-- 
    Document   : repeticao
    Created on : 18/05/2020, 01:23:54
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            for (int i = 1; i <= 10; i++){
                out.println("5 x " + i + " = " + 5 * i);
            }
            
            int i = 1;
            while (i <= 10) {
                out.println("5 x " + i + " = " + 5 * i);
                i++;
            }
            
            int j = 1;
            do {
                out.println("5 x " + j + " = " + 5 * j);
                j++;
            }  while (j <= 10);
        %>
    </body>
</html>
