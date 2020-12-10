<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="editora" scope="page" class="database.Editora" /> 

<%
    String nomeuser = (String) session.getAttribute("nome");
    if (nomeuser == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<% 
    String nome = request.getParameter("nome");
    String cidade = request.getParameter("cidade");

    conexao.conectar();
    editora.setConexao(conexao.getConexao()); 
    
    if (editora.adicionar(nome, cidade))
        out.println("<h2>Editora cadastrado com sucesso!</h2>");
    else 
        out.println("<h3>Erro ao tentar cadastrar editora!</h3>");

    conexao.fechar();  
%>

<jsp:include page="footer.jsp"/>