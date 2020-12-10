<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" /> 
<jsp:useBean id="agenda" scope="page" class="database.Agenda" /> 

<html> 
<head> 
    <title>Agenda</title> 
</head> 

<body> 
    <% 
        int id = Integer.parseInt(request.getParameter("id")); 
        String nome = request.getParameter("nome"); 
        char sexo = request.getParameter("sexo").charAt(0); 
        int dia_niver = Integer.parseInt(request.getParameter("dia_niver")); 
        int mes_niver = Integer.parseInt(request.getParameter("mes_niver")); 
        String fone = request.getParameter("fone");
        
        conexao.conectar(); 
        agenda.setConexao(conexao.getConexao()); 
    
        if (agenda.atualizar(id, nome, sexo, dia_niver, mes_niver, fone))
            out.println("<h2>Contato atualizado com sucesso!</h2>"); 
        else 
            out.println("<h3>Erro ao tentar atualizar contato!</h3>");      
        
        conexao.fechar();  
    %>     
    
    <a href="listar_contatos.jsp">Voltar</a>  
</body> 
</html>