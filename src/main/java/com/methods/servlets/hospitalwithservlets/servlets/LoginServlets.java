/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.methods.servlets.hospitalwithservlets.servlets;

import com.methods.servlets.hospitalwithservlets.dao.DoctorDAO;
import com.methods.servlets.hospitalwithservlets.dao.PatientDAO;
import com.methods.servlets.hospitalwithservlets.dao.UserDAO;
import com.methods.servlets.hospitalwithservlets.entity.Patient;
import com.methods.servlets.hospitalwithservlets.entity.User;
import com.methods.servlets.hospitalwithservlets.utils.HibernateConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import org.hibernate.Session;

/**
 *
 * @author FAHIM
 */
@WebServlet(name = "LoginServlets", urlPatterns = {"/Login"})
public class LoginServlets extends HttpServlet {
    
 
        UserDAO userDao = new UserDAO();
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
         request.getRequestDispatcher("view/login.jsp").forward(request, response);
        
        
     
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            
             String role = request.getParameter("role");
                
                switch(role){
                
                    case "patient" -> validatePatient(request,response);
                     case "doctor" -> validateDoctor(request,response);
            
                
                }
        
        
        
        
        
        
    }

    private void validatePatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        
                 String username = request.getParameter("name");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        
       
        if (username == null || username.trim().isEmpty() || 
            phone == null || phone.trim().isEmpty()|| date.isEmpty()  )  {
            request.setAttribute("error", "Please enter both Username & Phone & date");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
            
        }
        
        try {
            // Validate user credentials
            if (userDao.validateUser(username,phone,date)) {
                // Get user details
                User user = userDao.getUserByUsername(username.trim());
                
                if (user != null) {
                    // Update last login
                    userDao.updateLastLogin(username.trim());
                    
                    // Create session
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("username", user.getUsername());
                  
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                    
                    // Redirect to dashboard
                    response.sendRedirect(request.getContextPath() + "/patients");
                    
                } else {
                    request.setAttribute("error", "User account not found");
                    request.getRequestDispatcher("view/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("view/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again later.");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
        
        
       
        
    }

    private void validateDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
                 String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Basic validation
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Please enter both username and password");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
           
        }
        
        try {
            // Validate user credentials
            if (userDao.validateUser(username.trim(), password)) {
                // Get user details
                User user = userDao.getUserByUsername(username.trim());
                
                if (user != null) {
                    // Update last login
                    userDao.updateLastLogin(username.trim());
                    
                    // Create session
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("username", user.getUsername());
                  
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                    
                    // Redirect to dashboard
                    response.sendRedirect(request.getContextPath() + "/Dashboard");
                    
                } else {
                    request.setAttribute("error", "User account not found");
                    request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again later.");
            request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
        }
    }
        
        
        
    }
    
    
    


