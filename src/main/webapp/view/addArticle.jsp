<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Article</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 600;
        }
        .btn-primary {
            background-color: #4A90E2;
            border: none;
        }
        .btn-secondary {
            background-color: #ccc;
            color: #333;
        }
    </style>
</head>
<body>

<div class="card p-4" style="width: 100%; max-width: 500px;">
    <h3 class="text-center mb-4 text-primary">📝 Add New Article</h3>
    <form action="${pageContext.request.contextPath}/articles" method="post">
        <input type="hidden" name="action" value="add">

        <div class="mb-3">
            <label class="form-label">🖊️ Description</label>
            <input type="text" class="form-control" name="description" placeholder="Enter article description..." required>
        </div>

        <div class="mb-3">
            <label class="form-label">💲 Price</label>
            <input type="number" class="form-control" name="price" step="0.01" placeholder="e.g. 19.99" required>
        </div>

        <div class="mb-3">
            <label class="form-label">📦 Quantity</label>
            <input type="number" class="form-control" name="quantity" placeholder="e.g. 50" required>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">✅ Save</button>
            <a href="${pageContext.request.contextPath}/articles" class="btn btn-secondary">❌ Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
