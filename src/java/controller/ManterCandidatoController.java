/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BolsistacontempladoDAO;
import dao.CandidatoDAO;
import dao.CursoDAO;
import dao.FormulariosocioeconomicoDAO;
import dao.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Candidato;

/**
 *
 * @author Lucas Matias
 */
public class ManterCandidatoController extends HttpServlet {

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
            request.setAttribute("bolsistascontemplados", BolsistacontempladoDAO.getInstance().obterBolsistascontemplados());
            request.setAttribute("cursos", CursoDAO.getInstance().obterCursos());
            request.setAttribute("formulariosSocioEconomicos", FormulariosocioeconomicoDAO.getInstance().obterFormulariosocioeconomicos());
            
            if (!operacao.equals("incluir")) {
                Integer id = Integer.parseInt(request.getParameter("codCandidato"));
                Candidato candidato;
                candidato = CandidatoDAO.getInstance().obterCandidato(id);
                request.setAttribute("candidato", candidato);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterCandidato.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Candidato candidato = null;
        try {
            String operacao = request.getParameter("operacao");

            String nome = request.getParameter("txtNomeCandidato");
            String nascimento = request.getParameter("txtNascimento");
            String logradouro = request.getParameter("txtEndereco");
            String cidade = request.getParameter("txtCidade");
            String estado = request.getParameter("txtEstado");
            String matricula = request.getParameter("txtMatricula");
            int idForm = Integer.parseInt(request.getParameter("optForm"));
            int codCurso = Integer.parseInt(request.getParameter("optCurso"));

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {

                candidato = new Candidato(null, 
                        CursoDAO.getInstance().obterCurso(codCurso), 
                        null, 
                        idForm, nome, nascimento, logradouro, cidade, estado, matricula, nome, estado, cidade);

                CandidatoDAO.getInstance().salvar(candidato);
            } else if (operacao.equals("editar")) {
                candidato.setIdCandidato(idCandidato);
                candidato.setTurno(turno);
                candidato.setCandidato(candidatos);
                candidato.setTotalPeriodos(totalPeriodos);
                CandidatoDAO.getInstance().atualizar(candidato);
            } else if (operacao.equals("excluir")) {
                candidato.setIdCandidato(idCandidato);
                CandidatoDAO.getInstance().excluir(candidato.getId());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCandidatoController");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ManterCandidatoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ManterCandidatoController.class.getName()).log(Level.SEVERE, null, ex);
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
