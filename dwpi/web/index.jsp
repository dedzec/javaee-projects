<%@page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 

<jsp:include page="header.jsp"/>
            
<h1 class="main-title">Livraria Noite</h1>

<form action="index.jsp" method="get">
    <div class="container">
        <input type="text" placeholder="Pesquise o titulo do livro" name="titulo" required>
        <button type="submit">Pesquisar</button>
    </div>
</form>
<h3>Livros</h3>
<% 
    ResultSet rs;
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
            out.print("</tr>");
        }
        out.println("</table>"); 
    } else {
        out.println("<h3>Erro ao tentar listar livros!</h3>"); 
    }
    conexao.fechar();    
%>

<jsp:include page="footer.jsp"/>
