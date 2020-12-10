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
    int id = Integer.parseInt(request.getParameter("id"));

    conexao.conectar();
    livro.setConexao(conexao.getConexao());

    if (livro.excluir(id))  
        out.println("<h2>Livro excluído com sucesso!</h2>");  
    else  
        out.println("<h3>Erro ao tentar excluir livro!</h3>");

    conexao.fechar();  
%>  

<jsp:include page="footer.jsp"/>