/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.methods.servlets.hospitalwithservlets.dao;

/**
 *
 * @author Faiyaz
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */






import com.methods.servlets.hospitalwithservlets.entity.User;
import com.methods.servlets.hospitalwithservlets.utils.HibernateConnect;



import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.LocalDateTime;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class UserDAO {
    public User getUserByUsername(String username) {
        try (Session session = HibernateConnect.getSessionFactory().openSession()) {
            return session.createQuery("FROM User WHERE username = :uname", User.class)
                          .setParameter("uname", username)
                          .uniqueResult();
        }
    }
    

      
      
      public boolean validateUser(String username, String password) {
        User user = getUserByUsername(username);
        if (user != null) {
            String hashedPassword = hashPassword(password);
            return hashedPassword.equals(user.getPassword());
        }
        return false;
    }
      public boolean validateUser(String username, String phone,String date) {
        User user = getUserByUsername(username);
        if (user != null && user.getPhone()== phone && user.getDate_of_birth().equals(date)) {
          return true ;
        }
        return false;
    }
    
    public boolean updateLastLogin(String username) {
        Session session = HibernateConnect.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery(
    "UPDATE User SET lastLogin = :lastLogin WHERE username = :username");
            query.setParameter("lastLogin", LocalDateTime.now());
            query.setParameter("username", username);
            int result = query.executeUpdate();
            transaction.commit();
            return result > 0;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean createUser(User user) {
        Session session = HibernateConnect.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            // Hash password before saving
            user.setPassword(hashPassword(user.getPassword()));
            session.save(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
    
    // Simple password hashing - In production, use BCrypt or similar
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
    



    
    

