<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.methods.servlets.hospitalwithservlets.entity.Patient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<%
    Patient patient = (Patient) request.getAttribute("patient");
%>

<div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
    <h2 class="text-2xl font-bold mb-6 text-center text-gray-800">Edit Patient</h2>

    <form action="patients" method="post" class="space-y-4">
        <input type="hidden" name="id" value="<%= patient.getId() %>">

        <div>
            <label class="block text-gray-700 font-medium mb-1">Name</label>
            <input type="text" name="name" value="<%= patient.getName() %>"
                   class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                   required>
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Age</label>
            <input type="number" name="age" value="<%= patient.getAge() %>"
                   class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                   required>
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Gender</label>
            <select name="gender" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                <option value="Male" <%= "Male".equals(patient.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(patient.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(patient.getGender()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Contact</label>
            <input type="text" name="contact" value="<%= patient.getContact() %>"
                   class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                   required>
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Disease</label>
            <input type="text" name="disease" value="<%= patient.getDisease() %>"
                   class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                   required>
        </div>

        <div class="flex justify-between mt-6">
            <button type="submit"
                    class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                Update Patient
            </button>
            <a href="patients"
               class="bg-gray-400 text-white px-4 py-2 rounded-lg hover:bg-gray-500 transition">
                Back to List
            </a>
        </div>
    </form>
</div>

</body>
</html>
