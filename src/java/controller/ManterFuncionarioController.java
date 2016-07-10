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
public class ManterFuncionarioController extends HttpServlet {

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
            request.setAttribute("formularioSocioeconomico", FormulariosocioeconomicoDAO.getInstance().obterFormulariosocioeconomicos());

            if (!operacao.equals("incluir")) {
                Integer id = Integer.parseInt(request.getParameter("txtCodFormulariosocioeconomico"));
                Formulariosocioeconomico formularioSocioeconomico;
                formularioSocioeconomico = FormulariosocioeconomicoDAO.getInstance().obterFormulariosocioeconomico(id);
                request.setAttribute("formularioSocioeconomico", formularioSocioeconomico);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterFormulariosocioeconomico.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Formulariosocioeconomico formularioSocioeconomico = new Formulariosocioeconomico();
        try {
            String operacao = request.getParameter("operacao");

            Integer codFormulariosocioeconomico = Integer.parseInt(request.getParameter("txtCodFormulariosocioeconomico"));
            Integer data = Integer.parseInt(request.getParameter("txtData"));
            Integer numero = Integer.parseInt(request.getParameter("txtNumero"));
            Integer prazo = Integer.parseInt(request.getParameter("txtPrazo"));
            String publicacao = request.getParameter("txtPublicacao");
            String tipoBolsa = request.getParameter("optTipoBolsa");

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {

                formularioSocioeconomico.setCodFormulariosocioeconomico(codFormulariosocioeconomico);
                formularioSocioeconomico.setData(data);
                formularioSocioeconomico.setNumero(numero);
                formularioSocioeconomico.setPrazo(prazo);
                formularioSocioeconomico.setPublicacao(publicacao);
                formularioSocioeconomico.setTipoBolsa(tipoBolsa);

                FormulariosocioeconomicoDAO.getInstance().salvar(formularioSocioeconomico);
            } else if (operacao.equals("editar")) {
                formularioSocioeconomico.setCodFormulariosocioeconomico(codFormulariosocioeconomico);
                formularioSocioeconomico.setData(data);
                formularioSocioeconomico.setNumero(numero);
                formularioSocioeconomico.setPrazo(prazo);
                formularioSocioeconomico.setPublicacao(publicacao);
                formularioSocioeconomico.setTipoBolsa(tipoBolsa);
                FormulariosocioeconomicoDAO.getInstance().atualizar(formularioSocioeconomico);
            } else if (operacao.equals("excluir")) {
                formularioSocioeconomico.setCodFormulariosocioeconomico(codFormulariosocioeconomico);
                FormulariosocioeconomicoDAO.getInstance().excluir(formularioSocioeconomico.getId());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaEditaisController");
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
