<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 
<jsp:useBean id="editora" scope="page" class="database.Editora" /> 

<%
    String nome = (String) session.getAttribute("nome");
    if (nome == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/>

<h3>Cadastrar livro</h3>
<form action="cadastrar_livro.jsp" method="post">
  <div class="container">
    <select name="editora" id="editora" required>
        <option value="">Selecione a editora</option>
        <%
            ResultSet rs;
            conexao.conectar(); 
            editora.setConexao(conexao.getConexao());

            rs = editora.listar();

            if (rs != null) { 
                while (rs.next()) {
                    out.print("<option value='" + rs.getString("id") + "'>" + rs.getString("nome") + "</option>"); 
                }
            } else {
                out.println("<h3>Erro ao tentar listar Editoras!</h3>"); 
            }
        %>
    </select>

    <div>
        <label for="titulo"><b>Titulo do livro</b></label>
        <input type="text" placeholder="Digite aqui" name="titulo" required>
    </div>

    <div>
        <label for="autor"><b>Autor</b></label>
        <input type="text" placeholder="Digite aqui" name="autor" required>
    </div>

    <div>
        <label for="ano"><b>Ano do livro</b></label>
        <input type="text" placeholder="Digite aqui" name="ano" required>
    </div>

    <div>
        <label for="preco"><b>Preço</b></label>
        <input type="text" placeholder="Digite aqui" name="preco" required>
    </div>

    <button type="submit">Cadastrar</button>
  </div>
</form>

<h3>Livros</h3>
<% 
    conexao.conectar(); 
    livro.setConexao(conexao.getConexao());

    String titulo = request.getParameter("titulo");   

    if (titulo != null) 
        rs = livro.pesquisar(titulo);
    else
        rs = livro.listar();

    if (rs != null) { 
        out.println("<table>"); 
        out.println("<tr>" +
                    "<th>Capa</th>" +
                    "<th>Titulo</th>" +
                    "<th>Autor</th>" +
                    "<th>Ano</th>" +
                    "<th>Preço</th>" +
                    "<th>Editora</th>" +
                    "<th>Cidade</th>" +
                    "<th colspan='3'>Opções</th>" +
                    "</tr>"); 
        while (rs.next()) {
            out.print("<tr>"); 
            out.print("<td><img src='" + rs.getString("foto") + "' width='90' height='100'></td>" + 
                      "<td>" + rs.getString("titulo") + "</td>" + 
                      "<td>" + rs.getString("autor") + "</td>" + 
                      "<td>" + rs.getString("ano") + "</td>" + 
                      "<td>" + rs.getString("preco") + "</td>" + 
                      "<td>" + rs.getString("nome") + "</td>" +
                      "<td>" + rs.getString("cidade") + "</td>");

            out.print("<td><a href=\"excluir_livro.jsp?id=" + rs.getString("id") + "\">Excluir</a></td>");
            out.print("<td><a href=\"foto.jsp?id=" + rs.getString("id") + 
                      "&titulo=" + rs.getString("titulo").replace(' ', '+') + 
                      "\">Foto</a></td>");
            out.print("<td><a href=\"atualizar_livro.jsp?id=" + rs.getString("id") + 
                      "&titulo=" + rs.getString("titulo").replace(' ', '+') + 
                      "&autor=" + rs.getString("autor").replace(' ', '+') + 
                      "&ano=" + rs.getString("ano") + 
                      "&preco=" + rs.getString("preco") + 
                      "&editora=" + rs.getString("idEditora").replace(' ', '+') +
                      "\">Alterar</a></td>");
            out.print("</tr>");
        }
        out.println("</table>"); 
    } else {
        out.println("<h3>Erro ao tentar listar livros!</h3>"); 
    }
    conexao.fechar();    
%>

<jsp:include page="footer.jsp"/>