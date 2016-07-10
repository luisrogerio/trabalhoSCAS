<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Candidato</title>
    </head>
    <body>
        <h1>Manter Candidato - ${operacao}</h1>

        <form action="ManterCandidatoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterCandidato" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código do Candidato:</td> 
                    <td><input type="number" name="txtCodCandidato" value="${candidato.idCandidato}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Candidato:</td> 
                    <td><input type="text" name="txtNomeCandidato" value="${candidato.nome}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nascimento:</td> 
                    <td><input type="text" name="txtNascimento" value="${candidato.nascimento}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>  
                <tr>
                    <td>Endereco:</td> 
                    <td><input type="text" name="txtEndereco" value="${candidato.logradouro}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                
                <tr>
                    <td>Cidade:</td> 
                    <td><input type="text" name="txtCidade" value="${candidato.cidade}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                
                <tr>
                    <td>Estado:</td> 
                    <td><input type="text" name="txtEstado" value="${candidato.estado}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="number" name="txtMatricula" value="${candidato.matricula}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                             
                <tr>
                    <td>Curso:</td>
                    <td>
                        <select name="optCurso" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${candidato.curso.idCurso == null}"> selected</c:if>> </option>  
                            <c:forEach items="${cursos}" var="curso">
                                <option value="${curso.idCurso}" <c:if test="${candidato.curso.idCurso == curso.idCurso}"> selected</c:if>>${curso.curso}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>              
                
                <tr>
                    <td>Formulario:</td>
                    <td>
                        <select name="optForm" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${candidato.form.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${formulariosSocioEconomicos}" var="formularioSocioEconomico">
                                <option value="${formularioSocioEconomico.id}" <c:if test="${candidato.form.id == formularioSocioEconomico.id}"> selected</c:if>>${formularioSocioEconomico.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                
                
                
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
        <SCRIPT language="JavaScript">
            <!--
            
            function campoNumerico(valor)
            {
                var caracteresValidos = "0123456789";
                var ehNumero = true;
                var umCaracter;
                for (i = 0; i < valor.length && ehNumero == true; i++) 
                { 
                    umCaracter = valor.charAt(i); 
                    if (caracteresValidos.indexOf(umCaracter) == -1) 
                    {
                        ehNumero = false;
                    }
                }
                return ehNumero;
            }

            function validarFormulario(form) { 
                var mensagem;
                mensagem = "";
                if (form.txtCodCandidato.value == ""){
                    mensagem = mensagem + "Informe o Código do Candidato\n";
                }                             
                if (form.txtNomeCandidato.value == ""){
                    mensagem = mensagem + "Informe o Nome do Candidato\n";
                }             
                if (form.txtNascimento.value == ""){
                    mensagem = mensagem + "Informe o nasicmento do Candidato\n";
                }                  
                if (form.txtCurso.value == ""){
                    mensagem = mensagem + "Informe o Curso do Candidato\n";
                }                  
                if (!campoNumerico(form.txtCodCandidato.value)){
                    mensagem = mensagem + "Código do Candidato deve ser numérico\n";
                } 
                  
                          
                             
                if (mensagem == ""){
                    return true;
                }else{
                    alert(mensagem);
                    return false;
                }                
            } 
            //-->
        </SCRIPT>        
    </body>
</html>

