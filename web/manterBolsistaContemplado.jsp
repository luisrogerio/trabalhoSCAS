<%-- 
    Document   : manterBolsistaContemplado
    Created on : 15/02/2016, 11:34:26
    Author     : Lucas Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bolsista Contemplado</title>
    </head>
    <body>
        <h1>Bolsista Contemplado - ${operacao}</h1>

        <form action="ManterBolsistaContempladoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterBolsistaContemplado" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código do Bolsista Contemplado:</td> 
                    <td><input type="number" name="txtid" value="${bolsistacontemplado.id}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                    </tr>


                    <tr>
                        <td>Edital:</td>
                        <td>
                            <select name="optEdital" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${bolsistacontemplado.edital.codEdital == null}"> selected</c:if>> </option>  
                            <c:forEach items="${editais}" var="edital">
                                <option value="${edital.codEdital}" <c:if test="${bolsistacontemplado.edital.codEdital == edital.codEdital}"> selected</c:if>>${edital.tipoBolsa}</option>  
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
                if (form.txtCodBolsa.value == "") {
                    mensagem = mensagem + "Informe o Código da Bolsa\n";
                }
                if (form.txtNomeBolsa.value == "") {
                    mensagem = mensagem + "Informe o Nome da Bolsa\n";
                }
                if (form.txtDescricao.value == "") {
                    mensagem = mensagem + "Informe a Descricao/Carencia da Bolsa\n";
                }
                if (form.txtTipoBolsa.value == "") {
                    mensagem = mensagem + "Informe o Tipo da Bolsa\n";
                }
                if (!campoNumerico(form.txtCodCurso.value)) {
                    mensagem = mensagem + "Código do Curso deve ser numérico\n";
                }


                if (mensagem == "") {
                    return true;
                } else {
                    alert(mensagem);
                    return false;
                }
            }
            //-->
        </SCRIPT>        
    </body>
</html>
