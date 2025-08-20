package com.methods.servlets.hospitalwithservlets.dao;

import com.methods.servlets.hospitalwithservlets.entity.Patient;
import com.methods.servlets.hospitalwithservlets.utils.HibernateConnect;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

public class PatientDAO {

    public void savePatient(Patient patient) {
        Transaction tx = null;
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    public void updatePatient(Patient patient) {
        Transaction tx = null;
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.merge(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    public void deletePatient(int id) {
        Transaction tx = null;
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Patient patient = session.get(Patient.class, id);
            if (patient != null) session.remove(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    public Patient getPatient(int id) {
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            return session.get(Patient.class, id);
        }
    }

    public List<Patient> getAllPatients() {
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            return session.createQuery("from Patient", Patient.class).list();
        }
    }
}
