<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Cursos</title>
    </head>
    <body>
        <h1>Pesquisa de Cursos</h1>
        <table border=1>
            <tr>
                <th>Codigo Curso</th>
                <th>Nome Curso</th>
                <th colspan="2">Açao</th>
            </tr>
            <c:forEach items="${cursos}" var="curso">
                <tr>
                    <td><c:out value="${curso.idCurso}" /></td>
                    <td><c:out value="${curso.curso}" /></td>
                    <td><a href="ManterCursoController?acao=prepararOperacao&operacao=editar&codCurso=<c:out value="${curso.idCurso}"/>">Editar</a></td>
                    <td><a href="ManterCursoController?acao=prepararOperacao&operacao=excluir&codCurso=<c:out value="${curso.idCurso}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterCursoController?acao=prepararOperacao&operacao=incluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
