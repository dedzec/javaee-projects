<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 

<%
    String nome = (String) session.getAttribute("nome");
    if (nome == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<% 
    int ano = 0, idEditora = 0, id = 0;
    float preco = 0;
    String idString = request.getParameter("id");
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    String anoString = request.getParameter("ano");
    String precoString = request.getParameter("preco");
    String idEditoraString = request.getParameter("editora");
    
    if (anoString != null) 
        ano = Integer.parseInt(anoString);
    if (precoString != null)
        preco = Float.parseFloat(precoString.replace(',', '.'));
    if (idEditoraString != null) 
        idEditora = Integer.parseInt(idEditoraString);
      
    conexao.conectar();
    livro.setConexao(conexao.getConexao()); 
    
    if (idString != null) {
        id = Integer.parseInt(idString);
        if (livro.alterar(id, titulo, autor, ano, preco, idEditora))
            out.println("<h2>Livro cadastrado com sucesso!</h2>");
        else 
            out.println("<h3>Erro ao tentar cadastrar livro!</h3>");
    } else
        if (livro.adicionar(titulo, autor, ano, preco, idEditora))
            out.println("<h2>Livro cadastrado com sucesso!</h2>");
        else 
            out.println("<h3>Erro ao tentar cadastrar livro!</h3>");
    
    conexao.fechar();  
%>

<jsp:include page="footer.jsp"/>