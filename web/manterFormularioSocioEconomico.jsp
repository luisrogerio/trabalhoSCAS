<%-- 
    Document   : manterEdital
    Created on : 26/11/2015, 10:20:29
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Formulario Socio Economico</title>
    </head>
    <body>
        <h1>Manter Formulario  - ${operacao}</h1>



        <form action="ManterFormularioSocioEconomicoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmFormularioSocioEconomico" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Codigo:</td> 
                    <td><input type="text" name="txtId" value="${formulariosSocioEconomico.id}" <c:if test="${operacao != 'incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome Completo:</td> 
                        <td><input type="text" name="txtNome" value="${formulariosSocioEconomico.nome}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Nascimeto:</td> 
                        <td><input type="number" name="txtNascimento" value="${formulariosSocioEconomico.nascimento}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Sexo</td>

                        <td>
                            <select name="optTipoSexo" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                            <option value="Feminino" <c:if test="${formulariosSocioEconomico.sexo == 'Feminino'}"> selected</c:if>>Feminino</option>
                            <option value="Masculino" <c:if test="${formulariosSocioEconomico.sexo == 'Masculino'}"> selected</c:if>>Masculino</option>


                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Identidade:</td> 
                        <td><input type="number" name="txtrg" value="${formulariosSocioEconomico.rg}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>CPF:</td> 
                        <td><input type="number" name="txtcpf" value="${formulariosSocioEconomico.cpf}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Telefone:</td> 
                        <td><input type="number" name="txttelefone" value="${formulariosSocioEconomico.telefone}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Celular:</td> 
                        <td><input type="number" name="txtcelular" value="${formulariosSocioEconomico.celular}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Email:</td> 
                        <td><input type="text" name="txtemail" value="${formulariosSocioEconomico.email}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    </tr>


                </table>
                
                <h3>Endereço</h3>

            
            <table>

                <tr>
                    <td>Rua:</td> 
                    <td><input type="text" name="txtrua" value="${formulariosSocioEconomico.rua}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    <td>Numero:</td> 
                    <td><input type="number" name="txtnum" value="${formulariosSocioEconomico.numero}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                    <td>Complemento:</td> 
                    <td><input type="text" name="txtcomplemento" value="${formulariosSocioEconomico.complemento}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>

                </tr>


                <tr>
                    <td>Bairro:</td> 
                    <td><input type="text" name="txtbairro" value="${formulariosSocioEconomico.bairro}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>




                <tr>
                    <td>Estado</td>

                    <td>
                        <select name="optTipoEstado" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>

                            <option value="ac"<c:if test="${formulariosSocioEconomico.estado == 'Acre'}"> selected</c:if>>Acre</option> 
                        <option value="al"<c:if test="${formulariosSocioEconomico.estado == 'Alagoas'}"> selected</c:if>>Alagoas</option> 
                        <option value="am"<c:if test="${formulariosSocioEconomico.estado == 'Amazonas'}"> selected</c:if>>Amazonas</option> 
                        <option value="ap"<c:if test="${formulariosSocioEconomico.estado == 'Amapá'}"> selected</c:if>>Amapá</option> 
                        <option value="ba"<c:if test="${formulariosSocioEconomico.estado == 'Bahia'}"> selected</c:if>>Bahia</option> 
                        <option value="ce"<c:if test="${formulariosSocioEconomico.estado == 'Ceará'}"> selected</c:if>>Ceará</option> 
                        <option value="df"<c:if test="${formulariosSocioEconomico.estado == 'Distrito Federal'}"> selected</c:if>>Distrito Federal</option> 
                        <option value="es"<c:if test="${formulariosSocioEconomico.estado == 'Espírito Santo'}"> selected</c:if>>Espírito Santo</option> 
                        <option value="go"<c:if test="${formulariosSocioEconomico.estado == 'Goiás'}"> selected</c:if>>Goiás</option> 
                        <option value="ma"<c:if test="${formulariosSocioEconomico.estado == 'Maranhão'}"> selected</c:if>>Maranhão</option> 
                        <option value="mt"<c:if test="${formulariosSocioEconomico.estado == 'Mato Grosso'}"> selected</c:if>>Mato Grosso</option> 
                        <option value="ms"<c:if test="${formulariosSocioEconomico.estado == 'Mato Grosso do Sul'}"> selected</c:if>>Mato Grosso do Sul</option> 
                        <option value="mg"<c:if test="${formulariosSocioEconomico.estado == 'Minas Gerais'}"> selected</c:if>>Minas Gerais</option> 
                        <option value="pa"<c:if test="${formulariosSocioEconomico.estado == 'Pará'}"> selected</c:if>>Pará</option> 
                        <option value="pb"<c:if test="${formulariosSocioEconomico.estado == 'Paraíba'}"> selected</c:if>>Paraíba</option> 
                        <option value="pr"<c:if test="${formulariosSocioEconomico.estado == 'Paraná'}"> selected</c:if>>Paraná</option> 
                        <option value="pe"<c:if test="${formulariosSocioEconomico.estado == 'Pernambuco'}"> selected</c:if>>Pernambuco</option> 
                        <option value="pi"<c:if test="${formulariosSocioEconomico.estado == 'Piauí'}"> selected</c:if>>Piauí</option> 
                        <option value="rj"<c:if test="${formulariosSocioEconomico.estado == 'Rio de Janeiro'}"> selected</c:if>>Rio de Janeiro</option> 
                        <option value="rn"<c:if test="${formulariosSocioEconomico.estado == 'Rio Grande do Norte'}"> selected</c:if>>Rio Grande do Norte</option> 
                        <option value="ro"<c:if test="${formulariosSocioEconomico.estado == 'Rondônia'}"> selected</c:if>>Rondônia</option> 
                        <option value="rs"<c:if test="${formulariosSocioEconomico.estado == 'Rio Grande do Sul'}"> selected</c:if>>Rio Grande do Sul</option> 
                        <option value="rr"<c:if test="${formulariosSocioEconomico.estado == 'Roraima'}"> selected</c:if>>Roraima</option> 
                        <option value="sc"<c:if test="${formulariosSocioEconomico.estado == 'Santa Catarina'}"> selected</c:if>>Santa Catarina</option> 
                        <option value="se"<c:if test="${formulariosSocioEconomico.estado == 'Sergipe'}"> selected</c:if>>Sergipe</option> 
                        <option value="sp"<c:if test="${formulariosSocioEconomico.estado == 'São Paulo'}"> selected</c:if>>São Paulo</option> 
                        <option value="to"<c:if test="${formulariosSocioEconomico.estado == 'Tocantins'}"> selected</c:if>>Tocantins</option> 

                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Cidade:</td> 
                    <td><input type="text" name="txtcidade" value="${formulariosSocioEconomico.cidade}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>

                <tr>
                    <td>Cep:</td> 
                    <td><input type="number" name="txtcep" value="${formulariosSocioEconomico.cep}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                </tr>
            </table>

            <h3>Dados de Endereço da família do aluno (Preencher se não for o mesmo do estudante)</h3>

        <table>


            <tr>
                <td>Rua:</td> 
                <td><input type="text" name="txtrua1" value="${formulariosSocioEconomico.rua1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                <td>Numero:</td> 
                <td><input type="number" name="txtnum1" value="${formulariosSocioEconomico.numero1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
                <td>Complemento:</td> 
                <td><input type="text" name="txtcomplemento1" value="${formulariosSocioEconomico.complemento1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>

            </tr>


            <tr>
                <td>Bairro:</td> 
                <td><input type="text" name="txtbairro1" value="${formulariosSocioEconomico.bairro1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            </tr>




            <tr>
                <td>Estado</td>

                <td>
                    <select name="optTipoEstado1" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>

                        <option value="ac"<c:if test="${formulariosSocioEconomico.estado1 == 'Acre'}"> selected</c:if>>Acre</option> 
                    <option value="al"<c:if test="${formulariosSocioEconomico.estado1 == 'Alagoas'}"> selected</c:if>>Alagoas</option> 
                    <option value="am"<c:if test="${formulariosSocioEconomico.estado1 == 'Amazonas'}"> selected</c:if>>Amazonas</option> 
                    <option value="ap"<c:if test="${formulariosSocioEconomico.estado1 == 'Amapá'}"> selected</c:if>>Amapá</option> 
                    <option value="ba"<c:if test="${formulariosSocioEconomico.estado1 == 'Bahia'}"> selected</c:if>>Bahia</option> 
                    <option value="ce"<c:if test="${formulariosSocioEconomico.estado1 == 'Ceará'}"> selected</c:if>>Ceará</option> 
                    <option value="df"<c:if test="${formulariosSocioEconomico.estado1 == 'Distrito Federal'}"> selected</c:if>>Distrito Federal</option> 
                    <option value="es"<c:if test="${formulariosSocioEconomico.estado1 == 'Espírito Santo'}"> selected</c:if>>Espírito Santo</option> 
                    <option value="go"<c:if test="${formulariosSocioEconomico.estado1 == 'Goiás'}"> selected</c:if>>Goiás</option> 
                    <option value="ma"<c:if test="${formulariosSocioEconomico.estado1 == 'Maranhão'}"> selected</c:if>>Maranhão</option> 
                    <option value="mt"<c:if test="${formulariosSocioEconomico.estado1 == 'Mato Grosso'}"> selected</c:if>>Mato Grosso</option> 
                    <option value="ms"<c:if test="${formulariosSocioEconomico.estado1 == 'Mato Grosso do Sul'}"> selected</c:if>>Mato Grosso do Sul</option> 
                    <option value="mg"<c:if test="${formulariosSocioEconomico.estado1 == 'Minas Gerais'}"> selected</c:if>>Minas Gerais</option> 
                    <option value="pa"<c:if test="${formulariosSocioEconomico.estado1 == 'Pará'}"> selected</c:if>>Pará</option> 
                    <option value="pb"<c:if test="${formulariosSocioEconomico.estado1 == 'Paraíba'}"> selected</c:if>>Paraíba</option> 
                    <option value="pr"<c:if test="${formulariosSocioEconomico.estado1 == 'Paraná'}"> selected</c:if>>Paraná</option> 
                    <option value="pe"<c:if test="${formulariosSocioEconomico.estado1 == 'Pernambuco'}"> selected</c:if>>Pernambuco</option> 
                    <option value="pi"<c:if test="${formulariosSocioEconomico.estado1 == 'Piauí'}"> selected</c:if>>Piauí</option> 
                    <option value="rj"<c:if test="${formulariosSocioEconomico.estado1 == 'Rio de Janeiro'}"> selected</c:if>>Rio de Janeiro</option> 
                    <option value="rn"<c:if test="${formulariosSocioEconomico.estado1 == 'Rio Grande do Norte'}"> selected</c:if>>Rio Grande do Norte</option> 
                    <option value="ro"<c:if test="${formulariosSocioEconomico.estado1 == 'Rondônia'}"> selected</c:if>>Rondônia</option> 
                    <option value="rs"<c:if test="${formulariosSocioEconomico.estado1 == 'Rio Grande do Sul'}"> selected</c:if>>Rio Grande do Sul</option> 
                    <option value="rr"<c:if test="${formulariosSocioEconomico.estado1 == 'Roraima'}"> selected</c:if>>Roraima</option> 
                    <option value="sc"<c:if test="${formulariosSocioEconomico.estado1 == 'Santa Catarina'}"> selected</c:if>>Santa Catarina</option> 
                    <option value="se"<c:if test="${formulariosSocioEconomico.estado1 == 'Sergipe'}"> selected</c:if>>Sergipe</option> 
                    <option value="sp"<c:if test="${formulariosSocioEconomico.estado1 == 'São Paulo'}"> selected</c:if>>São Paulo</option> 
                    <option value="to"<c:if test="${formulariosSocioEconomico.estado1 == 'Tocantins'}"> selected</c:if>>Tocantins</option> 

                    </select>
                </td>
            </tr>

            <tr>
                <td>Cidade:</td> 
                <td><input type="text" name="txtcidade1" value="${formulariosSocioEconomico.cidade1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            </tr>

            <tr>
                <td>Cep:</td> 
                <td><input type="number" name="txtcep1" value="${formulariosSocioEconomico.cep1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            </tr>

            <tr>
                <td>Telefone:</td> 
                <td><input type="number" name="txttelefone1" value="${formulariosSocioEconomico.telefone1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            </tr>

            <tr>
                <td>Celular:</td> 
                <td><input type="number" name="txtcelular1" value="${formulariosSocioEconomico.celular1}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            </tr>
            
        </table>
      
        <h3>Dados Insitucionais</h3>

    <table>

        <tr>
            <td>Curso:</td> 
            <td><input type="text" name="txtcurso" value="${formulariosSocioEconomico.curso}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
            <td>Sério/Módulo/Período:</td>
            <td>
                <select name="optTipoPeriodo" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                <option value="1" <c:if test="${formulariosSocioEconomico.periodo == '1'}"> selected</c:if>>1</option>
                <option value="2" <c:if test="${formulariosSocioEconomico.periodo == '2'}"> selected</c:if>>2</option>
                <option value="3" <c:if test="${formulariosSocioEconomico.periodo == '3'}"> selected</c:if>>3</option>
                <option value="4" <c:if test="${formulariosSocioEconomico.periodo == '4'}"> selected</c:if>>4</option>
                <option value="5" <c:if test="${formulariosSocioEconomico.periodo == '5'}"> selected</c:if>>5</option>
                <option value="6" <c:if test="${formulariosSocioEconomico.periodo == '6'}"> selected</c:if>>6</option>
                <option value="7" <c:if test="${formulariosSocioEconomico.periodo == '7'}"> selected</c:if>>7</option>
                <option value="8" <c:if test="${formulariosSocioEconomico.periodo == '8'}"> selected</c:if>>8</option>
                <option value="9" <c:if test="${formulariosSocioEconomico.periodo == '9'}"> selected</c:if>>9</option>
                <option value="10" <c:if test="${formulariosSocioEconomico.periodo == '10'}"> selected</c:if>>10</option>
                </select>
            </td>
            <td>Número de matrícula:</td> 
            <td><input type="number" name="txtmatricula" value="${formulariosSocioEconomico.matricula}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
        </tr>
        <tr>
            <td>Ensino:</td>
            <td>
                <select name="optTipoEnsino" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                <option value="Integrado" <c:if test="${formulariosSocioEconomico.ensino == 'Integrado'}"> selected</c:if>>Integrado</option>
                <option value="Superior" <c:if test="${formulariosSocioEconomico.ensino == 'Superior'}"> selected</c:if>>Superior</option>
                <option value="Pós-Graduação" <c:if test="${formulariosSocioEconomico.ensino == 'Pós-Graduação'}"> selected</c:if>>Pós-Graduação</option>

                </select>
            </td>
            <td>Turno:</td> 
            <td>
                <select name="optTipoTurno" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
                <option value="manha" <c:if test="${formulariosSocioEconomico.turno == 'manha'}"> selected</c:if>>manha</option>
                <option value="tarde" <c:if test="${formulariosSocioEconomico.turno == 'tarde'}"> selected</c:if>>tarde</option>
                <option value="noite" <c:if test="${formulariosSocioEconomico.turno == 'noite'}"> selected</c:if>>noite</option>

                </select>
            </td>
        </tr>

        <td>Ano de Ingresso:</td> 
        <td><input type="number" name="txtanoI" value="${formulariosSocioEconomico.anoI}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
        <td>Ano previsto para término:</td> 
        <td><input type="number" name="txtanoT" value="${formulariosSocioEconomico.anoT}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>       
        </tr>

    </table>
    <tr>
    <h3>Responda o Formulário Socioeconômico</h3>
</tr>
<table>
    <tr>
        <td>QUESTÃO 1- Você ou alguém da sua família é ou já foi atendido em algum programa de Assistência Estudandil do IF SUDESTE MG ou antigo CTU?:</td> 
        <td>
            <select name="optTipoquestao1" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="nao" <c:if test="${formulariosSocioEconomico.questao1 == 'nao'}"> selected</c:if>>Não</option>
            <option value="sim" <c:if test="${formulariosSocioEconomico.questao1 == 'sim'}"> selected</c:if>>Sim</option>
        </td>
        </select>

    </tr>
    <tr>
        <td></br>QUESTÃO 2 - Programa/atendimento solicitado:</td> 
        <td>
            <select name="optTipoquestao2" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="alimentacao" <c:if test="${formulariosSocioEconomico.questao2 == 'alimentacao'}"> selected</c:if>>Alimentação</option>
            <option value="manutencao" <c:if test="${formulariosSocioEconomico.questao2 == 'manutencao'}"> selected</c:if>>Manutenção</option>
            <option value="moradia" <c:if test="${formulariosSocioEconomico.questao2 == 'moradia'}"> selected</c:if>>Moradia</option>
            <option value="transporte" <c:if test="${formulariosSocioEconomico.questao2 == 'transporte'}"> selected</c:if>>Transporte</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 3 - Qual o principal meio de transporte utilizado para chegar no IF?:</td> 
        <td>
            <select name="optTipoquestao3" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="A pe, de bicicleta" <c:if test="${formulariosSocioEconomico.questao3 == 'A pe, de bicicleta'}"> selected</c:if>> A pé, de bicicleta</option>
            <option value="carona" <c:if test="${formulariosSocioEconomico.questao3 == 'carona'}"> selected</c:if>>Carona</option>
            <option value="gratuitamente por prefeitura ou escola" <c:if test="${formulariosSocioEconomico.questao3 == 'gratuitamente por prefeitura ou escola'}"> selected</c:if>>Oferecido gratuitamente por prefeitura ou escola</option>
            <option value="Transporte proprio" <c:if test="${formulariosSocioEconomico.questao3 == 'Transporte proprio'}"> selected</c:if>>Transporte próprio</option>
            <option value="De transporte publico, pago com meus recursos" <c:if test="${formulariosSocioEconomico.questao3 == 'de transporte publico, pago com meus recursos'}"> selected</c:if>>De transporte público, pago com meus recursos</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 4 - A instituição na qual curso o ensino fundamental é?:</td> 
        <td>
            <select name="optTipoquestao4" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="publica" <c:if test="${formulariosSocioEconomico.questao4 == 'publica'}"> selected</c:if>>Pública</option>
            <option value="particular" <c:if test="${formulariosSocioEconomico.questao4 == 'particular'}"> selected</c:if>>Particular</option>
            <option value="parte em publica, depois em particular" <c:if test="${formulariosSocioEconomico.questao4 == 'parte em publica, depois em particular'}"> selected</c:if>>Parte em pública, depois em particular</option>
            <option value="parte em particular, depois em publica" <c:if test="${formulariosSocioEconomico.questao4 == 'parte em particular, depois em publica'}"> selected</c:if>>Parte em particular, depois em pública</option>
            <option value="particular com Bolsa" <c:if test="${formulariosSocioEconomico.questao4 == 'particular com Bolsa'}"> selected</c:if>>Particular com Bolsa</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 5 - A instituição na qual curso o ensino médio é?:</td> 
        <td>
            <select name="optTipoquestao5" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="publica" <c:if test="${formulariosSocioEconomico.questao5 == 'publica'}"> selected</c:if>>Pública</option>
            <option value="particular" <c:if test="${formulariosSocioEconomico.questao5 == 'particular'}"> selected</c:if>>Particular</option>
            <option value="parte em publica, depois em particular" <c:if test="${formulariosSocioEconomico.questao5 == 'parte em publica, depois em particular'}"> selected</c:if>>Parte em pública, depois em particular</option>
            <option value="parte em particular, depois em publica" <c:if test="${formulariosSocioEconomico.questao5 == 'parte em particular, depois em publica'}"> selected</c:if>>Parte em particular, depois em pública</option>
            <option value="particular com Bolsa" <c:if test="${formulariosSocioEconomico.questao5 == 'particular com Bolsa'}"> selected</c:if>>Particular com Bolsa</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 6 - Você está inserido em alguma atividade acadêmica remunerada?:</td> 
        <td>
            <select name="optTipoquestao6" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="sim. Estágio" <c:if test="${formulariosSocioEconomico.questao6 == 'sim. Estágio'}"> selected</c:if>>Sim. Estágio</option>
            <option value="Sim. Projeto de iniciação científica" <c:if test="${formulariosSocioEconomico.questao6 == 'Sim. Projeto de iniciação científica'}"> selected</c:if>>Sim. Projeto de iniciação científica</option>
            <option value="Sim. Projeto de treinamento profissional" <c:if test="${formulariosSocioEconomico.questao6 == 'Sim. Projeto de treinamento profissional'}"> selected</c:if>>Sim. Projeto de treinamento profissional</option>
            <option value="Não" <c:if test="${formulariosSocioEconomico.questao6 == 'Não'}"> selected</c:if>>Não</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 7 - Você trabalha em alguma atividade remunerada?:</td> 
        <td>
            <select name="optTipoquestao7" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="nao" <c:if test="${formulariosSocioEconomico.questao7 == 'nao'}"> selected</c:if>>Não</option>
            <option value="sim" <c:if test="${formulariosSocioEconomico.questao7 == 'sim'}"> selected</c:if>>Sim</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 8 - Qual sua condição de manutenção?</td> 
        <td>
            <select name="optTipoquestao8" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="Sou responsável pelo meu próprio sustentento" <c:if test="${formulariosSocioEconomico.questao8 == 'Sou responsável pelo meu próprio sustentento'}"> selected</c:if>>Sou responsável pelo meu próprio sustentento</option>
            <option value="Sou sustentado pelos meus pais" <c:if test="${formulariosSocioEconomico.questao8 == 'Sou sustentado pelos meus pais'}"> selected</c:if>>Sou sustentado pelos meus pais</option>
            <option value="Recebo ajuda de parentes" <c:if test="${formulariosSocioEconomico.questao8 == 'Recebo ajuda de parentes'}"> selected</c:if>>Recebo ajuda de parentes</option>
            <option value="Tenho bolsa de estudos" <c:if test="${formulariosSocioEconomico.questao8 == 'Tenho bolsa de estudos'}"> selected</c:if>>Tenho bolsa de estudos</option>
            <option value="Outra" <c:if test="${formulariosSocioEconomico.questao8 == 'Outra'}"> selected</c:if>>Outra</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 9 - Você mora?</td> 
        <td>
            <select name="optTipoquestao9" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="Sozinho" <c:if test="${formulariosSocioEconomico.questao9 == 'Sozinho'}"> selected</c:if>>Sozinho</option>
            <option value="Com pais" <c:if test="${formulariosSocioEconomico.questao9 == 'Com pais'}"> selected</c:if>>Com pais</option>
            <option value="Com cônjuje/Companheiro" <c:if test="${formulariosSocioEconomico.questao9 == 'Com cônjuje/Companheiro'}"> selected</c:if>>Com cônjuje/Companheiro</option>
            <option value="Em casa de familiares" <c:if test="${formulariosSocioEconomico.questao9 == 'Em casa de familiares'}"> selected</c:if>>Em casa de familiares</option>
            <option value="Em republicas" <c:if test="${formulariosSocioEconomico.questao9 == 'Em republicas'}"> selected</c:if>>Em republicas</option>
        </td>
        </select>
    </tr>


    <tr>
        <td></br>QUESTÃO 10 - Quem é(são) o(os) responsável(is) pela manutenção financeira do grupo familiar?</td> 
        <td>
            <select name="optTipoquestao10" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="pais" <c:if test="${formulariosSocioEconomico.questao10 == 'pais'}"> selected</c:if>>pais</option>
            <option value="somente um dos pais" <c:if test="${formulariosSocioEconomico.questao10 == 'somente um dos pais'}"> selected</c:if>>somente um dos pais</option>
            <option value="outros membros do grupo familiar" <c:if test="${formulariosSocioEconomico.questao10 == 'outros membros do grupo familiar'}"> selected</c:if>>outros membros do grupo familiar</option>
            <option value="próprio estudante" <c:if test="${formulariosSocioEconomico.questao10 == 'próprio estudante'}"> selected</c:if>>próprio estudante</option>
        </td>
        </select>
    </tr>

    <tr>
        <td></br>QUESTÃO 11 - O bairro e a casa onde mora a família têm:</td> 
    </tr>
    <tr>
        <td>
            <input type="checkbox" name="optTipoquestao11" value="rede de esgoto" <c:if test="${formulariosSocioEconomico.questao11 == 'rede de esgoto'}"> selected</c:if>>rede de esgoto</input>
        <input type="checkbox" name="optTipoquestao11a" value="água tratada" <c:if test="${formulariosSocioEconomico.questao11a == 'água tratada'}"> selected</c:if>>água tratada</input>
        <input type="checkbox" name="optTipoquestao11b" value="iluminação pública" <c:if test="${formulariosSocioEconomico.questao11b == 'iluminação pública'}"> selected</c:if>>iluminação pública</input>
        <input type="checkbox" name="optTipoquestao11c" value="Ruas Pavimentadas" <c:if test="${formulariosSocioEconomico.questao11c == 'Ruas Pavimentadas'}"> selected</c:if>>Ruas Pavimentadas</input>
        <input type="checkbox" name="optTipoquestao11d" value="coleta de lixo" <c:if test="${formulariosSocioEconomico.questao11d == 'coleta de lixo'}"> selected</c:if>>coleta de lixo</input>
        </td>
    </tr>
    <tr>
        <td></br>QUESTÃO 12 - Sua família reside em?</td> 
        <td>
            <select name="optTipoquestao12" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="vila ou aglomerado" <c:if test="${formulariosSocioEconomico.questao12 == 'vila ou aglomerado'}"> selected</c:if>>vila ou aglomerado</option>
            <option value="bairro padrão popula" <c:if test="${formulariosSocioEconomico.questao12 == 'bairro padrão popula'}"> selected</c:if>>bairro padrão popula</option>
            <option value="bairro padrão médio" <c:if test="${formulariosSocioEconomico.questao12 == 'bairro padrão médio'}"> selected</c:if>>bairro padrão médio</option>
            <option value="bairro padrão alto e luxo" <c:if test="${formulariosSocioEconomico.questao12 == 'bairro padrão alto e luxo'}"> selected</c:if>>bairro padrão alto e luxo</option>
            <option value="fora do perímetro urbano" <c:if test="${formulariosSocioEconomico.questao12 == 'fora do perímetro urbano'}"> selected</c:if>>fora do perímetro urbano</option>
            <option value="outro" <c:if test="${formulariosSocioEconomico.questao12 == 'outro'}"> selected</c:if>>outro</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 13 - Sua família reside em imóvel?</td> 
        <td>
            <select name="optTipoquestao13" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="alugado" <c:if test="${formulariosSocioEconomico.questao13 == 'alugado'}"> selected</c:if>>alugado</option>
            <option value="próprio – já quitado" <c:if test="${formulariosSocioEconomico.questao13 == 'próprio – já quitado'}"> selected</c:if>>próprio – já quitado</option>
            <option value="próprio – por herança" <c:if test="${formulariosSocioEconomico.questao13 == 'bairro padrão médio'}"> selected</c:if>>bairro padrão médio</option>
            <option value="bairro padrão alto e luxo" <c:if test="${formulariosSocioEconomico.questao13 == 'próprio – por herança'}"> selected</c:if>>próprio – por herança</option>
            <option value="Próprio - em pagamento" <c:if test="${formulariosSocioEconomico.questao13 == 'Próprio - em pagamento'}"> selected</c:if>>Próprio - em pagamento</option>
            <option value="emprestado ou cedido" <c:if test="${formulariosSocioEconomico.questao13 == 'emprestado ou cedido'}"> selected</c:if>>emprestado ou cedido</option>
            <option value="Construído em lote de parente" <c:if test="${formulariosSocioEconomico.questao13 == 'Construído em lote de parente'}"> selected</c:if>>Construído em lote de parente</option>
            <option value="outro" <c:if test="${formulariosSocioEconomico.questao13 == 'outro'}"> selected</c:if>>outro</option>
        </td>
        </select>
    </tr>
    <tr>
        <td></br>QUESTÃO 14 - Marque a característica que melhor descreve a sua casa?</td> 
        <td>
            <select name="optTipoquestao14" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="residência com acabamento" <c:if test="${formulariosSocioEconomico.questao14 == 'residência com acabamento'}"> selected</c:if>>residência com acabamento</option>
            <option value="residência sem acabamento (sem telhado ou reboco, ou pintura, ou piso, etc.)" <c:if test="${formulariosSocioEconomico.questao14 == 'residência sem acabamento (sem telhado ou reboco, ou pintura, ou piso, etc.)'}"> selected</c:if>>residência sem acabamento (sem telhado ou reboco, ou pintura, ou piso, etc.)</option>

        </td>
        </select>
    </tr>

    <tr>
        <td></br>QUESTÃO 15 - A família possui outros imóveis além do que habita? (lotes, sítios, fazendas, casa na praia,aptos, salas, barracões ou outros)?</td> 
        <td>
            <select name="optTipoquestao15" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="Não" <c:if test="${formulariosSocioEconomico.questao15 == 'Não'}"> selected</c:if>>Não</option>
            <option value="Sim" <c:if test="${formulariosSocioEconomico.questao15 == 'Sim'}"> selected</c:if>>Sim</option>
        </td>
        </select>
    </tr>
</table>
<td></br>QUESTÃO 16 - Em relação à casa de sua família especifique a quantidade de :</td>
<table>

    <tr>
        <td>Automóvel:</td>
        <td>
            <select name="optTipoquestao16a" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16a == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16a == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16a == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16a == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16a == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16a == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16a == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Televisão em cores:</td>
        <td>
            <select name="optTipoquestao16b" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16b == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16b == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16b == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16b == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16b == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16b == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16b == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Maquina de lavar roupas:</td>
        <td>
            <select name="optTipoquestao16c" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16c == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16c == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16c == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16c == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16c == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16c == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16c == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Geladeira:</td>
        <td>
            <select name="optTipoquestao16d" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16d == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16d == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16d == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16d == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16d == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16d == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16d == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>TV a Cabo:</td>
        <td>
            <select name="optTipoquestao16e" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16e == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16e == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16e == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16e == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16e == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16e == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16e == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Computador:</td>
        <td>
            <select name="optTipoquestao16f" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16f == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16f == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16f == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16f == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16f == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16f == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16f == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Internet paga:</td>
        <td>
            <select name="optTipoquestao16g" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16g == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16g == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16g == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16g == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16g == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16g == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16g == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Empregada mensalista:</td>
        <td>
            <select name="optTipoquestao16h" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16h == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16h == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16h == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16h == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16h == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16h == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16h == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Empregada Diarista:</td>
        <td>
            <select name="optTipoquestao16i" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16i == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16i == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16i == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16i == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16i == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16i == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16i == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Banheiro:</td>
        <td>
            <select name="optTipoquestao16j" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16j == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16j == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16j == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16j == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16j == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16j == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16j == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
    <tr>
        <td>Quartos:</td>
        <td>
            <select name="optTipoquestao16k" <c:if test="${operacao == 'excluir'}"> readonly</c:if>>
            <option value="0" <c:if test="${formulariosSocioEconomico.questao16k == '0'}"> selected</c:if>>0</option>
            <option value="1" <c:if test="${formulariosSocioEconomico.questao16k == '1'}"> selected</c:if>>1</option>
            <option value="2" <c:if test="${formulariosSocioEconomico.questao16k == '2'}"> selected</c:if>>2</option>
            <option value="3" <c:if test="${formulariosSocioEconomico.questao16k == '3'}"> selected</c:if>>3</option>
            <option value="4" <c:if test="${formulariosSocioEconomico.questao16k == '4'}"> selected</c:if>>4</option>
            <option value="5" <c:if test="${formulariosSocioEconomico.questao16k == '5'}"> selected</c:if>>5</option>
            <option value="6" <c:if test="${formulariosSocioEconomico.questao16k == '6'}"> selected</c:if>>6</option>
        </td>
        </select>
    </tr>
</table>
<td></br>QUESTÃO 17 - Despesa familiar mensal(excluir despesas do estudante do IF SUDESTE MG que reside fora):</td>
<table>
    <tr>
        <td>Água:</td> 
        <td><input type="number" name="txtquestao17a" value="${formulariosSocioEconomico.questao17a}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>
    </tr>
    <tr>
        <td>Luz:</td> 
        <td><input type="number" name="txtquestao17b" value="${formulariosSocioEconomico.questao17b}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Telefone:</td> 
        <td><input type="number" name="txtquestao17c" value="${formulariosSocioEconomico.questao17c}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Condomínio:</td> 
        <td><input type="number" name="txtquestao17d" value="${formulariosSocioEconomico.questao17d}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Mensalidade escolar:</td> 
        <td><input type="number" name="txtquestao17e" value="${formulariosSocioEconomico.questao17e}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Alimentação:</td> 
        <td><input type="number" name="txtquestao17f" value="${formulariosSocioEconomico.questao17f}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Saúde:</td> 
        <td><input type="number" name="txtquestao17g" value="${formulariosSocioEconomico.questao17g}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Transporte:</td> 
        <td><input type="number" name="txtquestao17h" value="${formulariosSocioEconomico.questao17h}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>IPTU Anual:</td> 
        <td><input type="number" name="txtquestao17i" value="${formulariosSocioEconomico.questao17i}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Aluguel/Prestação da casa:</td> 
        <td><input type="number" name="txtquestao17j" value="${formulariosSocioEconomico.questao17j}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Pensão Alimentícia:</td> 
        <td><input type="number" name="txtquestao17k" value="${formulariosSocioEconomico.questao17k}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Outros:</td> 
        <td><input type="number" name="txtquestao17l" value="${formulariosSocioEconomico.questao17l}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
</table>
<td></br>QUESTÃO 18 - Despesa do estudante do IF SUDESTE MG com moradia (registrar apenas a parcela que cabe ao estudante no caso de república ou similar):</td>
<table>
    <tr>
        <td>Água:</td> 
        <td><input type="number" name="txtquestao18" value="${formulariosSocioEconomico.questao18}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Luz:</td> 
        <td><input type="number" name="txtquestao18a" value="${formulariosSocioEconomico.questao18a}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Telefone:</td> 
        <td><input type="number" name="txtquestao18b" value="${formulariosSocioEconomico.questao18b}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Condomínio:</td> 
        <td><input type="number" name="txtquestao18c" value="${formulariosSocioEconomico.questao18c}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>IPTU Anual:</td> 
        <td><input type="number" name="txtquestao18d" value="${formulariosSocioEconomico.questao18d}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>
    <tr>
        <td>Aluguel:</td> 
        <td><input type="number" name="txtquestao18e" value="${formulariosSocioEconomico.questao18e}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td>  
    </tr>

</table>
<td></br>QUESTÃO 19 - Informe ou esclareça sobre dados não contemplados neste formulário ou situações especiais que julgar conveniente:</td>
<table>
    <tr>

        <td><input type="text" name="txtquestao19" value="${formulariosSocioEconomico.questao19}" <c:if test="${operacao == 'excluir'}"> readonly</c:if>></td> 

</tr>
</table>
<tr>
    <td></br><input type="submit" name="btnConfirmar" value="Confirmar"></td>
</tr>

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
        if (form.txtId.value == "") {
            mensagem = mensagem + "Informe o Codigo\n";
        }
        if (form.txtNome.value == "") {
            mensagem = mensagem + "Informe o Nome Completo\n";
        }
        if (form.txtNascimento.value == "") {
            mensagem = mensagem + "Informe o Nascimento \n";
        }
        if (form.optTipoSexo.value == "") {
            mensagem = mensagem + "Informe o sexo\n";

        }
        if (form.txtrg.value == "") {
            mensagem = mensagem + "Informe o RG\n";

        }
        if (form.txtcpf.value == "") {
            mensagem = mensagem + "Informe o CPF\n";

        }

        if (form.txttelefone.value == "") {
            mensagem = mensagem + "Informe o Telefone\n";

        }
        if (form.txtcelular.value == "") {
            mensagem = mensagem + "Informe o Celular\n";

        }
        if (form.txtemail.value == "") {
            mensagem = mensagem + "Informe o Email\n";

        }


        if (!campoNumerico(form.txtId.value)) {
            mensagem = mensagem + "O codigo\n";
        }

        if (!campoNumerico(form.txtNascimento.value)) {
            mensagem = mensagem + "Informe o Nascimento \n";
        }
        if (!campoNumerico(form.txtrg.value)) {
            mensagem = mensagem + "Informe o RG\n";
        }

        if (!campoNumerico(form.txtcpf.value)) {
            mensagem = mensagem + "Informe o CPF\n";
        }
        if (!campoNumerico(form.txttelefone.value)) {
            mensagem = mensagem + "Informe o Telefone\n";
        }
        if (!campoNumerico(form.txtcelular.value)) {
            mensagem = mensagem + "Informe o Celular\n";
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
