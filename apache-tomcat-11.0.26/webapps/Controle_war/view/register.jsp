<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #fdfbfb, #ebedee);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      font-family: 'Segoe UI', sans-serif;
    }
    .card {
      width: 100%;
      max-width: 500px;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }
    .navbar {
      position: absolute;
      top: 0;
      width: 100%;
      background-color: #2c3e50 !important;
    }
    .navbar-brand, .nav-link {
      color: #fff !important;
    }
    .btn-primary {
      width: 100%;
    }
    .form-label {
      font-weight: 500;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">📝 Register Panel</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/">🏠 Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/login">🔐 Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="card">
  <h3 class="text-center mb-4">🧾 User Registration</h3>
  <form action="${pageContext.request.contextPath}/register" method="post">
    <div class="mb-3">
      <label class="form-label">👤 Username</label>
      <input type="text" name="username" class="form-control" placeholder="Enter username" required>
    </div>
    <div class="mb-3">
      <label class="form-label">🔒 Password</label>
      <input type="password" name="password" class="form-control" placeholder="Enter password" required>
    </div>
    <button type="submit" class="btn btn-primary">Register ➕</button>
  </form>
</div>

</body>
</html>
