<%-- 
    Document   : pesquisaCandidato
    Created on : 05/11/2015, 11:00:35
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Candidatos</title>
    </head>
    <body>
        <h1>Pesquisa de Candidatos</h1>
        <table border=1>
            <tr>
                <th>Codigo Candidato</th>
                <th>Nome Candidato</th>
                <th colspan="2">Açao</th>
            </tr>
            <c:forEach items="${candidatos}" var="candidatos">
                <tr> 
                    <td><c:out value="${candidatos.idCandidatos}" /></td>
                    <td><c:out value="${candidatos.nome}" /></td>
                    <td><a href="ManterCandidatoController?acao=prepararOperacao&operacao=editar&codCandidato=<c:out value="${candidatos.idCandidatos}"/>">Editar</a></td>
                    <td><a href="ManterCandidatoController?acao=prepararOperacao&operacao=excluir&codCandidato=<c:out value="${candidatos.idCandidatos}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterCandidatoController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
