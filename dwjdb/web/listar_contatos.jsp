<%@ page import="java.sql.*" %> 
<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" /> 
<jsp:useBean id="agenda" scope="page" class="database.Agenda" /> 

<html> 
<head> 
    <title>Agenda</title> 
</head> 

<body> 
    <h2>Contatos cadastrados</h2>  
    <% 
        ResultSet rs;  
        conexao.conectar(); 
        agenda.setConexao(conexao.getConexao());   
        rs = agenda.listar();   
        
        if (rs != null) { 
            out.println("<table>"); 
            out.println("<tr><th>Nome</th><th>Sexo</th><th>Dia Nasc.</th>");
            out.println("    <th>Mês Nasc.</th><th>Telefone</th></tr>"); 
            while (rs.next()) {
                out.print("<tr>"); 
                out.print("<td>" + rs.getString("nome") + "</td>" + 
                          "<td>" + rs.getString("sexo") + "</td>" + 
                          "<td>" + rs.getString("dia_niver") + "</td>" + 
                          "<td>" + rs.getString("mes_niver") + "</td>" + 
                          "<td>" + rs.getString("fone") + "</td>");
                out.print("<td><a href=\"excluir_agenda.jsp?id=" + rs.getString("id") + "\">Excluir</a></td>");
                out.print("<td><a href=\"atualizar_contato.jsp?id=" + rs.getString("id") + 
                          "&nome=" + rs.getString("nome").replace(' ', '+') + 
                          "&sexo=" + rs.getString("sexo") + 
                          "&dia_niver=" + rs.getString("dia_niver") + 
                          "&mes_niver=" + rs.getString("mes_niver") + 
                          "&fone=" + rs.getString("fone").replace(' ', '+') +
                          "\">Alterar</a></td>");
                out.print("</tr>");
            }
            out.println("</table>"); 
        } else {
            out.println("<h3>Erro ao tentar listar contatos!</h3>"); 
        }
        conexao.fechar();    
    %>
</body> 
</html>
