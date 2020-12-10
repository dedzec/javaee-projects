<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <form action="resultado.jsp" method="get">
            Nome: <input type="text" name="nome"> <br>
            idade: <input type="text" name="idade"> <br>
            peso: <input type="text" name="peso"> <br>
            altura: <input type="text" name="altura"> <br>
            Sexo: <input type="radio" name="sexo" value="F">Feminino
                  <input type="radio" name="sexo" value="M">Masculino <br>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
