<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
    </head>
    <body>
        <%  String situacao; 
            float peso, altura, imc;
            char sexo;

            if (request.getParameter("sexo") != null)
                sexo = request.getParameter("sexo").charAt(0);
            else sexo = ' ';
            
                peso = Float.parseFloat(request.getParameter("peso").replace(',', '.'));
                altura = Float.parseFloat(request.getParameter("altura").replace(',', '.'));
                
                imc = peso / (altura * altura);
                
                if (imc >= 40) {
                    situacao = "Obesidade grau 3";
                } else if (imc >= 35 && imc < 40) {
                    situacao = "Obesidade grau 2";
                } else if (imc >= 30 && imc < 35) {
                    situacao = "Obesidade grau 1";
                } else if (imc >= 25 && imc < 30) {
                    situacao = "Sobrepeso";
                } else if (imc >= 18.5 && imc < 25) {
                    situacao = "Peso normal";
                } else {
                    situacao = "Abaixo do peso";
                }
        %>
        
        <h2>Resultado</h2>     
        <p>Nome: <%= request.getParameter("nome") %></p>
        <p>Idade <%= request.getParameter("idade") %></p>
        <p>Peso: <%= request.getParameter("peso") %></p>
        <p>Altura: <%= request.getParameter("altura") %></p>
        <p>IMC: <%= imc %></p> 
        <p>Situação: <%= situacao %></p> 
    </body>
</html>
