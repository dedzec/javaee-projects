<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 

<jsp:include page="header.jsp"/>
            
<%
    HttpSession sessao = request.getSession();  
    sessao.setAttribute("nome", "");
    response.sendRedirect("index.jsp");
%>

<jsp:include page="footer.jsp"/>