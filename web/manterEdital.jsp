  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Edital</title>
    </head>
    <body>
        <h1>Manter Edital - ${operacao}</h1>

        <form action="ManterEditalController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterEdital" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Codigo do Edital:</td> 
                    <td><input type="number" name="txtCodEdital" value="${edital.codEdital}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Prazo do Edital:</td> 
                    <td><input type="number" name="txtPrazo" value="${edital.prazo}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Edital:</td> 
                    <td><input type="number" name="txtData" value="${edital.data}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Numero Edital:</td> 
                    <td><input type="number" name="txtNumero" value="${edital.numero}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                
                
                
                <tr>
                    <td>Publicação:</td> 
                    <td><input type="text" name="txtPublicacao" value="${edital.publicacao}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
                
                
                <tr>
                    <td>Tipo Bolsa</td>
                    
                    <td>
                        <select name="optTipoBolsa" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="Ensino" <c:if test="${edital.tipoBolsa == 'Ensino'}"> selected</c:if>>Ensino</option>
                            <option value="Extenção" <c:if test="${edital.tipoBolsa == 'Extenção'}"> selected</c:if>>Extenção</option>
                            <option value="Pesquisa" <c:if test="${edital.tipoBolsa == 'Pesquisa'}"> selected</c:if>>Pesquisa</option>
                            <option value="TreinamentoProfissional" <c:if test="${edital.tipoBolsa == 'TreinamentoProfissional'}"> selected</c:if>>Treinamento Profissional</option>
                            
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
                if (form.txtCodEdital.value == ""){
                    mensagem = mensagem + "Informe o Codigo do Edital\n";
                }                             
                if (form.txtPrazo.value == ""){
                    mensagem = mensagem + "Informe o Prazo do Edital\n";
                }             
                if (form.txtData.value == ""){
                    mensagem = mensagem + "Informe a data do Edital\n";
                }                  
                if (form.txtNumero.value == ""){
                    mensagem = mensagem + "Informe o numero do edital\n";
                    
                }   
                if (form.txtPublicacao.value == ""){
                    mensagem = mensagem + "Informe a publicação\n";
                    
                }
                if (form.optTipoBolsa.value == ""){
                    mensagem = mensagem + "Informe o tipo de Bolsa\n";
                    
                }
                       
                if (!campoNumerico(form.txtCodEdital.value)){
                    mensagem = mensagem + "O codigo do Edital deve ser numérico\n";
                } 
                
                if (!campoNumerico(form.txtPrazo.value)){
                    mensagem = mensagem + "O prazo do Edital deve ser numérico\n";
                    
                }  
                if (!campoNumerico(form.txtData.value)){
                    mensagem = mensagem + "A DATA  deve ser numérico\n";
                    
                } 
                
                
                if (!campoNumerico(form.txtNumero.value)){
                    mensagem = mensagem + "O numero do Edital deve ser numérico\n";
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

