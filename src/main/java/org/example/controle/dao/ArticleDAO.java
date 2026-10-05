package org.example.controle.dao;

import org.example.controle.model.Article;
import org.example.controle.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class ArticleDAO {

    public List<Article> getAllArticles() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<Article> query = em.createQuery("SELECT a FROM Article a", Article.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public void addArticle(Article article) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(article);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public void updateArticle(Article article) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(article);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public boolean deleteArticle(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Article article = em.find(Article.class, id);
            if (article != null) {
                em.remove(article);
                em.getTransaction().commit();
                return true;
            }
            em.getTransaction().rollback();
            return false;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Article> searchArticles(String description, Double price) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            String jpql = "SELECT a FROM Article a WHERE a.description LIKE :desc";
            if (price != null) {
                jpql += " AND a.price >= :price";
            }

            TypedQuery<Article> query = em.createQuery(jpql, Article.class);
            query.setParameter("desc", "%" + description + "%");
            if (price != null) {
                query.setParameter("price", price);
            }
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}