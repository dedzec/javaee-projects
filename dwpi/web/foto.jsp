<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String id = request.getParameter("id"); 
    String titulo = request.getParameter("titulo"); 

    HttpSession sessao = request.getSession();  
    sessao.setAttribute("foto", id);
%> 

<jsp:include page="header.jsp"/></html>

<h3>Adicionar Foto do Livro - <%= titulo %></h3>

<form action="upload_foto.jsp" method="post" enctype="multipart/form-data">
    <div>
        <label for="file">Selecione o Arquivo</label>
        <input id="file" type="file" name="file" size="30"/><br/>            
    </div>

    <button type="submit">Alterar</button>
</form>

<jsp:include page="footer.jsp"/>