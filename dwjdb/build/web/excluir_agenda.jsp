<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="agenda" scope="page" class="database.Agenda" />

<html>
<head> 
    <title>Agenda</title> 
</head> 

<body> 
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        
        conexao.conectar();
        agenda.setConexao(conexao.getConexao());
    
        if (agenda.excluir(id))  
            out.println("<h2>Contato excluído com sucesso!</h2>");  
        else  
            out.println("<h3>Erro ao tentar excluir contato!</h3>");
    
        conexao.fechar();  
    %>  
    <a href="listar_contatos.jsp">Voltar</a> 
</body>
</html>