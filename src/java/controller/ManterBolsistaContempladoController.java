/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BolsistacontempladoDAO;
import dao.EditalDAO;
import dao.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bolsistacontemplado;

/**
 *
 * @author Lucas Matias
 */
public class ManterBolsistaContempladoController extends HttpServlet {

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
                Integer id = Integer.parseInt(request.getParameter("id"));
                Bolsistacontemplado bolsistacontemplado;
                bolsistacontemplado = BolsistacontempladoDAO.getInstance().obterBolsistacontemplado(id);
                request.setAttribute("bolsistacontemplado", bolsistacontemplado);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterBolsistaContemplado.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Bolsistacontemplado bolsistacontemplado = null;
        try {
            String operacao = request.getParameter("operacao");
            int id = Integer.parseInt(request.getParameter("txtid"));
            int codEdital = Integer.parseInt(request.getParameter("optEdital"));

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {

                bolsistacontemplado = new Bolsistacontemplado(id, EditalDAO.getInstance().obterEdital(codEdital));

                BolsistacontempladoDAO.getInstance().salvar(bolsistacontemplado);
            } else if (operacao.equals("editar")) {
                bolsistacontemplado = new Bolsistacontemplado(id, EditalDAO.getInstance().obterEdital(codEdital));
                BolsistacontempladoDAO.getInstance().atualizar(bolsistacontemplado);
            } else if (operacao.equals("excluir")) {
                bolsistacontemplado = new Bolsistacontemplado();
                bolsistacontemplado.setId(id);
                BolsistacontempladoDAO.getInstance().excluir(bolsistacontemplado.getId());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaBolsistaContempladoController");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ManterBolsistaContempladoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManterBolsistaContempladoController.class.getName()).log(Level.SEVERE, null, ex);
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
