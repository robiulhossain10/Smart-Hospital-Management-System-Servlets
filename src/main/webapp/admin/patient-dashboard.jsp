<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.methods.servlets.hospitalwithservlets.entity.Patient" %>

<html>
<head>
    <title>Patient Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h2 { text-align: center; }
        table { width: 80%; margin: auto; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        a.button { padding: 5px 10px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px; }
        a.button:hover { background-color: #45a049; }
    </style>
</head>
<body>
<h2>Patient Dashboard</h2>
<div style="text-align: center; margin-bottom: 15px;">
    <a href="patients?action=new" class="button">Add New Patient</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Contact</th>
        <th>Disease</th>
        <th>Actions</th>
    </tr>
    <%
        List<Patient> patients = (List<Patient>) request.getAttribute("patients");
        if (patients != null) {
            for (Patient p : patients) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getAge() %></td>
        <td><%= p.getGender() %></td>
        <td><%= p.getContact() %></td>
        <td><%= p.getDisease() %></td>
        <td>
            <a href="patients?action=edit&id=<%= p.getId() %>" class="button">Edit</a>
            <a href="patients?action=delete&id=<%= p.getId() %>" onclick="return confirm('Are you sure?')" class="button" style="background-color: red;">Delete</a>
        </td>
    </tr>
    <% 
            }
        }
    %>
</table>
</body>
</html>
