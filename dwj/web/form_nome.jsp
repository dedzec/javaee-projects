<%-- 
    Document   : nome
    Created on : 18/05/2020, 01:20:28
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seu nome</title>
    </head>
    <body>
        <%  String nome_completo, pronome;
            char sexo;
            nome_completo = request.getParameter("nome") + " " +
                            request.getParameter("sobre");
            if (request.getParameter("sexo") != null)
                sexo = request.getParameter("sexo").charAt(0);
            else
                sexo = ' ';
            if (sexo == 'F')
                pronome = "Sra. ";
            else
            if (sexo == 'M')
                pronome = "Sr. ";
            else
                pronome = ""; 
        %>
        
        <p>Olá, <%= pronome + nome_completo + "!" %></p> 
    </body>
</html>
