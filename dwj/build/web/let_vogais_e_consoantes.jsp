<%-- 
    Document   : let_vogais_e_consoantes
    Created on : 18/05/2020, 01:46:02
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vogais e consoantes</title>
    </head>
    <body>
        <%  String nome;
            int vogais = 0, consoantes = 0;
           
            nome = request.getParameter("nome").toUpperCase();
            
            for (int i=0; i < nome.length(); i++) {
                switch (nome.charAt(i)) {
                    case 'A':
                    case 'E':
                    case 'I':
                    case 'O':
                    case 'U':
                        vogais++;
                        break;
                    case ' ':
                        break; 
                    default:
                        consoantes++;
                }
            } 
        %>
        
        <h2>Seu nome</h2>
        <p>Qtde. de caracteres: <%= nome.length() %></p>
        <p>Qtde. de vogais: <%= vogais %></p>
        <p>Qtde. de consoantes: <%= consoantes %></p>
    </body>
</html>
