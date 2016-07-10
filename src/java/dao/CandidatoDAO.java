/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.PersistenceUtil.getEntityManager;
import dao.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Candidato;

/**
 *
 * @author luisr
 */
public class CandidatoDAO implements Serializable {

    private CandidatoDAO() {
        
    }
    private static CandidatoDAO instance = new CandidatoDAO();

    public static CandidatoDAO getInstance() {
        return instance;
    }

    public void salvar(Candidato candidato) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(candidato);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void atualizar(Candidato candidato) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            candidato = em.merge(candidato);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = candidato.getIdCandidato();
                if (obterCandidato(id) == null) {
                    throw new NonexistentEntityException("The candidato with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void excluir(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Candidato candidato;
            try {
                candidato = em.getReference(Candidato.class, id);
                candidato.getIdCandidato();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The candidato with id " + id + " no longer exists.", enfe);
            }
            em.remove(candidato);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Candidato> obterCandidatos() {
        return obterCandidatos(true, -1, -1);
    }

    public List<Candidato> obterCandidatos(int maxResults, int firstResult) {
        return obterCandidatos(false, maxResults, firstResult);
    }

    private List<Candidato> obterCandidatos(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Candidato.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Candidato obterCandidato(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Candidato.class, id);
        } finally {
            em.close();
        }
    }

    public int getCandidatoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Candidato> rt = cq.from(Candidato.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
