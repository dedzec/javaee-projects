<%-- 
    Document   : escola_historio
    Created on : 18/05/2020, 01:35:29
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Histórico Escolar</title>
    </head>
    <body>
        <%  String situacao;
            char sexo;
            float nota1, nota2;
    
            if (request.getParameter("sexo") != null)
                sexo = request.getParameter("sexo").charAt(0);
            else sexo = ' ';
            
                nota1 = Float.parseFloat(request.getParameter("nota1").replace(',', '.'));
                nota2 = Float.parseFloat(request.getParameter("nota2").replace(',', '.'));
                
                if ((nota1 + nota2) / 2 >= 7) {
                    if (sexo == 'F')
                        situacao = "Aprovada"; 
                    else 
                        situacao = "Aprovado";
                } else {
                    if (sexo == 'F')
                        situacao = "Reprovada";
                    else
                        situacao = "Reprovado";
            }
        %>
        
        <h2>Histórico Escolar</h2>     
        <p>Nome: <%= request.getParameter("nome") %></p>    
        <p>Média: <%= (nota1 + nota2) / 2 %></p> 
        <p>Situação: <%= situacao %></p> 
    </body>
</html>
