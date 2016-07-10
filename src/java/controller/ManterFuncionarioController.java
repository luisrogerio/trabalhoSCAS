/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FuncionarioDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;

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

            if (!operacao.equals("incluir")) {
                Integer id = Integer.parseInt(request.getParameter("codFuncionario"));
                Funcionario funcionario;
                funcionario = FuncionarioDAO.getInstance().obterFuncionario(id);
                request.setAttribute("funcionario", funcionario);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterFuncionario.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Funcionario funcionario = null;
        try {
            String operacao = request.getParameter("operacao");

            int idFuncionario = Integer.parseInt(request.getParameter("txtCodFuncionario"));
            int codPessoa = Integer.parseInt(request.getParameter("txtCodFuncionario"));
            String login = request.getParameter("txtLogin");
            String setor = request.getParameter("txtSetor");
            String senha = request.getParameter("txtSenha");
            String gerente = request.getParameter("txtGerente");
            String nome = request.getParameter("txtNomeFuncionario");
            String nascimento = request.getParameter("txtNascimento");
            String logradouro = request.getParameter("txtEndereco");
            String cidade = request.getParameter("txtCidade");
            String estado = request.getParameter("txtEstado");
            String matricula = request.getParameter("txtMatricula");

            /*Professor coordenador = null;
             if(codCoordenador != 0){
             coordenador = ProfessorDAO.getInstance().getProfessor(codCoordenador);
             }*/
            if (operacao.equals("incluir")) {

                funcionario = new Funcionario(setor, gerente, codPessoa, nome, nascimento, logradouro, cidade, estado, matricula, login, senha, senha);

                FuncionarioDAO.getInstance().salvar(funcionario);
            } else if (operacao.equals("editar")) {
                funcionario = new Funcionario(setor, gerente, codPessoa, nome, nascimento, logradouro, cidade, estado, matricula, login, senha, senha);
                FuncionarioDAO.getInstance().atualizar(funcionario);
            } else if (operacao.equals("excluir")) {
                funcionario = new Funcionario();
                funcionario.setIdFuncionario(idFuncionario);
                FuncionarioDAO.getInstance().excluir(funcionario.getIdFuncionario());
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaFuncionarioController");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (Exception ex) {
            Logger.getLogger(ManterFuncionarioController.class.getName()).log(Level.SEVERE, null, ex);
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
