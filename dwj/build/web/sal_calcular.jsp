<%-- 
    Document   : sal_exibir
    Created on : 18/05/2020, 01:55:17
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salário</title>
    </head>
    <body>
        <h2>Folha de pagamento</h2>
        
        <%  float salbase, grat, desc, salbruto, salliquido;
            DecimalFormat df = new DecimalFormat("R$ 0.00");
            
            salbase = Float.parseFloat(request.getParameter("salbase").replace(',', '.'));
            grat = Float.parseFloat(request.getParameter("grat").replace(',', '.'));
            desc = Float.parseFloat(request.getParameter("desc").replace(',', '.'));
            
            salbruto = salbase + salbase * (grat / 100);
            salliquido = salbruto - salbruto * (desc / 100);
            
            out.println("<p>Salário líquido: " + df.format(salliquido) + "</p>");
        %>
    </body>
</html>
