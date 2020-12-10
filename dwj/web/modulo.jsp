<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html> 
<head> 
    <title>Pagina JSP</title> 
</head> 
<body> 
   <% 
       for( int contador = 0; contador < 5; contador = contador + 2 ){ 
   %> 
       <%= contador %> 
   <% 
    } 
   %> 
</body> 
</html> 