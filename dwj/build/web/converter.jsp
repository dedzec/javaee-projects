<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>resultado</title>
    </head>
    <body>
        <%
            float valor;
            String tipo, medida1, medida2;
            DecimalFormat df = new DecimalFormat("0.00");
            
            tipo = request.getParameter("tipo");
            valor = Float.parseFloat(request.getParameter("valor").replace(',', '.'));
            medida1 = request.getParameter("medida1");
            medida2 = request.getParameter("medida2");
            
            out.println("<p>Tipo de Converão: " + tipo + "</p>");
            out.println("<p>Unidade Atual: " + medida1 + "</p>");
            out.println("<p>Valor: " + valor + "</p>");
            out.println("<p>Unidade Desejada: " + medida2 + "</p>");
            
            if (tipo.equals("comprimento")) {
                if (medida1.equals(medida2))
                  out.println("<p>Valor não foi convertido </p>");
                else
                    if (medida2.equals("quilometro")) {
                        if (medida1.equals("metro")) {
                            out.println("<p>Valor convertido: " + (valor * 1000) + "</p>");
                        } else if (medida1.equals("centimentro")) {
                            out.println("<p>Valor convertido: " + (valor * 100000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 1000000) + "</p>");
                        }
                    }
                    if (medida2.equals("metro")) {
                        if (medida1.equals("quilometro")) {
                            out.println("<p>Valor convertido: " + (valor / 1000) + "</p>");
                        } else if (medida1.equals("centimentro")) {
                            out.println("<p>Valor convertido: " + (valor * 100) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 1000) + "</p>");
                        }
                    }
                    if (medida2.equals("centimentro")) {
                        if (medida1.equals("quilometro")) {
                            out.println("<p>Valor convertido: " + (valor / 100000) + "</p>");
                        } else if (medida1.equals("metro")) {
                            out.println("<p>Valor convertido: " + (valor / 100) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 10) + "</p>");
                        }
                    }
                    if (medida2.equals("milimetro")) {
                        if (medida1.equals("quilometro")) {
                            out.println("<p>Valor convertido: " + (valor / 1000000) + "</p>");
                        } else if (medida1.equals("metro")) {
                            out.println("<p>Valor convertido: " + (valor / 1000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor / 10) + "</p>");
                        }
                    }
            }

            if (tipo.equals("massa")) {
                if (medida1.equals(medida2))
                  out.println("<p>Valor não foi convertido </p>");
                else
                    if (medida2.equals("tonelada")) {
                        if (medida1.equals("quilograma")) {
                            out.println("<p>Valor convertido: " + (valor * 1000) + "</p>");
                        } else if (medida1.equals("grama")) {
                            out.println("<p>Valor convertido: " + (valor * 1000000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 1000000000) + "</p>");
                        }
                    }
                    if (medida2.equals("quilograma")) {
                        if (medida1.equals("tonelada")) {
                            out.println("<p>Valor convertido: " + (valor / 1000) + "</p>");
                        } else if (medida1.equals("grama")) {
                            out.println("<p>Valor convertido: " + (valor * 1000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 1000000) + "</p>");
                        }
                    }
                    if (medida2.equals("grama")) {
                        if (medida1.equals("tonelada")) {
                            out.println("<p>Valor convertido: " + (valor / 1000000) + "</p>");
                        } else if (medida1.equals("quilograma")) {
                            out.println("<p>Valor convertido: " + (valor / 1000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor * 1000) + "</p>");
                        }
                    }
                    if (medida2.equals("miligrama")) {
                        if (medida1.equals("tonelada")) {
                            out.println("<p>Valor convertido: " + (valor / 1000000000) + "</p>");
                        } else if (medida1.equals("quilograma")) {
                            out.println("<p>Valor convertido: " + (valor / 1000000) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (valor / 1000) + "</p>");
                        }
                    }
            }

            if (tipo.equals("temperatura")) {
                if (medida1.equals(medida2))
                  out.println("<p>Valor não foi convertido </p>");
                else
                    if (medida2.equals("celsius")) {
                        if (medida1.equals("fahrenheit")) {
                            out.println("<p>Valor convertido: " + ((valor - 32) / 1.8) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + (273 - valor) + "</p>");
                        }
                    }
                    if (medida2.equals("fahrenheit")) {
                        if (medida1.equals("celsius")) {
                            out.println("<p>Valor convertido: " + (valor * 1.8 + 32) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + ((valor - 32) / 1.8 + 273.15) + "</p>");
                        }
                    }
                    if (medida2.equals("kelvin")) {
                        if (medida1.equals("celsius")) {
                            out.println("<p>Valor convertido: " + (valor + 273) + "</p>");
                        } else {
                            out.println("<p>Valor convertido: " + ((valor - 273) * 1.8 + 32) + "</p>");
                        }
                    }
            }
        %>
        
        
    </body>
</html>
