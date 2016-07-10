<%-- 
    Document   : pesquisaEdital
    Created on : 05/11/2015, 10:57:13
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Editais</title>
    </head>
    <body>
        <h1>Pesquisa de Editais</h1>
        <table border=1>
            <tr>
                <th>Codigo Edital</th>
                <th>Numero Edital</th>
                <th colspan="2">Açao</th>
            </tr>
            <c:forEach items="${editais}" var="edital">
                <tr>
                    <td><c:out value="${edital.codEdital}" /></td>
                    <td><c:out value="${edital.numero}" /></td>
                    <td><a href="ManterEditalController?acao=prepararOperacao&operacao=editar&codEdital=<c:out value="${edital.codEdital}"/>">Editar</td>
                    <td><a href="ManterEditalController?acao=prepararOperacao&operacao=excluir&codEdital=<c:out value="${edital.codEdital}"/>">Excluir</td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterEditalController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
