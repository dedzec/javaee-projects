<%-- 
    Document   : salario
    Created on : 18/05/2020, 01:55:06
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salário</title>
    </head>
    <body>
        <h2>Folha de pagamento</h2>
        
        <form action="sal_calcular.jsp" method="get">
            Salário base: <input type="text" name="salbase"> <br>
            % gratificação: <input type="text" name="grat"> <br>
            % desconto: <input type="text" name="desc"> <br>
            <input type="submit" value="Calcular Salário">
        </form>
    </body>
</html>
