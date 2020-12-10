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

<% 
    String id = request.getParameter("id"); 
    String titulo = request.getParameter("titulo"); 
    String autor = request.getParameter("autor"); 
    String ano = request.getParameter("ano"); 
    String preco = request.getParameter("preco");
    String idEditora = request.getParameter("editora");
%> 
    
<h3>Atualizar livro</h3>
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
                    if (rs.getString("id").equals(idEditora))
                        out.print("<option value='" + rs.getString("id") + "' selected='selected'>" + rs.getString("nome") + "</option>"); 
                    else
                        out.print("<option value='" + rs.getString("id") + "'>" + rs.getString("nome") + "</option>"); 
                }
            } else {
                out.println("<h3>Erro ao tentar listar Editoras!</h3>"); 
            }
        %>
    </select>

    <div>
        <label for="titulo"><b>Titulo do livro</b></label>
        <input type="text" placeholder="Digite aqui" name="titulo" value="<%= titulo %>" required>
    </div>

    <div>
        <label for="autor"><b>Autor</b></label>
        <input type="text" placeholder="Digite aqui" name="autor" value="<%= autor %>" required>
    </div>

    <div>
        <label for="ano"><b>Ano do livro</b></label>
        <input type="text" placeholder="Digite aqui" name="ano" value="<%= ano %>" required>
    </div>

    <div>
        <label for="preco"><b>Preço</b></label>
        <input type="text" placeholder="Digite aqui" name="preco" value="<%= preco %>" required>
    </div>
    
    <input type="hidden" name="id" value="<%= id %>"> 
    <button type="submit">Atualizar</button>
  </div>
</form>
    
<jsp:include page="footer.jsp"/>