package com.methods.servlets.hospitalwithservlets.servlets;

import com.methods.servlets.hospitalwithservlets.dao.PatientDAO;
import com.methods.servlets.hospitalwithservlets.entity.Patient;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/patients")
public class PatientServlet extends HttpServlet {

    private PatientDAO patientDAO = new PatientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("view/add-patient.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Patient patient = patientDAO.getPatient(id);
                request.setAttribute("patient", patient);
                request.getRequestDispatcher("view/edit-patient.jsp").forward(request, response);
                break;
            case "delete":
                int delId = Integer.parseInt(request.getParameter("id"));
                patientDAO.deletePatient(delId);
                response.sendRedirect("patients");
                break;
            default:
                List<Patient> patients = patientDAO.getAllPatients();
                request.setAttribute("patients", patients);
                request.getRequestDispatcher("admin/patient-dashboard.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String disease = request.getParameter("disease");

        if (idStr == null || idStr.isEmpty()) {
            patientDAO.savePatient(new Patient(name, age, gender, contact, disease));
        } else {
            int id = Integer.parseInt(idStr);
            Patient patient = new Patient(name, age, gender, contact, disease);
            patient.setId(id);
            patientDAO.updatePatient(patient);
        }

        response.sendRedirect("patients");
    }
}
