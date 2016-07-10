<%-- 
    Document   : pesquisaFormularioSocioEconomico
    Created on : 17/11/2015, 09:30:02
    Author     : Aluno
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Formulario Socio Economico</title>
    </head>
    <body>
        <h1>Pesquisa Formulario Socio Economico</h1>
        <table border=1>
            <tr>
                <th>Codigo Formulario</th>
                <th>Nome Formulario</th>
                <th colspan="2">Açao</th>
            </tr>
            <c:forEach items="${formulariosSocioEconomico}" var="formularioSocioEconomico">
                <tr>
                    <td><c:out value="${formularioSocioEconomico.id}" /></td>
                    <td><c:out value="${formularioSocioEconomico.nome}" /></td>
                    <td><a href="ManterFormularioSocioEconomicoController?acao=prepararOperacao&operacao=editar&id=<c:out value="${formularioSocioEconomico.id}"/>">Editar</td>
                    <td><a href="ManterFormularioSocioEconomicoController?acao=prepararOperacao&operacao=excluir&id=<c:out value="${formularioSocioEconomico.id}"/>">Excluir</td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterFormularioSocioEconomicoController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
