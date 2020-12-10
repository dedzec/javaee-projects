<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="usuario" scope="page" class="database.Usuario" /> 

<%
    String nome = (String) session.getAttribute("nome");
    if (nome == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<h3>Cadastrar usuário</h3>
<form action="cadastrar_usuario.jsp" method="post">
    <div class="container">
        <div>
            <label for="nome"><b>Nome</b></label>
            <input type="text" placeholder="Digite aqui" name="nome" required>
        </div>
        
        <div>
            <label for="senha"><b>Senha</b></label>
            <input type="password" placeholder="Digite aqui" name="senha" required>
        </div>
        <button type="submit">Cadastrar</button>
    </div>
</form>

<h3>Editras</h3>
<% 
    ResultSet rs;
    conexao.conectar(); 
    usuario.setConexao(conexao.getConexao());

    rs = usuario.listar();

    if (rs != null) { 
        out.println("<table>"); 
        out.println("<tr>" +
                    "<th>Nome</th>" +
                    "</tr>"); 
        while (rs.next()) {
            out.print("<tr>"); 
            out.print("<td>" + rs.getString("nome") + "</td>");
            out.print("</tr>");
        }
        out.println("</table>"); 
    } else {
        out.println("<h3>Erro ao tentar listar usuários!</h3>"); 
    }
    conexao.fechar();    
%>
<jsp:include page="footer.jsp"/>
