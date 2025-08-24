package com.methods.servlets.hospitalwithservlets.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import com.methods.servlets.hospitalwithservlets.dao.PatientDAO;
import com.methods.servlets.hospitalwithservlets.entity.Patient;

@WebServlet("/admin")
public class AdminDashboardServlet extends HttpServlet {

    private PatientDAO patientDAO = new PatientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all patients
        List<Patient> allPatients = patientDAO.getAllPatients();

        // Get last 5 recent patients
        List<Patient> recentPatients = allPatients.size() > 5 
            ? allPatients.subList(allPatients.size() - 5, allPatients.size())
            : allPatients;

        // Total counts
        int totalPatients = allPatients.size();
        int totalDoctors = 5;       // Dummy
        int totalAppointments = 10; // Dummy

        // Set attributes for JSP
        request.setAttribute("totalPatients", totalPatients);
        request.setAttribute("totalDoctors", totalDoctors);
        request.setAttribute("totalAppointments", totalAppointments);
        request.setAttribute("recentPatients", recentPatients);

        // Forward to admin dashboard JSP
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
    }
}
