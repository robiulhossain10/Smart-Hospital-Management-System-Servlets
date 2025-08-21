<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.methods.servlets.hospitalwithservlets.entity.Patient" %>

<html>
<head>
    <title>Patient List</title>
</head>
<body>
<h2>Patient List</h2>
<a href="patients?action=new">Add New Patient</a>
<br><br>
<table border="1" cellpadding="5" cellspacing="0">
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
            <a href="patients?action=edit&id=<%= p.getId() %>">Edit</a> |
            <a href="patients?action=delete&id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <% 
            }
        }
    %>
</table>
</body>
</html>
