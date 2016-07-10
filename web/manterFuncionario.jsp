<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Funcionario</title>
    </head>
    <body>
        <h1>Manter Funcionario - ${operacao}</h1>

        <form action="ManterFuncionarioController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterFuncionario" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código do Funcionario:</td> 
                    <td><input type="namber" name="txtCodFuncionario" value="${funcionario.idFuncionario}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Funcionario:</td> 
                    <td><input type="text" name="txtNomeFuncionario" value="${funcionario.nome}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nascimento:</td> 
                    <td><input type="number" name="txtNascimento" value="${funcionario.nascimento}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr> 
                <tr>
                    <td>Setor:</td> 
                    <td><input type="text" name="txtSetor" value="${funcionario.setor}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>  
                
                <tr>
                    <td>Login:</td> 
                    <td><input type="text" name="txtLogin" value="${funcionario.login}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha:</td> 
                    <td><input type="text" name="txtSenha" value="${funcionario.senha}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Confirmar Senha:</td> 
                    <td><input type="text" name="txtSenha" value="${funcionario.senha}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                      
                
                       <tr>
                    <td>Gerente:</td> 
                    <td><input type="text" name="txtGerente" value="${funcionario.gerente}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Endereco:</td> 
                    <td><input type="text" name="txtEndereco" value="${funcionario.logradouro}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                 <tr>
                    <td>Cidade:</td> 
                    <td><input type="text" name="txtCidade" value="${funcionario.cidade}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Estado:</td> 
                    <td><input type="text" name="txtEstado" value="${funcionario.estado}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="number" name="txtMatricula" value="${funcionario.matricula}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form> 
    </body>
</html>
