package org.example.controle.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.logging.Logger;

public class JPAUtil {
    private static final Logger logger = Logger.getLogger(JPAUtil.class.getName());
    private static final EntityManagerFactory emf;

    static {
        try {
            // Initialize the EMF once when class is loaded
            emf = Persistence.createEntityManagerFactory("controlePU");
            logger.info("EntityManagerFactory created successfully");
        } catch (Exception e) {
            logger.severe("Failed to create EntityManagerFactory: " + e.getMessage());
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void shutdown() {
        if (emf != null && emf.isOpen()) {
            emf.close();
            logger.info("EntityManagerFactory closed");
        }
    }
}