<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" /> 
<jsp:useBean id="agenda" scope="page" class="database.Agenda" />

<html> 
<head>
    <title>Agenda</title> 
</head> 

<body> 
    <% 
        /* armazena os valores dos parâmetros em variáveis */ 
        String nome = request.getParameter("nome");
        char sexo = request.getParameter("sexo").charAt(0);
        int dia_niver = Integer.parseInt(request.getParameter("dia_niver"));
        int mes_niver = Integer.parseInt(request.getParameter("mes_niver"));
        String fone = request.getParameter("fone");
        
        conexao.conectar();
        agenda.setConexao(conexao.getConexao()); 
        
        if (agenda.inserir(nome, sexo, dia_niver, mes_niver, fone))
            out.println("<h2>Contato cadastrado com sucesso!</h2>");
        else 
            out.println("<h3>Erro ao tentar cadastrar contato!</h3>");
        
        conexao.fechar();  
    %>
    <a href="cadastrar_contato.html">Voltar</a>
</body> 
</html>