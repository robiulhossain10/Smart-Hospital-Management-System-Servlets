<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.methods.servlets.hospitalwithservlets.entity.Patient" %>

<html>
<head>
    <title>Edit Patient</title>
</head>
<body>
<h2>Edit Patient</h2>
<%
    Patient patient = (Patient) request.getAttribute("patient");
%>
<form action="patients" method="post">
    <input type="hidden" name="id" value="<%= patient.getId() %>">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" value="<%= patient.getName() %>" required></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><input type="number" name="age" value="<%= patient.getAge() %>" required></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <select name="gender" required>
                    <option value="Male" <%= "Male".equals(patient.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(patient.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(patient.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Contact:</td>
            <td><input type="text" name="contact" value="<%= patient.getContact() %>" required></td>
        </tr>
        <tr>
            <td>Disease:</td>
            <td><input type="text" name="disease" value="<%= patient.getDisease() %>" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Update Patient"></td>
        </tr>
    </table>
</form>
<a href="patients">Back to List</a>
</body>
</html>
