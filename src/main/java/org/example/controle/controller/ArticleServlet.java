package org.example.controle.controller;

import org.example.controle.dao.ArticleDAO;
import org.example.controle.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/articles")
public class ArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ArticleDAO articleDAO = new ArticleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        try {
            switch (action != null ? action : "list") {
                case "edit":
                    handleEdit(request, response);
                    break;
                case "delete":
                    handleDelete(request, response);
                    break;
                case "search":
                    handleSearch(request, response);
                    break;
                case "list":
                default:
                    listArticles(request, response);
            }
        } catch (Exception e) {
            handleError(request, response, "Invalid request: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    handleAdd(request, response);
                    break;
                case "update":
                    handleUpdate(request, response);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid action");
            }
        } catch (Exception e) {
            handleError(request, response, "Operation failed: " + e.getMessage());
        }
    }

    private void listArticles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Article> articles = articleDAO.getAllArticles();
        request.setAttribute("articles", articles);
        request.getRequestDispatcher("/view/articles.jsp").forward(request, response);
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Article article = articleDAO.getAllArticles().stream()
                .filter(a -> a.getId() == id)
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Article not found"));
        request.setAttribute("article", article);
        request.getRequestDispatcher("/view/editArticle.jsp").forward(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (!articleDAO.deleteArticle(id)) {
            throw new IllegalArgumentException("Failed to delete article");
        }
        response.sendRedirect("articles");
    }

    private void handleSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        List<Article> articles = articleDAO.searchArticles(description, price);
        request.setAttribute("articles", articles);
        request.getRequestDispatcher("/view/articles.jsp").forward(request, response);
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Article article = createArticleFromRequest(request);
        articleDAO.addArticle(article);
        response.sendRedirect("articles");
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Article article = createArticleFromRequest(request);
        article.setId(Integer.parseInt(request.getParameter("id")));
        articleDAO.updateArticle(article);
        response.sendRedirect("articles");
    }

    private Article createArticleFromRequest(HttpServletRequest request) {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (description == null || description.isBlank()) {
            throw new IllegalArgumentException("Description is required");
        }
        if (price <= 0) {
            throw new IllegalArgumentException("Price must be positive");
        }
        if (quantity < 0) {
            throw new IllegalArgumentException("Quantity cannot be negative");
        }

        return new Article(0, description, price, quantity);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("error", message);
        listArticles(request, response);
    }
}