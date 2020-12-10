<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conversão</title>
    </head>
    <body>
        <form action="converter.jsp" method="get" >
            Tipo de conversão:
            <select name="tipo" id="tipo" onChange="update()">
                <option value="">selecione o tipo</option>
                <option value="comprimento">Comprimento</option>
                <option value="massa">Massa</option>
                <option value="temperatura">Temperatura</option>
            </select> <br>
            
            Valor <input type="text" name="valor"> <br>
            
            Unidade atual:
            <select name="medida1" id="medida1"></select> <br>
            
            Converter para:
            <select name="medida2" id="medida2"></select> <br> <br>
            
            <input type="submit" value="Fazer Conversão">
        </form>
        
        <script type="text/javascript">
            function update() {
                let select = document.getElementById('tipo');
                let item = select.options[select.selectedIndex].value;
                let medida1 = document.getElementById('medida1');
                let medida2 = document.getElementById('medida2');
                
                medida1.options.length = 0;
                medida2.options.length = 0;
                
                console.log(item);

                let op = "";
                if (item === "comprimento") {
                    op = {
                        quilometro: 'Quilometro',
                        metro: 'Metro',
                        centimentro: 'Centimentro',
                        milimetro: 'Milimetro'
                    };
                } else if (item === "massa") {
                    op = {
                        tonelada: 'Tonelada',
                        quilograma: 'Quilograma',
                        grama: 'Grama',
                        miligrama: 'Miligrama'
                    };
                } else if (item === "temperatura") {
                    op = {
                        celsius: 'Celsius',
                        fahrenheit: 'Fahrenheit',
                        kelvin: 'Kelvin'
                    };
                } else {
                    medida1.options.length = 0;
                    medida2.options.length = 0;
                }
                
                console.log(op);
                
                for(o in op) {
                    medida1.options[medida1.options.length] = new Option(op[o], o);
                }
                
                for(o in op) {
                    medida2.options[medida2.options.length] = new Option(op[o], o);
                }
            }
        </script>
    </body>
</html>
