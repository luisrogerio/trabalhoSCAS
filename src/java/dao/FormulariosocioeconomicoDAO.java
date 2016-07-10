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
import model.Formulariosocioeconomico;

/**
 *
 * @author luisr
 */
public class FormulariosocioeconomicoDAO implements Serializable {

    private FormulariosocioeconomicoDAO() {
        
    }
    private static FormulariosocioeconomicoDAO instance = new FormulariosocioeconomicoDAO();

    public static FormulariosocioeconomicoDAO getInstance() {
        return instance;
    }

    public void salvar(Formulariosocioeconomico formulariosocioeconomico) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(formulariosocioeconomico);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (obterFormulariosocioeconomico(formulariosocioeconomico.getId()) != null) {
                throw new PreexistingEntityException("Formulariosocioeconomico " + formulariosocioeconomico + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void atualizar(Formulariosocioeconomico formulariosocioeconomico) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            formulariosocioeconomico = em.merge(formulariosocioeconomico);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = formulariosocioeconomico.getId();
                if (obterFormulariosocioeconomico(id) == null) {
                    throw new NonexistentEntityException("The formulariosocioeconomico with id " + id + " no longer exists.");
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
            Formulariosocioeconomico formulariosocioeconomico;
            try {
                formulariosocioeconomico = em.getReference(Formulariosocioeconomico.class, id);
                formulariosocioeconomico.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The formulariosocioeconomico with id " + id + " no longer exists.", enfe);
            }
            em.remove(formulariosocioeconomico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Formulariosocioeconomico> obterFormulariosocioeconomicos() {
        return obterFormulariosocioeconomicos(true, -1, -1);
    }

    public List<Formulariosocioeconomico> obterFormulariosocioeconomicos(int maxResults, int firstResult) {
        return obterFormulariosocioeconomicos(false, maxResults, firstResult);
    }

    private List<Formulariosocioeconomico> obterFormulariosocioeconomicos(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Formulariosocioeconomico.class));
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

    public Formulariosocioeconomico obterFormulariosocioeconomico(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Formulariosocioeconomico.class, id);
        } finally {
            em.close();
        }
    }

    public int getFormulariosocioeconomicoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Formulariosocioeconomico> rt = cq.from(Formulariosocioeconomico.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
