<%-- 
    Document   : PesquisaFuncionario
    Created on : 17/11/2015, 08:44:24
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Funcionarios</title>
    </head>
    <body>
        <h1>Pesquisa de Funcionarios</h1>
        <table border=1>
            <tr>
                <th>Codigo Funcionario</th>
                <th>Nome Funcionario</th>
                <th colspan="2">Açao</th>
            </tr>
            <c:forEach items="${funcionarios}" var="funcionario">
                <tr> 
                    <td><c:out value="${funcionario.idFuncionario}" /></td>
                    <td><c:out value="${funcionario.nome}" /></td>
                    <td><a href="ManterFuncionarioController?acao=prepararOperacao&operacao=editar&codFuncionario=<c:out value="${funcionario.idFuncionario}"/>">Editar</a></td>
                    <td><a href="ManterFuncionarioController?acao=prepararOperacao&operacao=excluir&codFuncionario=<c:out value="${funcionario.idFuncionario}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterFuncionarioController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>