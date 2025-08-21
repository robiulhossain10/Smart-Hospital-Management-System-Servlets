<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .card { box-shadow: 0 4px 6px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .table th, .table td { vertical-align: middle; }
        .btn-back { margin-bottom: 1rem; }
    </style>
</head>
<body class="container mt-5">

    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">Patient Dashboard</h2>
        <a href="admin/adminDashboard.jsp" class="btn btn-secondary btn-back">← Back to Admin Dashboard</a>
    </div>

    <!-- Add New Patient Button -->
    <div class="mb-4">
        <a href="patients?action=new" class="btn btn-success shadow-sm">+ Add New Patient</a>
    </div>

    <!-- Patients Table Card -->
    <div class="card p-3 mb-5">
        <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle mb-0">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Contact</th>
                        <th>Disease</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${patients}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.age}</td>
                            <td>${p.gender}</td>
                            <td>${p.contact}</td>
                            <td>${p.disease}</td>
                            <td>
                                <a href="patients?action=edit&id=${p.id}" class="btn btn-warning btn-sm shadow-sm">Edit</a>
                                <a href="patients?action=delete&id=${p.id}" class="btn btn-danger btn-sm shadow-sm"
                                   onclick="return confirm('Are you sure you want to delete this patient?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${empty patients}">
                <div class="text-center p-4 text-muted">No patients available</div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
