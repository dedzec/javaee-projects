<%-- 
    Document   : condicionais
    Created on : 18/05/2020, 01:22:31
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
            int num = 30;
            if (num < 0) {
                out.println("Número negativo");
            } else {
                out.println("Número positivo");
            }
            
            int num_dias = num;
            switch (num_dias) {
                case 28:
                case 29:
                    out.println("fevereiro");
                    break;
                case 30:
                    out.println("abril, junho, setembro, novembro");
                    break;
                case 31:
                    out.println("janeiro, março, maio, julho, ");
                    out.println("agosto, outubro, dezembro");
                    break;
                default:
                    out.println("Número de dias inválido!");
            }
        %>
    </body>
</html>
