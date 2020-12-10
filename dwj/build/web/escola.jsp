<%-- 
    Document   : escola
    Created on : 18/05/2020, 01:35:15
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escola</title>
    </head>
    <body>
        <form action="esc_historico.jsp" method="get">
            Nome: <input type="text" name="nome"> <br>
            Sexo: <input type="radio" name="sexo" value="F">Feminino
                  <input type="radio" name="sexo" value="M">Masculino <br>
            Nota 1: <input type="text" name="nota1"> <br>
            Nota 2: <input type="text" name="nota2"> <br>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
