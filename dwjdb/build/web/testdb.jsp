 <jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" /> 
 <html> 
 <head>
     <title>Conex�o com Banco de Dados</title>
 </head>
 
 <body>
     <h2>Conex�o com banco de dados</h2>
     <%
        if (conexao.conectar()) {
            out.println("<p>Conex�o efetuada!</p>");
            conexao.fechar();
        } else {
            out.println("<p>Falha na conex�o!</p>");
        }
     %> 
 </body>
 </html>