<%-- 
    Document   : pesquisaBolsistaContemplado
    Created on : 15/02/2016, 11:33:50
    Author     : Lucas Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Bolsista</title>
    </head>
    <body>
        <h1>Pesquisa de Bolsista</h1>
        <table border=1>
            <tr>
                <th>Codigo Bolsista</th>
                <th colspan="2">Ação</th>
            </tr>
            <c:forEach items="${bolsistaContemplado}" var="bolsistaContemplado">
                <tr>
                    <td><c:out value="${bolsistaContemplado.id}" /></td>
                    
                    <td><a href="ManterBolsistaContempladoController?acao=prepararOperacao&operacao=editar&id=<c:out value="${bolsistaContemplado.id}"/>">Editar</a></td>
                    <td><a href="ManterBolsistaContempladoController?acao=prepararOperacao&operacao=excluir&id=<c:out value="${bolsistaContemplado.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterBolsistaContempladoController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
