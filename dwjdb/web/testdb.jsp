 <jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" /> 
 <html> 
 <head>
     <title>Conexão com Banco de Dados</title>
 </head>
 
 <body>
     <h2>Conexão com banco de dados</h2>
     <%
        if (conexao.conectar()) {
            out.println("<p>Conexão efetuada!</p>");
            conexao.fechar();
        } else {
            out.println("<p>Falha na conexão!</p>");
        }
     %> 
 </body>
 </html>