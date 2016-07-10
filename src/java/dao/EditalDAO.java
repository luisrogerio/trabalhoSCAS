/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.PersistenceUtil.getEntityManager;
import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Edital;

/**
 *
 * @author luisr
 */
public class EditalDAO implements Serializable {

    private EditalDAO() {

    }
    private static EditalDAO instance = new EditalDAO();

    public static EditalDAO getInstance() {
        return instance;
    }

    public void salvar(Edital edital) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(edital);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (obterEdital(edital.getCodEdital()) != null) {
                throw new PreexistingEntityException("Edital " + edital + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void atualizar(Edital edital) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            edital = em.merge(edital);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = edital.getCodEdital();
                if (obterEdital(id) == null) {
                    throw new NonexistentEntityException("The edital with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void excluir(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Edital edital;
            try {
                edital = em.getReference(Edital.class, id);
                edital.getCodEdital();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The edital with id " + id + " no longer exists.", enfe);
            }
            em.remove(edital);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Edital> obterEditais() {
        return obterEditais(true, -1, -1);
    }

    public List<Edital> obterEditais(int maxResults, int firstResult) {
        return obterEditais(false, maxResults, firstResult);
    }

    private List<Edital> obterEditais(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Edital.class));
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

    public Edital obterEdital(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Edital.class, id);
        } finally {
            em.close();
        }
    }

    public int getEditalCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Edital> rt = cq.from(Edital.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
