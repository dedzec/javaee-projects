<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="usuario" scope="page" class="database.Usuario" /> 
<%@page import="javax.servlet.http.*" %>

<jsp:include page="header.jsp"/>
        
<%
    String nome = request.getParameter("nome");      
    String senha = request.getParameter("senha");    

    conexao.conectar();      

    usuario.setConexao(conexao.getConexao());

    int resultado = usuario.autenticar(nome, senha);

    if (resultado == 0) {         
        out.println("<h2>Nome de usuário e/ou senha inválidos</h2>");  
    } else if (resultado == 1) {
        HttpSession sessao = request.getSession();  
        sessao.setAttribute("nome", usuario.getNome());
        response.sendRedirect("index.jsp");
    } else {
        out.println("<h2>Erro ao registrar usuário.</h2>");         
    }

    conexao.fechar();      
%>
        

<jsp:include page="footer.jsp"/>