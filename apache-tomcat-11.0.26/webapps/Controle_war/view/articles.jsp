<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Articles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f4f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand, .nav-link {
            color: #ecf0f1 !important;
        }
        .table thead {
            background-color: #34495e;
            color: white;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .btn-icon {
            display: flex;
            align-items: center;
            gap: 5px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">🧾 Article Manager</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">🏠 Home</a>
                </li>
                <c:if test="${not empty sessionScope.username}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">🔓 Logout (${sessionScope.username})</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">

    <div class="card p-4 mb-4">
        <h4 class="mb-3 text-primary">🔍 Search Articles</h4>
        <form action="${pageContext.request.contextPath}/articles" method="get" class="row g-3">
            <input type="hidden" name="action" value="search">
            <div class="col-md-4">
                <input type="text" class="form-control" name="description" placeholder="🔎 Description">
            </div>
            <div class="col-md-3">
                <input type="number" class="form-control" name="price" placeholder="💰 Min Price" step="0.01">
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-success w-100 btn-icon">Search 🔍</button>
            </div>
        </form>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="text-secondary">📋 Article List</h4>
        <a href="view/addArticle.jsp" class="btn btn-primary btn-icon">➕ Add New</a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead>
            <tr>
                <th>#</th>
                <th>Description</th>
                <th>Price ($)</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="article" items="${articles}">
                <tr>
                    <td><span class="badge bg-dark">${article.id}</span></td>
                    <td>${article.description}</td>
                    <td>${article.price}</td>
                    <td>${article.quantity}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/articles?action=edit&id=${article.id}" class="btn btn-warning btn-sm btn-icon">✏️ Edit</a>
                        <a href="${pageContext.request.contextPath}/articles?action=delete&id=${article.id}" class="btn btn-danger btn-sm btn-icon" onclick="return confirm('Are you sure?');">🗑️ Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
