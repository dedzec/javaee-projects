<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1" import="java.sql.*" %>

<%@page language="java" import="conexao.conecta" %>

<%
    String nome = request.getParameter("nome");
    
    try {
        Connection con = conecta.getConnection();
        String sql = "INSERT INTO cadastro(nome) VALUE(?)";
        PreparedStatement stat = con.prepareStatement(sql);
        stat.setString(1, nome);
        stat.execute();
        stat.close();
        con.close();
    } catch(Exception e) {
        out.print("Deu Erro!" + e);
    }
%>