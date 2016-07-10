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
import model.Bolsistacontemplado;

/**
 *
 * @author luisr
 */
public class BolsistacontempladoDAO implements Serializable {

    private BolsistacontempladoDAO() {
        
    }
    private static BolsistacontempladoDAO instance = new BolsistacontempladoDAO();

    public static BolsistacontempladoDAO getInstance() {
        return instance;
    }

    public void salvar(Bolsistacontemplado bolsistacontemplado) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(bolsistacontemplado);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (obterBolsistacontemplado(bolsistacontemplado.getId()) != null) {
                throw new PreexistingEntityException("Bolsistacontemplado " + bolsistacontemplado + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void atualizar(Bolsistacontemplado bolsistacontemplado) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            bolsistacontemplado = em.merge(bolsistacontemplado);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = bolsistacontemplado.getId();
                if (obterBolsistacontemplado(id) == null) {
                    throw new NonexistentEntityException("The bolsistacontemplado with id " + id + " no longer exists.");
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
            Bolsistacontemplado bolsistacontemplado;
            try {
                bolsistacontemplado = em.getReference(Bolsistacontemplado.class, id);
                bolsistacontemplado.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The bolsistacontemplado with id " + id + " no longer exists.", enfe);
            }
            em.remove(bolsistacontemplado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Bolsistacontemplado> obterBolsistascontemplados() {
        return obterBolsistascontemplados(true, -1, -1);
    }

    public List<Bolsistacontemplado> obterBolsistascontemplados(int maxResults, int firstResult) {
        return obterBolsistascontemplados(false, maxResults, firstResult);
    }

    private List<Bolsistacontemplado> obterBolsistascontemplados(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Bolsistacontemplado.class));
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

    public Bolsistacontemplado obterBolsistacontemplado(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Bolsistacontemplado.class, id);
        } finally {
            em.close();
        }
    }

    public int getBolsistacontempladoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Bolsistacontemplado> rt = cq.from(Bolsistacontemplado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
