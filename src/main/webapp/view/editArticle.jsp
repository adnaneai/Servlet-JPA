<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Article</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #ece9e6, #ffffff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            width: 100%;
            max-width: 600px;
            border: none;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
        .form-header {
            text-align: center;
            color: #333;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>

<div class="card p-4">
    <h3 class="form-header">✏️ Edit Article</h3>
    <form action="${pageContext.request.contextPath}/articles" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${article.id}">

        <div class="mb-3">
            <label class="form-label">🖊️ Description</label>
            <input type="text" class="form-control" name="description" value="${article.description}" placeholder="Enter description" required>
        </div>

        <div class="mb-3">
            <label class="form-label">💲 Price</label>
            <input type="number" class="form-control" name="price" value="${article.price}" step="0.01" placeholder="Enter price" required>
        </div>

        <div class="mb-3">
            <label class="form-label">📦 Quantity</label>
            <input type="number" class="form-control" name="quantity" value="${article.quantity}" placeholder="Enter quantity" required>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">💾 Update</button>
            <a href="${pageContext.request.contextPath}/articles" class="btn btn-secondary">❌ Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
