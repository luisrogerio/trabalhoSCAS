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
import model.Bolsa;

/**
 *
 * @author luisr
 */
public class BolsaDAO implements Serializable {

    private BolsaDAO() {
        
    }
    private static BolsaDAO instance = new BolsaDAO();

    public static BolsaDAO getInstance() {
        return instance;
    }

    public void salvar(Bolsa bolsa) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(bolsa);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void atualizar(Bolsa bolsa) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            bolsa = em.merge(bolsa);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = bolsa.getId();
                if (obterBolsa(id) == null) {
                    throw new NonexistentEntityException("The bolsa with id " + id + " no longer exists.");
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
            Bolsa bolsa;
            try {
                bolsa = em.getReference(Bolsa.class, id);
                bolsa.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The bolsa with id " + id + " no longer exists.", enfe);
            }
            em.remove(bolsa);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Bolsa> obterBolsas() {
        return obterBolsas(true, -1, -1);
    }

    public List<Bolsa> obterBolsas(int maxResults, int firstResult) {
        return obterBolsas(false, maxResults, firstResult);
    }

    private List<Bolsa> obterBolsas(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Bolsa.class));
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

    public Bolsa obterBolsa(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Bolsa.class, id);
        } finally {
            em.close();
        }
    }

    public int getBolsaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Bolsa> rt = cq.from(Bolsa.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
