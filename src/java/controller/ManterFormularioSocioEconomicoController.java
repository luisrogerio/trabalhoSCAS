/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FormulariosocioeconomicoDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Formulariosocioeconomico;

/**
 *
 * @author Lucas Matias
 */
public class ManterFormularioSocioEconomicoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao.equals("prepararOperacao")) {
            prepararOperacao(request, response);
        }
        if (acao.equals("confirmarOperacao")) {
            confirmarOperacao(request, response);
        }
    }

    public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String operacao = request.getParameter("operacao");
            request.setAttribute("operacao", operacao);

            if (!operacao.equals("incluir")) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                Formulariosocioeconomico formulariosocioeconomico;
                formulariosocioeconomico = FormulariosocioeconomicoDAO.getInstance().obterFormulariosocioeconomico(id);
                request.setAttribute("formulariosSocioEconomico", formulariosocioeconomico);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterFormularioSocioEconomico.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Formulariosocioeconomico formulariosocioeconomico = null;
        try {
            String operacao = request.getParameter("operacao");

            int id = Integer.parseInt(request.getParameter("txtId"));
            String nome = request.getParameter("txtNome");
            int nascimento = Integer.parseInt(request.getParameter("txtNascimento"));
            String sexo = request.getParameter("optTipoSexo");
            int rg = Integer.parseInt(request.getParameter("txtrg"));
            int cpf = Integer.parseInt(request.getParameter("txtcpf"));
            int telefone = Integer.parseInt(request.getParameter("txttelefone"));
            int celular = Integer.parseInt(request.getParameter("txtcelular"));
            String email = request.getParameter("txtemail");

            String rua = request.getParameter("txtrua");
            String complemento = request.getParameter("txtcomplemento");
            String bairro = request.getParameter("txtbairro");
            String estado = request.getParameter("optTipoEstado");
            String cidade = request.getParameter("txtcidade");

            int numero = request.getParameter("txtnum").equals("") ? 0 : Integer.parseInt(request.getParameter("txtnum"));
            int cep = request.getParameter("txtcep").equals("") ? 0 : Integer.parseInt(request.getParameter("txtcep"));

            String rua1 = request.getParameter("txtrua1");
            String complemento1 = request.getParameter("txtcomplemento1");
            String bairro1 = request.getParameter("txtbairro1");
            String estado1 = request.getParameter("optTipoEstado1");
            String cidade1 = request.getParameter("txtcidade1");

            int numero1 = request.getParameter("txtnum1").equals("") ? 0 : Integer.parseInt(request.getParameter("txtnum1"));
            int cep1 = request.getParameter("txtcep1").equals("") ? 0 : Integer.parseInt(request.getParameter("txtcep1"));
            int telefone1 = request.getParameter("txttelefone1").equals("") ? 0 : Integer.parseInt(request.getParameter("txttelefone1"));
            int celular1 = request.getParameter("txtcelular1").equals("") ? 0 : Integer.parseInt(request.getParameter("txtcelular1"));

            String curso = request.getParameter("txtcurso");
            String ensino = request.getParameter("optTipoEnsino");
            String turno = request.getParameter("optTipoTurno");

            int periodo = request.getParameter("optTipoPeriodo").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoPeriodo"));
            int matricula = request.getParameter("txtmatricula").equals("") ? 0 : Integer.parseInt(request.getParameter("txtmatricula"));
            int anoT = request.getParameter("txtanoT").equals("") ? 0 : Integer.parseInt(request.getParameter("txtanoT"));
            int anoI = request.getParameter("txtanoI").equals("") ? 0 : Integer.parseInt(request.getParameter("txtanoI"));

            String questao1 = request.getParameter("optTipoquestao1");
            String questao2 = request.getParameter("optTipoquestao2");
            String questao3 = request.getParameter("optTipoquestao3");
            String questao4 = request.getParameter("optTipoquestao4");
            String questao5 = request.getParameter("optTipoquestao5");
            String questao6 = request.getParameter("optTipoquestao6");
            String questao7 = request.getParameter("optTipoquestao7");
            String questao8 = request.getParameter("optTipoquestao8");
            String questao9 = request.getParameter("optTipoquestao9");
            String questao10 = request.getParameter("optTipoquestao10");
            String questao11 = request.getParameter("optTipoquestao11");
            String questao11a = request.getParameter("optTipoquestao11a");
            String questao11b = request.getParameter("optTipoquestao11b");
            String questao11c = request.getParameter("optTipoquestao11c");
            String questao11d = request.getParameter("optTipoquestao11d");
            String questao12 = request.getParameter("optTipoquestao12");
            String questao13 = request.getParameter("optTipoquestao13");
            String questao14 = request.getParameter("optTipoquestao14");
            String questao15 = request.getParameter("optTipoquestao15");

            int questao16a = request.getParameter("optTipoquestao16a").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16a"));
            int questao16b = request.getParameter("optTipoquestao16b").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16b"));
            int questao16c = request.getParameter("optTipoquestao16c").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16c"));
            int questao16d = request.getParameter("optTipoquestao16d").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16d"));
            int questao16e = request.getParameter("optTipoquestao16e").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16e"));
            int questao16f = request.getParameter("optTipoquestao16f").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16f"));
            int questao16g = request.getParameter("optTipoquestao16g").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16g"));
            int questao16h = request.getParameter("optTipoquestao16h").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16h"));
            int questao16i = request.getParameter("optTipoquestao16i").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16i"));
            int questao16j = request.getParameter("optTipoquestao16j").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16j"));
            int questao16k = request.getParameter("optTipoquestao16k").equals("") ? 0 : Integer.parseInt(request.getParameter("optTipoquestao16k"));

            float questao17a = request.getParameter("txtquestao17a").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17a"));
            float questao17b = request.getParameter("txtquestao17b").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17b"));
            float questao17c = request.getParameter("txtquestao17c").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17c"));
            float questao17d = request.getParameter("txtquestao17d").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17d"));
            float questao17e = request.getParameter("txtquestao17e").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17e"));
            float questao17f = request.getParameter("txtquestao17f").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17f"));
            float questao17g = request.getParameter("txtquestao17g").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17g"));
            float questao17h = request.getParameter("txtquestao17h").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17h"));
            float questao17i = request.getParameter("txtquestao17i").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17i"));
            float questao17j = request.getParameter("txtquestao17j").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17j"));
            float questao17k = request.getParameter("txtquestao17k").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17k"));
            float questao17l = request.getParameter("txtquestao17l").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao17l"));

            float questao18 = request.getParameter("txtquestao18").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18"));
            float questao18a = request.getParameter("txtquestao18a").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18a"));
            float questao18b = request.getParameter("txtquestao18b").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18b"));
            float questao18c = request.getParameter("txtquestao18c").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18c"));
            float questao18d = request.getParameter("txtquestao18d").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18d"));
            float questao18e = request.getParameter("txtquestao18e").equals("") ? 0 : Float.parseFloat(request.getParameter("txtquestao18e"));
            String questao19 = request.getParameter("txtquestao19");

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {

                formulariosocioeconomico = new Formulariosocioeconomico(id, nome, nascimento, sexo, rg, cpf, telefone,
                        celular, email, rua, complemento, bairro, estado, cidade, numero, cep, rua1,
                        complemento1, bairro1, estado1, cidade1, numero1, cep1, telefone1, celular1,
                        curso, ensino, turno, periodo, matricula, anoT, anoI, questao1, questao2, questao3,
                        questao4, questao5, questao6, questao7, questao8, questao9, questao10, questao11,
                        questao11a, questao11b, questao11c, questao11d, questao12, questao13, questao14,
                        questao15, questao16a, questao16b, questao16c, questao16d, questao16e, questao16f,
                        questao16g, questao16h, questao16i, questao16j, questao16k, questao17a, questao17b,
                        questao17c, questao17d, questao17e, questao17f, questao17g, questao17h, questao17i,
                        questao17j, questao17k, questao17l, questao18, questao18a, questao18b, questao18c, questao18d,
                        questao18e, questao19);

                FormulariosocioeconomicoDAO.getInstance().salvar(formulariosocioeconomico);
            } else if (operacao.equals("editar")) {
                formulariosocioeconomico = new Formulariosocioeconomico(id, nome, nascimento, sexo, rg, cpf, telefone, 
                        celular, email, rua, complemento, bairro, estado, cidade, numero, cep, rua1, 
                        complemento1, bairro1, estado1, cidade1, numero1, cep1, telefone1, celular1, 
                        curso, ensino, turno, periodo, matricula, anoT, anoI, questao1, questao2, questao3, 
                        questao4, questao5, questao6, questao7, questao8, questao9, questao10, questao11, 
                        questao11a, questao11b, questao11c, questao11d, questao12, questao13, questao14, 
                        questao15, questao16a, questao16b, questao16c, questao16d, questao16e, questao16f, 
                        questao16g, questao16h, questao16i, questao16j, questao16k, questao17a, questao17b, 
                        questao17c, questao17d, questao17e, questao17f, questao17g, questao17h, questao17i, 
                        questao17j, questao17k, questao17l, questao18, questao18a, questao18b, questao18c, questao18d, 
                        questao18e, questao19);
                FormulariosocioeconomicoDAO.getInstance().atualizar(formulariosocioeconomico);
            } else if (operacao.equals("excluir")) {
                formulariosocioeconomico = new Formulariosocioeconomico();
                formulariosocioeconomico.setId(id);
                FormulariosocioeconomicoDAO.getInstance().excluir(formulariosocioeconomico.getId());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaFormularioSocioEconomicoController");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (Exception ex) {
            Logger.getLogger(ManterFormularioSocioEconomicoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
