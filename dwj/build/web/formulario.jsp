<%-- 
    Document   : formulario
    Created on : 18/05/2020, 01:19:04
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário</title>
    </head>
    <body>
        <form action="nome.jsp" method="get">
            Nome: <input type="text" name="nome"> <br>
            Sobrenome: <input type="text" name="sobre"> <br>
            Sexo: <input type="radio" name="sexo" value="F">Feminino
                  <input type="radio" name="sexo" value="M">Masculino <br>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
