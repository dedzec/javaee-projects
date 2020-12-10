<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id="conexao" scope="page" class="database.Conexao" /> 
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    String nomeuser = (String) session.getAttribute("nome");
    if (nomeuser == "")
        response.sendRedirect("index.jsp");
%>

<jsp:include page="header.jsp"/></html>

<%
   File file ;
   int id = 0;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   
   // id do Livro
   String foto = (String) session.getAttribute("foto");
   id = Integer.parseInt(foto);
   
   String path = this.getServletContext().getRealPath(""); 
   String filePath = path +  "\\assets\\";
  
   // Verifique o tipo de conteúdo
   String contentType = request.getContentType();

   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // tamanho máximo que será armazenado na memória
      factory.setSizeThreshold(maxMemSize);
      
      // Local para salvar dados maiores que maxMemSize.
      factory.setRepository(new File("c:\\Temp"));

      // Crie um novo manipulador de upload de arquivo
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // tamanho máximo do arquivo a ser carregado.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Analise a solicitação para obter itens de arquivo.
         List fileItems = upload.parseRequest(request);

         // Processa os itens do arquivo carregado
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Obtenha os parâmetros do arquivo carregado
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Grava o arquivo
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               String pathFile = "http://localhost:8084/dwpi/assets/" + fileName;
               
               conexao.conectar();
               livro.setConexao(conexao.getConexao()); 
               
               if (livro.alterar_foto(id, pathFile)) {
                    out.println("<h2>Foto atualizada com sucesso!</h2>");
                    session.setAttribute("foto", "");
               } else 
                    out.println("<h3>Erro ao tentar atualizar foto!</h3>");
               
               conexao.fechar(); 
            }
         }
      } catch(Exception ex) {
         System.out.println(ex);
         out.println("<h3>Erro ao tentar atualizar foto!</h3>");
      }
   } else {
      out.println("<p>Nenhum arquivo enviado</p>"); 
   }
%>
<jsp:include page="footer.jsp"/>