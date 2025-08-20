package com.methods.servlets.hospitalwithservlets.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateConnect {

    private static final SessionFactory sessionFactory = buildSessionFactory();

    // SessionFactory build method
    private static SessionFactory buildSessionFactory() {
        try {
            // Hibernate configuration থেকে sessionFactory তৈরি
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");

            return configuration.buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    // Getter
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    // Shutdown
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
