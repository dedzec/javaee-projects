<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="editora" scope="page" class="database.Editora" /> 

<%
    String nome = (String) session.getAttribute("nome");
    if (nome == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<h3>Cadastrar nova editora</h3>
<form action="cadastrar_editora.jsp" method="post">
    <div class="container">
        <div>
            <label for="nome"><b>Nome da editora</b></label>
            <input type="text" placeholder="Digite aqui" name="nome" required>
        </div>
        
        <div>
            <label for="cidade"><b>Cidade</b></label>
            <input type="text" placeholder="Digite aqui" name="cidade" required>
        </div>
        <button type="submit">Cadastrar</button>
    </div>
</form>

<h3>Editras</h3>
<% 
    ResultSet rs;
    conexao.conectar(); 
    editora.setConexao(conexao.getConexao());

    rs = editora.listar();

    if (rs != null) { 
        out.println("<table>"); 
        out.println("<tr>" +
                    "<th>Nome</th>" +
                    "<th>Cidade</th>" +
                    "</tr>"); 
        while (rs.next()) {
            out.print("<tr>"); 
            out.print("<td>" + rs.getString("nome") + "</td>" + 
                      "<td>" + rs.getString("cidade") + "</td>");
            out.print("</tr>");
        }
        out.println("</table>"); 
    } else {
        out.println("<h3>Erro ao tentar listar editoras!</h3>"); 
    }
    conexao.fechar();    
%>
<jsp:include page="footer.jsp"/>