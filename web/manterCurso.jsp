
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Curso</title>
    </head>
    <body>
        <h1>Manter Curso - ${operacao}</h1>

        <form action="ManterCursoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterCurso" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código do curso:</td> 
                    <td><input type="number" name="txtCodCurso" value="${curso.idCurso}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do curso:</td> 
                    <td><input type="text" name="txtNomeCurso" value="${curso.curso}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Total de períodos:</td> 
                    <td><input type="number" name="txtTotalPeriodos" value="${curso.totalPeriodos}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>                
                <tr> 
                    <td>Turno do Curso:</td> 
                    <td>
                        <select name="optTurnoCurso" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="Manha" <c:if test="${curso.turno == 'Manha'}"> selected</c:if>>Manha</option>
                            <option value="Noite" <c:if test="${curso.turno == 'Noite'}"> selected</c:if>>Noite</option>
                            <option value="Integral" <c:if test="${curso.turno == 'Integral'}"> selected</c:if>>Integral</option>
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
                if (form.txtCodCurso.value == ""){
                    mensagem = mensagem + "Informe o Código do Curso\n";
                }                             
                if (form.txtNomeCurso.value == ""){
                    mensagem = mensagem + "Informe o Nome do Curso\n";
                }             
                if (form.txtTotalPeriodos.value == ""){
                    mensagem = mensagem + "Informe o Total de Períodos\n";
                }                  
                if (form.txtTurno.value == ""){
                    mensagem = mensagem + "Informe o Turno\n";
                }                  
                if (!campoNumerico(form.txtCodCurso.value)){
                    mensagem = mensagem + "Código do Curso deve ser numérico\n";
                }                  
                if (!campoNumerico(form.txtTotalPeriodos.value)){
                    mensagem = mensagem + "Total de Períodos deve ser numérico\n";
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
