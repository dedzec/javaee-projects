<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="usuario" scope="page" class="database.Usuario" /> 

<%
    String nomeuser = (String) session.getAttribute("nome");
    if (nomeuser == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<% 
    String nome = request.getParameter("nome");
    String senha = request.getParameter("senha");

    conexao.conectar();
    usuario.setConexao(conexao.getConexao()); 
    
    if (usuario.adicionar(nome, senha))
        out.println("<h2>Usuário cadastrado com sucesso!</h2>");
    else 
        out.println("<h3>Erro ao tentar cadastrar usuário!</h3>");

    conexao.fechar();  
%>

<jsp:include page="footer.jsp"/>