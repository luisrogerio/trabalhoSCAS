/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BolsaDAO;
import dao.EditalDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bolsa;

/**
 *
 * @author Lucas Matias
 */
public class ManterBolsaController extends HttpServlet {

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
            request.setAttribute("editais", EditalDAO.getInstance().obterEditais());
            if (!operacao.equals("incluir")) {
                Integer id = Integer.parseInt(request.getParameter("codBolsa"));
                Bolsa bolsa;
                bolsa = BolsaDAO.getInstance().obterBolsa(id);
                request.setAttribute("bolsa", bolsa);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterBolsa.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Bolsa bolsa = new Bolsa();
        try {
            String operacao = request.getParameter("operacao");

            Integer id = Integer.parseInt(request.getParameter("txtCodBolsa"));
            String nome = request.getParameter("txtNomeBolsa");
            String carencia = request.getParameter("txtCarencia");
            String tipo = request.getParameter("optTipoBolsa");
            Integer key = Integer.parseInt(request.getParameter("optEdital"));

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {
                bolsa.setId(id);
                bolsa.setNome(nome);
                bolsa.setTipo(tipo);
                bolsa.setCarencia(carencia);
                bolsa.setEdital(EditalDAO.getInstance().obterEdital(key));
                //falta implementar copiar do  
                //bolsa.setEditalid(0);

                BolsaDAO.getInstance().salvar(bolsa);
            } else if (operacao.equals("editar")) {
                bolsa.setId(id);
                bolsa.setNome(nome);
                bolsa.setTipo(tipo);
                bolsa.setCarencia(carencia);
                bolsa.setEdital(EditalDAO.getInstance().obterEdital(key));
                BolsaDAO.getInstance().atualizar(bolsa);
            } else if (operacao.equals("excluir")) {
                bolsa.setId(id);
                BolsaDAO.getInstance().excluir(bolsa.getId());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaBolsaController");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (Exception ex) {
            Logger.getLogger(ManterBolsaController.class.getName()).log(Level.SEVERE, null, ex);
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
