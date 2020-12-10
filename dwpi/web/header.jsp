<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Livraria</title>
        <style type="text/css"> @import url("style.css"); </style>
    </head>
    <body>
        <header>
            <a id="logo" href="index.jsp">
                <span>Livraria Noite</span>
            </a>

            <nav>
                <ul>
                <%    
                    String nome = (String) session.getAttribute("nome");
                    if (nome != "") {
                        out.println("<form action='sair.jsp' method='post'>");
                        out.println("<li><a href='livro.jsp'>Livros</a></li>");
                        out.println("<li><a href='editora.jsp'>Editoras</a></li>");
                        out.println("<li><a href='usuario.jsp'>Usuários</a></li>");
                        out.println("<li><button type='submit'>Sair</button></li>"); 
                        out.println("</form>");
                    } else {
                        out.println("<form action='login.jsp' method='post'>");
                        out.println("<li><input type='text' placeholder='Digite o nome' name='nome' required></li>"); 
                        out.println("<li><input type='password' placeholder='Digite a senha' name='senha' required></li>"); 
                        out.println("<li><button type='submit'>Acessar</button></li>"); 
                        out.println("</form>");
                    }
                %>
                </ul>
            </nav>
        </header>
        
        <div class="main">
            <div class="main-content">